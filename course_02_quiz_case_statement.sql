-- 1. Write a query to display for each order, the account ID, the total amount of the order, and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.
SELECT o.account_id, o.total_amt_usd, CASE WHEN o.total_amt_usd >= 3000 THEN 'Large' ELSE 'Small' END
FROM orders AS o
ORDER BY o.total_amt_usd;

-- 2.Write a query to display the number of orders in each of three categories, based on the total number of items in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
SELECT
  o.total,
  CASE
    WHEN o.total < 1000 THEN 'Less than 1000'
    WHEN o.total >= 1000 AND o.total < 2000 THEN 'Between 1000 and 2000'
    ELSE 'At Least 2000'
  END
FROM orders AS o
ORDER BY o.total;
