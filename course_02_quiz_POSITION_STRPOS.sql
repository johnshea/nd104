-- 1. Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
SELECT
  a.primary_poc,
  SUBSTR(a.primary_poc, 1, STRPOS(a.primary_poc, ' ') - 1) AS first,
  SUBSTR(a.primary_poc, STRPOS(a.primary_poc, ' ') + 1) AS last
FROM accounts AS a;

-- 2. Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.
SELECT
  sr.name,
  SUBSTR(sr.name, 1, STRPOS(sr.name, ' ') - 1) AS first,
  SUBSTR(sr.name, STRPOS(sr.name, ' ') + 1) AS last
FROM sales_reps AS sr;
