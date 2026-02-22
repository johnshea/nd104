-- 1. Provide a table that displays the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
SELECT sr.name AS sales_rep_name, r.name AS region_name, a.name AS account_name
FROM sales_reps AS sr 
JOIN region AS r
ON sr.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = sr.id
WHERE r.name = 'Midwest'
ORDER BY a.name ASC;

-- 2. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
SELECT sr.name AS sales_rep_name, r.name AS region_name, a.name AS account_name
FROM sales_reps AS sr 
JOIN region AS r
ON sr.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = sr.id
WHERE r.name = 'Midwest'
  AND sr.name LIKE 'S%'
ORDER BY a.name ASC;

-- 3. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
SELECT sr.name AS sales_rep_name, r.name AS region_name, a.name AS account_name
FROM sales_reps AS sr 
JOIN region AS r
ON sr.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = sr.id
WHERE r.name = 'Midwest'
  AND sr.name LIKE '% K%'
ORDER BY a.name ASC;

-- 4. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).
SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total + 0.01) AS unit_price
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
WHERE o.standard_qty > 100;

-- 5. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01)).
SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total + 0.01) AS unit_price
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
WHERE o.standard_qty > 100
  AND o.poster_qty > 50
ORDER BY o.total_amt_usd/(o.total + 0.01) ASC;

-- 6. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01)).
SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total + 0.01) AS unit_price
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
WHERE o.standard_qty > 100
  AND o.poster_qty > 50
ORDER BY o.total_amt_usd/(o.total + 0.01) DESC;

-- 7. What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT DISTINCT a.name, w.channel
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id
WHERE a.id = 1001;
