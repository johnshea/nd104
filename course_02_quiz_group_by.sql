-- 1. Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
SELECT o.occurred_at, a.name
FROM orders AS o
JOIN accounts AS a
ON a.id = o.account_id
ORDER BY o.occurred_at ASC
LIMIT 1;

-- 2. Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.
SELECT a.name, SUM(o.total_amt_usd)
FROM orders AS o
JOIN accounts AS A
ON a.id = o.account_id
GROUP BY a.name;
