-- 1. Each company in the accounts table wants to create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
SELECT
  a.primary_poc,
  a.name,
  LOWER(LEFT(a.primary_poc, STRPOS(a.primary_poc, ' ') - 1)) || '.' || LOWER(SUBSTR(a.primary_poc, STRPOS(a.primary_poc, ' ') + 1)) || '@' || LOWER(a.name) || '.com' AS email
FROM accounts AS a;

-- 2. You may have noticed that in the previous solution some of the company names include spaces, which will certainly not work in an email address. See if you can create an email address that will work by removing all of the spaces in the account name, but otherwise, your solution should be just as in question 1. Some helpful documentation on String Functions and Operators(opens in a new tab).
SELECT
  a.primary_poc,
  a.name,
  LOWER(LEFT(a.primary_poc, STRPOS(a.primary_poc, ' ') - 1)) || '.' || LOWER(SUBSTR(a.primary_poc, STRPOS(a.primary_poc, ' ') + 1)) || '@' || REPLACE(LOWER(a.name), ' ', '') || '.com' AS email
FROM accounts AS a;
