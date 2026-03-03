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
