-- 1. Provide a table for all web_events associated with the account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event and the channel for each event. Additionally, you might choose to add a fourth column to ensure only Walmart events were chosen.
SELECT web_events.occurred_at, web_events.channel, accounts.primary_poc, accounts.name
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
WHERE accounts.name = 'Walmart';

-- 2. Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
SELECT region.name AS region_name, sales_reps.name AS sales_rep_name, accounts.name AS account_name
FROM sales_reps
JOIN region
ON sales_reps.region_id = region.id
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
ORDER BY accounts.name ASC;

-- 3. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT orders.total_amt_usd / (orders.total + 0.01) AS unit_price, region.name AS region_name, accounts.name AS account_name
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON sales_reps.region_id = region.id;
