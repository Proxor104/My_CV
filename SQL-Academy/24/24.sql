SELECT FamilyMembers.member_name,
	SUM(Payments.unit_price * Payments.amount) as costs
FROM FamilyMembers
	JOIN Payments ON FamilyMembers.member_id = Payments.family_member
WHERE YEAR(Payments.date) = 2005
	AND MONTH(Payments.date) = 6
GROUP BY FamilyMembers.member_id