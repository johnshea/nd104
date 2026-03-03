-- 1. Suppose the company wants to assess the performance of all the sales representatives. Each sales representative is assigned to work in a particular region. To make it easier to understand for the HR team, display the concatenated sales_reps.id, ‘_’ (underscore), and region.name as EMP_ID_REGION for each sales representative.
SELECT CONCAT(sr.id, '_', r.name) AS EMP_ID_REGION
FROM sales_reps AS sr
JOIN region AS r
ON sr.region_id = r.id;

-- 2. From the accounts table, display the name of the client, the coordinate as concatenated (latitude, longitude), email id of the primary point of contact as <first letter of the primary_poc><last letter of the primary_poc>@<extracted name and domain from the website>
SELECT
  a.name,
  CONCAT('(', a.lat, ', ', a.long, ')') AS coordinate,
  CONCAT(
    LOWER(LEFT(a.primary_poc, 1)),
    LOWER(RIGHT(a.primary_poc, 1)),
    '@',
    SUBSTR(a.website, 5)
  ) AS email_id
FROM accounts AS a;
