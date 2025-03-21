SELECT DISTINCT Class.name
FROM Teacher
	JOIN Schedule
	JOIN Class ON Teacher.id = Schedule.teacher
	AND Schedule.class = Class.id
	AND Teacher.last_name = "Krauze"