/*
 * Calculates the languages that use the hashtag #coronavirus
SELECT
    lang,
    count(DISTINCT id_tweets) as count
FROM tweet_tags
JOIN tweets USING (id_tweets)
WHERE tag='#coronavirus'
GROUP BY lang
ORDER BY count DESC,lang;
*/

SELECT data->>'lang' AS lang, COUNT(DISTINCT data->>'id') AS count
FROM tweets_jsonb
WHERE   (
    COALESCE(data->'entities'->'hashtags','[]')
    || COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
  ) @> '[{"text":"coronavirus"}]'
GROUP BY 1
ORDER BY count DESC, lang;

