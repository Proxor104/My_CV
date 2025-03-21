SELECT good_name
FROM Goods
WHERE good_id NOT IN (
		SELECT Goods.good_id
		FROM Goods
			Left Join Payments ON Goods.good_id = Payments.good
		WHERE YEAR(Payments.date) = 2005
	)