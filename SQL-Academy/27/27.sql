SELECT good_type_name,
	SUM(amount * unit_price) AS costs
FROM GoodTypes
	JOIN Goods
	JOIN Payments ON GoodTypes.good_type_id = Goods.type
	AND Goods.good_id = Payments.good
WHERE YEAR(date) = 2005
GROUP BY good_type_id