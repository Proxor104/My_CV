WITH data_(key_, average_age) AS (
	SELECT DISTINCT Customer.customer_key,
		Customer.age
	FROM Customer
		JOIN Purchase
		JOIN Product ON Customer.customer_key = Purchase.customer_key
		AND Purchase.product_key = Product.product_key
		AND Product.name = "Smartwatch"
		AND YEAR(Purchase.date) = 2024
)
SELECT AVG(average_age) as average_age
FROM data_