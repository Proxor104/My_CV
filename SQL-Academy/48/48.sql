SELECT Class.name,
	COUNT(Class.id) as count
FROM Class
	JOIN Student_in_class ON Class.id = Student_in_class.class
GROUP BY Class.id
ORDER BY count DESC