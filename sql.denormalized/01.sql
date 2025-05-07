/*
 * Count the number of tweets that use #coronavirus
SELECT count(distinct id_tweets)
FROM tweet_tags
WHERE tag='#coronavirus';
*/

SET max_parallel_maintenance_workers TO 80;
SET maintenance_work_mem TO '16 GB';

SELECT COUNT(DISTINCT data ->> 'id') as count
FROM tweets_jsonb
WHERE (
	COALESCE(data->'entities'->'hashtags','[]') ||
        COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
) @> '[{"text":"coronavirus"}]';
