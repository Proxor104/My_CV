SELECT FLOOR(
		SUM(
			CASE
				WHEN YEAR(birthday) = 2000 THEN 1
				ELSE 0
			END
		) * 100 / COUNT(*)
	) as percent
FROM Student