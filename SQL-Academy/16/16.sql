SELECT Passenger.name as name,
	COUNT(Pass_in_trip.passenger) as count
FROM Passenger
	LEFT JOIN Pass_in_trip ON Passenger.id = Pass_in_trip.passenger
GROUP BY Passenger.id
HAVING COUNT(Pass_in_trip.passenger) > 0
ORDER BY count DESC,
	name ASC