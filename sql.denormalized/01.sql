/*
 * Count the number of tweets that use #coronavirus
SELECT count(distinct id_tweets)
FROM tweet_tags
WHERE tag='#coronavirus';
*/
SELECT COUNT(DISTINCT data->>'id') AS count
FROM tweets_jsonb
WHERE (
    COALESCE(data->'entities'->'hashtags','[]')|| 
    COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
)@> '[{"text":"coronavirus"}]';
