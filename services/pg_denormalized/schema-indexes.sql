SET max_parallel_maintenance_workers TO 80;
SET maintenance_work_mem TO '16 GB';

CREATE INDEX problem1 ON tweets_jsonb USING GIN ((
        COALESCE(data->'entities'->'hashtags','[]') ||
        COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
));

CREATE INDEX problem2 ON tweets_jsonb (
	(data ->> 'id')
);

CREATE INDEX problem3 ON tweets_jsonb ( 
	(data ->> 'lang')
);

CREATE INDEX problem5 ON tweets_jsonb USING GIN (
	to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));
