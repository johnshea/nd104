-- 1. Provide a table that displays the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
SELECT sr.name AS sales_rep_name, r.name AS region_name, a.name AS account_name
FROM sales_reps AS sr 
JOIN region AS r
ON sr.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = sr.id
WHERE r.name = 'Midwest'
ORDER BY a.name ASC;
