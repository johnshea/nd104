SELECT
  o.standard_amt_usd,
  SUM(o.standard_amt_usd) OVER (ORDER BY o.occurred_at ASC)
FROM orders AS o;
