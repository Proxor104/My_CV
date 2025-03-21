SELECT trip,
	COUNT(passenger) as count
FROM Pass_in_trip
GROUP BY trip
ORDER BY count DESC