WITH forth_end(end4) AS (
	SELECT end_pair
	FROM Timepair
	WHERE id = 4
),
second_start(start2) AS (
	SELECT start_pair
	FROM Timepair
	WHERE id = 2
)
SELECT TIMEDIFF(end4, start2) AS time
FROM forth_end,
	second_start