SELECT FamilyMembers.member_name as member_name,
	FamilyMembers.status as status,
	IFNULL(SUM(Payments.amount * Payments.unit_price), 0) as costs
FROM FamilyMembers
	LEFT JOIN Payments ON FamilyMembers.member_id = Payments.family_member
WHERE YEAR(Payments.date) = 2005
GROUP BY FamilyMembers.member_id
HAVING costs > 0