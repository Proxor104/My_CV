SELECT Goods.good_name
FROM Goods
	JOIN Payments ON Goods.good_id = Payments.good
GROUP BY Payments.good
HAVING COUNT(Payments.good) > 1