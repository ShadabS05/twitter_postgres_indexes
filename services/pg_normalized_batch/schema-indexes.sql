SET max_parallel_maintenance_workers TO 8;
SET maintenance_work_mem TO '2 GB';

CREATE INDEX problem1 ON tweet_tags(tag, id_tweets);

CREATE INDEX problem2 ON tweet_tags(id_tweets);

CREATE INDEX problem3 ON tweets(id_tweets, lang);

CREATE INDEX problem35 ON tweets(lang);

CREATE INDEX problem4 ON tweets USING gin(to_tsvector('english', text));
