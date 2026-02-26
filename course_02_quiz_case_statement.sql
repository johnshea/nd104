-- 1. Write a query to display for each order, the account ID, the total amount of the order, and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.
SELECT o.account_id, o.total_amt_usd, CASE WHEN o.total_amt_usd >= 3000 THEN 'Large' ELSE 'Small' END
FROM orders AS o
ORDER BY o.total_amt_usd;

-- 2. Write a query to display the number of orders in each of three categories, based on the total number of items in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
SELECT
  o.total,
  CASE
    WHEN o.total < 1000 THEN 'Less than 1000'
    WHEN o.total >= 1000 AND o.total < 2000 THEN 'Between 1000 and 2000'
    ELSE 'At Least 2000'
  END
FROM orders AS o
ORDER BY o.total;

-- 3. We would like to understand 3 different levels of customers based on the amount associated with their purchases. The top-level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. Provide a table that includes the level associated with each account. You should provide the account name, the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.
SELECT
  a.id,
  a.name,
  SUM(o.total_amt_usd), 
  CASE
    WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200,000'
    WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) <= 200000 THEN '200,000 and 100,000'
    ELSE 'under 100,000'
  END
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
GROUP BY a.id, a.name
ORDER BY SUM(o.total_amt_usd) DESC;

-- 4. We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers listed first.
SELECT
  o.account_id,
  SUM(o.total_amt_usd),
  CASE
    WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200,000'
    WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) <= 200000 THEN '200,000 and 100,000'
    ELSE 'under 100,000'
  END
FROM orders AS o
WHERE DATE_PART('year', o.occurred_at) BETWEEN 2016 AND 2017
GROUP BY o.account_id
ORDER BY SUM(o.total_amt_usd);
