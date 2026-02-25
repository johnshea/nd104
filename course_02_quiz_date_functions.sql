-- 1. Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
SELECT DATE_TRUNC('year', o.occurred_at) AS year, SUM(o.total_amt_usd)
FROM orders AS o
GROUP BY year
ORDER BY year DESC;

-- 2. Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
SELECT DATE_PART('month', o.occurred_at), SUM(o.total_amt_usd)
FROM orders AS o
GROUP BY DATE_PART('month', o.occurred_at)
ORDER BY SUM(o.total_amt_usd) DESC;

-- 3. Which year did Parch & Posey have the greatest sales in terms of the total number of orders? Are all years evenly represented by the dataset?
SELECT DATE_PART('year', o.occurred_at), SUM(o.total_amt_usd)
FROM orders AS o
GROUP BY DATE_PART('year', o.occurred_at)
ORDER BY SUM(o.total_amt_usd) DESC;

-- 4. Which month did Parch & Posey have the greatest sales in terms of the total number of orders? Are all months evenly represented by the dataset?
SELECT DATE_PART('month', o.occurred_at), COUNT(*)
FROM orders AS o
GROUP BY DATE_PART('month', o.occurred_at)
ORDER BY COUNT(*) DESC;

-- 5. In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
SELECT DATE_TRUNC('month', o.occurred_at), SUM(o.gloss_amt_usd)
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
WHERE a.name = 'Walmart'
GROUP BY DATE_TRUNC('month', o.occurred_at)
ORDER BY SUM(o.gloss_amt_usd) DESC;
