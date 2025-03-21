SELECT good_type_name
FROM GoodTypes
WHERE good_type_id NOT IN (
		SELECT GoodTypes.good_type_id
		FROM GoodTypes
			JOIN Goods
			JOIN Payments ON GoodTypes.good_type_id = Goods.type
			AND Payments.good = Goods.good_id
		WHERE YEAR(Payments.date) = 2005
	)