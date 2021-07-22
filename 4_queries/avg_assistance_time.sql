-- Get the average time of an assistance request.

-- Select just a single row here and name it average_assistance_request_duration
-- In Postgres, we can subtract two timestamps to find the duration between them. (timestamp1 - timestamp2)

-- SELECT average_assistance_request_duration, (timestamp1 - timestamp2) AS duration,
-- FROM assistance_requests,
-- ORDER BY duration;

SELECT AVG(completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests;