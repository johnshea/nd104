-- 1. For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
SELECT a.name, AVG(o.standard_qty), AVG(o.gloss_qty), AVG(o.poster_qty)
FROM accounts AS a
JOIN orders AS o
ON o.account_id = a.id
GROUP BY a.id, a.name;
