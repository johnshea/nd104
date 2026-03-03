-- 1. Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
SELECT
  a.primary_poc,
  SUBSTR(a.primary_poc, 1, STRPOS(a.primary_poc, ' ') - 1) AS first,
  SUBSTR(a.primary_poc, STRPOS(a.primary_poc, ' ') + 1) AS last
FROM accounts AS a;
