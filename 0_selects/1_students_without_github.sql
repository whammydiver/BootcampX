SELECT name, id, email, cohort_id
FROM students
WHERE github IS NULL
ORDER BY cohord_id;