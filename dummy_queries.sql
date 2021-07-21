SELECT students.name, email, cohorts.name
FROM students JOIN cohorts;

-- And to make our results look a little bit nicer, we can alias the names.

-- (ln 7) Grabs the student names, student emails, and cohort names
SELECT students.name AS student_name, email, cohorts.name AS cohort_name

-- Every JOIN must also have an ON.
FROM students JOIN cohorts ON cohorts.id = cohort_id;

-- INNER JOIN

-- The kind of JOINing that we've done so far is called an INNER JOIN. In fact, we could rewrite the query to include the INNER keyword. It will produce the exact same results as when we leave the INNER keyword off.

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;

-- An INNER JOIN will only give us rows where there is a match between the two tables. Any students with a cohort_id of NULL will not appear in the results of this kind of join.

-- If the foreign key is NULL, the row will not be included in the result of an INNER JOIN.

-- Most of the time, like 99% of the time, we want to use an INNER JOIN. With a query like this, where we're getting a list of students and their cohort names, we probably don't want to include any students without a cohort. However, there are times when we do want to include data where there isn't a match. In these cases, we have to use an OUTER JOIN.

-- OUTER JOIN

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- This is the same query as before but INNER has been replaced with OUTER.

-- Try running the following OUTER JOIN on the database.

-- We will get the following error message:

-- ERROR:  syntax error at or near "OUTER"

-- Try running the query with each type of join.

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- The LEFT OUTER JOIN will return all of the students, even ones without a cohort_id.

-- The RIGHT OUTER JOIN will return all cohorts, even ones without any students enrolled.

-- The FULL OUTER JOIN will return all cohorts and all students, even when there is no match.

-- An OUTER JOIN will join the tables similarly to an INNER JOIN but will return all results for one of the tables, even when the join condition is not met. For any row where the condition was not met, a row is added with NULL data.

-- This is where the LEFT, RIGHT, and FULL, come in. We use these to specify which table should have all of its rows returned, regardless of the condition being met.

1. FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;
2. FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;
3. FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- The first query will return all students because students is to the LEFT of the word JOIN.

-- The second query will return all of the cohorts because cohorts is to the RIGHT of the word JOIN.

-- The third query will return all rows from both tables, even when there is no match.


-- An OUTER JOIN will join the tables similarly to an INNER JOIN but will return all results for one of the tables, even when the join condition is not met. For any row where the condition was not met, a row is added with NULL data.

-- This is where the LEFT, RIGHT, and FULL, come in. We use these to specify which table should have all of its rows returned, regardless of the condition being met.

1. FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;
2. FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;
3. FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- The first query will return all students because students is to the LEFT of the word JOIN.

-- The second query will return all of the cohorts because cohorts is to the RIGHT of the word JOIN.

-- The third query will return all rows from both tables, even when there is no match.

-- LEFT && RIGHT

-- When we write a LEFT OUTER JOIN or a RIGHT OUTER JOIN, we can omit the word OUTER. In the rest of our examples, we will omit the OUTER keyword.

-- We could also rewrite any RIGHT JOIN as a LEFT JOIN, just by changing the order of the tables. So the following two queries would produce identical results:

1. FROM students LEFT JOIN cohorts ON cohorts.id = cohort_id;
2. FROM cohorts RIGHT JOIN students ON cohorts.id = cohort_id;

FROM students JOIN cohorts ON cohorts.id = cohort_id

-- INNER JOIN

FROM students JOIN cohorts ON cohorts.id = cohort_id

-- Only students that have a cohort_id and only cohorts that have students.

-- LEFT OUTER JOIN

FROM students LEFT JOIN cohorts ON cohorts.id = cohort_id

-- All students and only cohorts that have students. students is the table to the left of the word LEFT.

-- RIGHT OUTER JOIN

FROM students RIGHT JOIN cohorts ON cohorts.id = cohort_id

-- Only students that have a cohort_id and all cohorts. cohorts is the table to the right of the word RIGHT.

-- FULL OUTER JOIN

FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id

-- All students and all cohorts

-- ROLLOVER STUDENTS

-- Select all rollover students.

-- Get the student's name, student's start_date, cohort's name, and cohort's start_date.
-- Alias the column names to be more descriptive.
-- Order by the start date of the cohort.

SELECT students.name, cohorts.name, cohorts.start_date as cohort_start_date, students.start_date as student_start_date
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start_date;