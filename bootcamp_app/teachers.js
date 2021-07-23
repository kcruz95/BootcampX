const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT DISTINCT (teachers.name) AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
  `;

const cohortName = process.argv[2] || 'JUL02';
// const limit = process.argv[3] || 5;
// // Store all potentially malicious values in an array.
// const values = [`%${cohortName}%`, limit];

pool.query(queryString, cohortName)
.then(res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));