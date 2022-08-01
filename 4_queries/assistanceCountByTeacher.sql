SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.id) as total_assistances
  FROM cohorts
  JOIN students ON cohorts.id = students.cohort_id
  JOIN assistance_requests ON students.id = assistance_requests.student_id
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  WHERE cohorts.name = 'JUL02'
  GROUP BY teachers.name, cohorts.name;