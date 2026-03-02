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

-- 2. For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?
WITH total_sales_by_region AS (
  SELECT
    r.id,
    r.name AS region_name,
    SUM(o.total_amt_usd) AS sum_total_amt_usd
  FROM orders AS o
  JOIN accounts AS a
  ON o.account_id = a.id
  JOIN sales_reps AS sr
  ON a.sales_rep_id = sr.id
  JOIN region AS r
  ON sr.region_id = r.id
  GROUP BY r.id, r.name
  ORDER BY r.id, r.name DESC
)

, total_order_counts_by_region AS (
  SELECT
    --r.id,
    r.name AS region_name,
    COUNT(o.*) AS count_for_region
  FROM orders AS o
  JOIN accounts AS a
  ON o.account_id = a.id
  JOIN sales_reps AS sr
  ON a.sales_rep_id = sr.id
  JOIN region AS r
  ON sr.region_id = r.id
  GROUP BY r.id, r.name
  ORDER BY r.id, r.name DESC
)

SELECT tocby.region_name, tocby.count_for_region
FROM total_order_counts_by_region AS tocby
JOIN (
  SELECT
    region_name AS subq_region_name
  FROM total_sales_by_region AS tsby
  JOIN (
    SELECT MAX(sum_total_amt_usd)AS max_usd
    FROM total_sales_by_region) subq
    ON tsby.sum_total_amt_usd = subq.max_usd
  ) subq
ON subq.subq_region_name = tocby.region_name;

-- 3. How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?
WITH accounts_sum_standard_qty AS (
  SELECT
    a.id,
    a.name,
    SUM(o.standard_qty) AS sum_standard_qty
  FROM orders AS o
  JOIN accounts AS a
  ON o.account_id = a.id
  GROUP BY a.id, a.name
  ORDER BY SUM(o.standard_qty) DESC
),
accounts_total_purchases AS (
  SELECT
    a.id,
    a.name,
    COUNT(o.*) AS total_purchases
  FROM orders AS o
  JOIN accounts AS a
  ON o.account_id = a.id
  GROUP BY a.id, a.name
  ORDER BY COUNT(o.*) DESC
)

SELECT *
FROM accounts_total_purchases
WHERE total_purchases >
(SELECT actp.total_purchases
FROM accounts_total_purchases AS actp
JOIN (
  SELECT id, name
  FROM accounts_sum_standard_qty AS assq
  WHERE assq.sum_standard_qty = (
    SELECT MAX(sum_standard_qty)
    FROM accounts_sum_standard_qty
  )
) AS subq
ON actp.id = subq.id
AND actp.name = subq.name);

-- 4. For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?
SELECT we.channel, COUNT(we.*)
FROM web_events AS we
WHERE we.account_id = (
  SELECT o.account_id
  FROM orders AS o
  JOIN accounts AS a
  ON o.account_id = a.id
  GROUP BY o.account_id
  ORDER BY SUM(o.total_amt_usd) DESC
  LIMIT 1)
GROUP BY we.channel
ORDER BY COUNT(we.*) DESC;
