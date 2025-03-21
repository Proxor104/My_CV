SELECT ROUND(
		(
			SUM(
				CASE
					WHEN Class.name = '10 A' THEN 1
					ELSE 0
				END
			) * 100.0
		) / COUNT(*),
		4
	) AS percent
FROM Student_in_class
	JOIN Class ON Class.id = Student_in_class.class;