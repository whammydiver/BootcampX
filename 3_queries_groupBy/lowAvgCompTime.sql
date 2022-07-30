SELECT 
  students.name as student, 
  avg(assignment_submissions.duration) as average_assignment_duration, 
  avg(assignments.duration) as average_estimated_duration
  FROM students
  JOIN assignment_submissions on assignment_submissions.student_id = students.id
  JOIN assignments on assignments.id = assignment_submissions.assignment_id
  WHERE students.end_date IS NULL 
  GROUP BY student
  HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
  ORDER BY average_assignment_duration;