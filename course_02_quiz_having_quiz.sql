-- 1. How many of the sales reps have more than 5 accounts that they manage?
SELECT sr.name, COUNT(*) AS account_count
FROM accounts AS a
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
GROUP BY sr.name
HAVING COUNT(*) > 5
ORDER BY account_count;

