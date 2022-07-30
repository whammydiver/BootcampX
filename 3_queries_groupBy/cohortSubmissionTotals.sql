SELECT cohorts.name, count(assignment_submissions.*) AS total_submissions
  FROM cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assignment_submissions ON students.id = assignment_submissions.student_id
  GROUP BY cohorts.name
  ORDER BY count(assignment_submissions.*) DESC;