-- Get the total number of assignment submissions for each cohort.

-- Select the cohort name and total submissions.
-- Order the results from greatest to least submissions.

SELECT cohorts.name AS cohort_name, 
COUNT(assignment_submissions.*) AS total_submissions
FROM assignment_submissions
-- JOIN format: table ON 
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY uses first alias ONLY IF not a fxn
GROUP BY cohort_name
-- ORDER BY uses second alias
-- DESC = descending (default is ASC = ascending)
ORDER BY total_submissions DESC;