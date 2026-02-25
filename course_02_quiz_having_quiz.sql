-- 1. How many of the sales reps have more than 5 accounts that they manage?
SELECT sr.name, COUNT(*) AS account_count
FROM accounts AS a
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
GROUP BY sr.name
HAVING COUNT(*) > 5
ORDER BY account_count;

-- 2. How many accounts have more than 20 orders?
SELECT a.name, COUNT(*) AS order_count
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
GROUP BY a.name
HAVING COUNT(*) > 20
ORDER BY COUNT(*);

-- 3. Which account has the most orders?
SELECT a.name, COUNT(*) AS order_count
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
GROUP BY a.name
ORDER BY COUNT(*) DESC
LIMIT 1;
