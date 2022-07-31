SELECT count(student_id) as total_requests, students.name
  FROM assistance_requests
  JOIN students ON students.id = student_id
  WHERE students.name = 'Elliot Dickinson'
  GROUP BY students.name;