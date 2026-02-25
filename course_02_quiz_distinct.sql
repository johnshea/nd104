-- 1. Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT DISTINCT a.name AS account_name, r.name AS region_name
FROM accounts AS a
JOIN sales_reps as sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
ORDER BY account_name, region_name;

-- 2. Have any sales reps worked on more than one account?
SELECT sr.name AS sales_rep_name, COUNT(*) AS accounts_worked
FROM accounts AS a
JOIN sales_reps as sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
GROUP BY sales_rep_name
ORDER BY accounts_worked ASC;
