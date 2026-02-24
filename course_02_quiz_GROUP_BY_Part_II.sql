-- 1. For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
SELECT a.name, AVG(o.standard_qty), AVG(o.gloss_qty), AVG(o.poster_qty)
FROM accounts AS a
JOIN orders AS o
ON o.account_id = a.id
GROUP BY a.id, a.name;

-- 2. For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type.
SELECT a.name, AVG(o.standard_amt_usd), AVG(o.gloss_amt_usd), AVG(o.poster_amt_usd)
FROM accounts AS a
JOIN orders AS o
ON o.account_id = a.id
GROUP BY a.id, a.name;

-- 3. Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT sr.name, we.channel, COUNT(*)
FROM web_events AS we
JOIN accounts AS a
ON we.account_id = a.id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
GROUP BY sr.name, we.channel
ORDER BY COUNT(*) DESC;
