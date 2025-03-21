SELECT DISTINCT name
FROM Passenger
	JOIN Pass_in_trip
	JOIN Trip ON Passenger.id = Pass_in_trip.passenger
	AND Pass_in_trip.trip = Trip.id
WHERE town_to = 'Moscow'
	AND plane = "TU-134"