SELECT FLOOR(AVG(TIMESTAMPDIFF(Year, birthday, NOW()))) as age
FROM FamilyMembers