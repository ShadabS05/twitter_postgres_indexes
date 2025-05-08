/*
 * Count the number of English tweets containing the word "coronavirus"
SELECT
    count(*)
FROM tweets
WHERE to_tsvector('english',text)@@to_tsquery('english','coronavirus')
  AND lang='en'
;
*/

SELECT COUNT(*)
FROM tweets_jsonb
WHERE to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text',data->>'text'))@@to_tsquery('english','coronavirus')
AND data->>'lang' = 'en';
