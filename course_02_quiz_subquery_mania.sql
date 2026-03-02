-- 1. Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
WITH total_sales_by_rep AS (
  SELECT
  sr.id,
  sr.name AS sales_rep_name,
  r.name AS region_name,
  SUM(o.total_amt_usd) AS sum_total_amt_usd
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
GROUP BY sr.id, sr.name, r.name
ORDER BY r.name, SUM(o.total_amt_usd) DESC
)

SELECT
  tsby.sales_rep_name,
  tsby.region_name AS r_name_1,
  tsby.sum_total_amt_usd
FROM total_sales_by_rep AS tsby
JOIN (  
  SELECT
    total_sales_by_rep.region_name,
    max(total_sales_by_rep.sum_total_amt_usd) AS max_sum_total_amt_usd
  FROM total_sales_by_rep
  GROUP BY region_name
  ) subq
ON subq.region_name = tsby.region_name
AND subq.max_sum_total_amt_usd = tsby.sum_total_amt_usd;
