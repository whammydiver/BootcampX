SELECT cohorts.name AS cohort_name, count(students.cohort_id) AS student_count
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING count(students.cohort_id) >= 18
ORDER BY cohorts.name;