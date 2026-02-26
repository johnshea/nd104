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

-- 5. We would like to identify top-performing sales reps, which are sales reps associated with more than 200 orders. Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. Place the top salespeople first in your final table.
SELECT
  sr.name AS sales_rep_name,
  COUNT(o.id) AS order_count,
  CASE
    WHEN COUNT(o.id) > 200 THEN 'top'
    ELSE 'not'
  END
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
GROUP BY sr.ID, sr.name
ORDER BY COUNT(o.id) DESC;

-- 6. The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics represented as well. We would like to identify top-performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales across all orders, and a column with top, middle, or low depending on these criteria. Place the top salespeople based on the dollar amount of sales first in your final table. You might see a few upset salespeople by this criteria!
SELECT
  sr.name AS sales_rep_name,
  COUNT(o.id) AS order_count,
  SUM(o.total_amt_usd) AS totals_sales_usd,
  CASE
    WHEN COUNT(o.id) > 200  OR SUM(o.total_amt_usd) > 750000 THEN 'top'
    WHEN COUNT(o.id) > 150  OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
    ELSE 'low'
  END
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
GROUP BY sr.ID, sr.name
ORDER BY SUM(o.total_amt_usd) DESC;
