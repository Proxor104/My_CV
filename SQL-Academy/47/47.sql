SELECT COUNT(*) as count
FROM Teacher
	JOIN Schedule
	JOIN Class ON Teacher.id = Schedule.teacher
	AND Schedule.class = Class.id
	AND Teacher.last_name = "Krauze"
	AND Schedule.date = "2019.08.30"