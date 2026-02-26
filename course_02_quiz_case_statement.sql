-- 1. Write a query to display for each order, the account ID, the total amount of the order, and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.
SELECT o.account_id, o.total_amt_usd, CASE WHEN o.total_amt_usd >= 3000 THEN 'Large' ELSE 'Small' END
FROM orders AS o
ORDER BY o.total_amt_usd;
