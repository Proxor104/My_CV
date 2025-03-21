SELECT AVG(unit_price) AS cost
FROM Payments
	JOIN Goods ON Goods.good_id = Payments.good
	AND Goods.good_name LIKE '%caviar'