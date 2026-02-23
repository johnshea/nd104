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

-- 3. Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
SELECT we.occurred_at, we.channel, a.name
FROM web_events AS we
JOIN accounts AS a
ON a.id = we.account_id
ORDER BY we.occurred_at DESC
LIMIT 1;

-- 4. Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.
SELECT we.channel, count(*)
FROM web_events AS we
GROUP BY we.channel;

-- 5. Who was the primary contact associated with the earliest web_event?
SELECT a.primary_poc
FROM web_events AS we
JOIN accounts AS a
ON a.id = we.account_id
ORDER BY we.occurred_at ASC
LIMIT 1;
