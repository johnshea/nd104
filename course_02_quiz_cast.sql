SELECT
  s.date,
  --CONCAT(SUBSTR(s.date, 7, 4), '-', LEFT(s.date, 2), '-', SUBSTR(s.date, 4, 2), ' ', SUBSTR(s.date, 12)) AS new_date,
  CAST(CONCAT(SUBSTR(s.date, 7, 4), '-', LEFT(s.date, 2), '-', SUBSTR(s.date, 4, 2)) AS DATE)
FROM sf_crime_data AS s
LIMIT 10;