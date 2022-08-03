const { Pool } = require('pg');

const pool = new Pool({
  host: 'localhost',
  database: 'bootcampx'
});

const month = process.argv[2];
const records = process.argv[3];
const values = [`%${month}%`, records]
const queryString = `
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(month, records);
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`)
  })
})
.catch(err => console.error('query error', err.stack));
