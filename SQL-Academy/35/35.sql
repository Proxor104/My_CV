SELECT COUNT(DISTINCT classroom) as count
FROM Schedule
WHERE DATEDIFF("2019-09-02", date) = 0