SELECT
  DATE_TRUNC('YEAR', o.occurred_at) AS year,
  o.standard_amt_usd,
  SUM(o.standard_amt_usd) OVER (PARTITION BY DATE_TRUNC('YEAR', o.occurred_at) ORDER BY o.occurred_at ASC)
FROM orders AS o;
