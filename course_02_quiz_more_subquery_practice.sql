--
SELECT DATE_TRUNC('month', occurred_at)
FROM orders
WHERE DATE_TRUNC('month',occurred_at) =
 (SELECT DATE_TRUNC('month',MIN(occurred_at)) AS min_month
  FROM orders)
ORDER BY occurred_at
LIMIT 1;

--
SELECT
  DATE_TRUNC('month', occurred_at),
  AVG(standard_qty) AS avg_standard_qty,
  AVG(gloss_qty) AS avg_gloss_qty,
  AVG(poster_qty) AS avg_poster_qty
FROM orders
WHERE DATE_TRUNC('month',occurred_at) =
 (SELECT DATE_TRUNC('month',MIN(occurred_at)) AS min_month
  FROM orders)
GROUP BY DATE_TRUNC('month', occurred_at);
