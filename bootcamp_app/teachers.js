const { Pool } = require('pg');

const pool = new Pool({
  host: 'localhost',
  database: 'bootcampx',
});

const cohortDate = process.argv[2];

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM cohorts
  JOIN students ON cohorts.id = students.cohort_id
  JOIN assistance_requests ON students.id = assistance_requests.student_id
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  WHERE cohorts.name LIKE '%${cohortDate}%';
`)
.then(res => {
  res.rows.forEach(record => {
    console.log(`${record.cohort}: ${record.teacher}`)
  })
})
.catch(err => console.error('query error', err.stack));