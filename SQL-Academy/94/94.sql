WITH data_(key_, cust_name, prod_name) AS (
	SELECT DISTINCT Customer.customer_key,
		Customer.name,
		Product.name
	FROM Customer
		JOIN Purchase
		JOIN Product ON Customer.customer_key = Purchase.customer_key
		AND Purchase.product_key = Product.product_key
		AND (
			Product.name = "Laptop"
			OR Product.name = "Monitor"
		)
		AND YEAR(Purchase.date) = 2024
		AND MONTH(Purchase.date) = 3
)
SELECT cust_name as name
FROM data_
GROUP BY key_
HAVING COUNT(*) > 1