-- 1. In the accounts table, there is a column holding the website for each company. The last three digits specify what type of web address they are using. A list of extensions (and pricing) is provided iwantmyname.com(opens in a new tab). Pull these extensions and provide how many of each website type exist in the accounts table.
SELECT RIGHT(website, 3), COUNT(*)
FROM accounts
GROUP BY RIGHT(website, 3)
ORDER BY COUNT(*) DESC;

-- 2. There is much debate about how much the name (or even the first letter of a company name)(opens in a new tab) matters. Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (or number).
SELECT LEFT(name, 1), COUNT(*)
FROM accounts
GROUP BY LEFT(name, 1)
ORDER BY COUNT(*) DESC;

-- 3. Use the accounts table and a CASE statement to create two groups: one group of company names that start with a number and the second group of those company names that start with a letter. What proportion of company names start with a letter?
SELECT
  CASE
    WHEN LEFT(name, 1) = '0' THEN 'Number'
    WHEN LEFT(name, 1) = '1' THEN 'Number'
    WHEN LEFT(name, 1) = '2' THEN 'Number'
    WHEN LEFT(name, 1) = '3' THEN 'Number'
    WHEN LEFT(name, 1) = '4' THEN 'Number'
    WHEN LEFT(name, 1) = '5' THEN 'Number'
    WHEN LEFT(name, 1) = '6' THEN 'Number'
    WHEN LEFT(name, 1) = '7' THEN 'Number'
    WHEN LEFT(name, 1) = '8' THEN 'Number'
    WHEN LEFT(name, 1) = '9' THEN 'Number'
    ELSE 'Letter'
  END,
  COUNT(*)
FROM accounts
GROUP BY 1;
