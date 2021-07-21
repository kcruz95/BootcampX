-- The same query as assignments_by_day, but only return rows where total assignments is greater than or equal to 10.

SELECT day, COUNT(assignments) as total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(assignments) >= 10
ORDER BY day;

-- SELECT day, count(*) as total_assignments 
-- FROM assignments
-- GROUP BY day
-- HAVING count(*) >= 10
-- ORDER BY day;
