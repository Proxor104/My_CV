SELECT Goods.good_name,
	Payments.unit_price
FROM GoodTypes
	JOIN Goods
	JOIN Payments ON GoodTypes.good_type_id = Goods.type
	AND Goods.good_id = Payments.good
WHERE GoodTypes.good_type_name = 'delicacies'
ORDER BY Payments.unit_price DESC
LIMIT 1