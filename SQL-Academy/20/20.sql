SELECT FamilyMembers.status as status,
	FamilyMembers.member_name as member_name,
	SUM(Payments.amount * Payments.unit_price) as costs
FROM FamilyMembers
	JOIN Payments
	JOIN Goods
	JOIN GoodTypes ON FamilyMembers.member_id = Payments.family_member
	AND Payments.good = Goods.good_id
	AND Goods.type = GoodTypes.good_type_id
WHERE GoodTypes.good_type_name = 'entertainment'
GROUP BY FamilyMembers.member_id