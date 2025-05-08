SET max_parallel_maintenance_workers TO 8;
SET maintenance_work_mem TO '1 GB';

/*
CREATE INDEX problem1 ON tweets_jsonb USING gin ((
    COALESCE((data -> 'entities' -> 'hashtags'), '[]'::jsonb) ||
    COALESCE((data -> 'extended_tweet' -> 'entities' -> 'hashtags'), '[]'::jsonb)
));

CREATE INDEX problem_11edit ON tweets_jsonb USING GIN ((
        COALESCE(data->'entities'->'hashtags')
));

CREATE INDEX problem_12edit ON tweets_jsonb USING GIN ((
        COALESCE(data->'extended_tweet'->'entities'->'hashtags')
));
*/

CREATE INDEX problem_11 ON tweets_jsonb USING GIN ((
        data->'entities'->'hashtags'
));

CREATE INDEX problem_12 ON tweets_jsonb USING GIN ((
        data->'extended_tweet'->'entities'->'hashtags'
));

CREATE INDEX problem21 ON tweets_jsonb (
	(data ->> 'id')
);

CREATE INDEX problem31 ON tweets_jsonb ( 
	(data ->> 'lang')
);

CREATE INDEX problem51 ON tweets_jsonb USING GIN (
	to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));
