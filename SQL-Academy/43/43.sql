SELECT last_name
FROM Teacher
	JOIN Schedule
	JOIN Subject ON Teacher.id = Schedule.teacher
	AND Schedule.subject = Subject.id
	AND Subject.name = "Physical Culture"
ORDER BY last_name ASC