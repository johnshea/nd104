--
WITH account_counts AS (
  SELECT we.account_id, we.channel, COUNT(*) AS channel_count
  FROM web_events AS we
  GROUP BY we.account_id, we.channel
  ORDER BY we.account_id, COUNT(*) DESC
)

SELECT ac1.account_id, ac1.channel, ac1.channel_count
FROM account_counts AS ac1
JOIN (
SELECT ac.account_id, MAX(ac.channel_count) AS max_channel_count
FROM account_counts AS ac
GROUP BY ac.account_id) AS subq
ON ac1.account_id = subq.account_id
AND ac1.channel_count = subq.max_channel_count
ORDER BY ac1.account_id ASC;
