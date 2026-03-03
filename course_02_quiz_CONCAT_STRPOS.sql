-- 1. Each company in the accounts table wants to create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
SELECT
  a.primary_poc,
  a.name,
  LOWER(LEFT(a.primary_poc, STRPOS(a.primary_poc, ' ') - 1)) || '.' || LOWER(SUBSTR(a.primary_poc, STRPOS(a.primary_poc, ' ') + 1)) || '@' || LOWER(a.name) || '.com' AS email
FROM accounts AS a;
