CREATE TABLE session (
     id SERIAL PRIMARY KEY,
     user_id BIGINT,
     login_time TIMESTAMP NOT NULL,
     logout_time TIMESTAMP
);

-- Generate random data for the Session table
INSERT INTO session (user_id, login_time, logout_time)
SELECT
    ROUND(RANDOM() * 1000) AS user_id,
    login_time,
    CASE WHEN RANDOM() < 0.8 THEN login_time + (RANDOM() * INTERVAL '2 hours') ELSE NULL END AS logout_time
FROM (
     SELECT
             TIMESTAMP '2023-08-01' + (RANDOM() * (TIMESTAMP '2023-09-01' - TIMESTAMP '2023-08-01')) AS login_time
     FROM generate_series(1, 10000000)
) AS random_login;