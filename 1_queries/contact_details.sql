-- SELECT name, id, cohort_id
-- FROM students
-- WHERE email OR phone_number IS NULL

SELECT name, id, cohort_id
FROM students
WHERE email IS NULL
OR phone IS NULL;