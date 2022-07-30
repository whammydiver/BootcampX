SELECT sum(assignments.duration)
  FROM assignments
  JOIN cohorts ON assignments.name = cohorts.name
  WHERE cohorts.id = 'FEB12';