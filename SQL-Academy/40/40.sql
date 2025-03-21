SELECT Subject.name as subjects
FROM Teacher
	JOIN Schedule
	JOIN Subject ON Teacher.id = Schedule.teacher
	AND Schedule.subject = Subject.id
	AND Teacher.last_name LIKE "Romashkin"
	AND Teacher.first_name LIKE "P%"
	AND Teacher.middle_name LIKE "P%"