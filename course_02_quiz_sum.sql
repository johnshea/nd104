-- 1. Find the total amount of poster_qty paper ordered in the orders table.
SELECT sum(poster_qty)
FROM orders;

-- 2. Find the total amount of standard_qty paper ordered in the orders table.
SELECT sum(standard_qty)
FROM orders;

-- 3. Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT sum(total_amt_usd)
FROM orders;

-- 4. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a dollar amount for each order in the table.
SELECT id, standard_amt_usd + gloss_amt_usd AS total_amount_spent
FROM orders;

-- 5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both aggregation and a mathematical operator.
SELECT sum(standard_amt_usd) / sum(standard_qty) AS amount_per_unit
FROM orders;
