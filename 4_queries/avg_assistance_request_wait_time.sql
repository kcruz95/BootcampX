-- We need to know the average amount of time that students are waiting for an assistance request. This is the duration between an assistance request being created, and it being started.

-- Calculate the average time it takes to start an assistance request.

-- Return just a single column here.

-- SELECT students.name, AVG(completed_at - started_at) AS average_waiting_time,
-- FROM assistance_requests,
-- JOIN students ON

SELECT AVG(started_at-created_at) AS average_wait_time
FROM assistance_requests;