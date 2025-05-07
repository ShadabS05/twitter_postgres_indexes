/*
 * Count the number of English tweets containing the word "coronavirus"
SELECT
    count(*)
FROM tweets
WHERE to_tsvector('english',text)@@to_tsquery('english','coronavirus')
  AND lang='en'
;
*/
SET max_parallel_maintenance_workers TO 80;
SET maintenance_work_mem TO '16 GB';

SELECT COUNT(*)
FROM tweets_jsonb
WHERE to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text',data->>'text'))@@to_tsquery('english','coronavirus')
AND data->>'lang' = 'en';
