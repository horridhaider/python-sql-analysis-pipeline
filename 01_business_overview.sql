--Business Performance
/*
Total sales
Total profit
Total orders
Total quantity sold
Average order value
Overall profit margin	(Sales/profit by year)
*/

SELECT
	EXTRACT(YEAR FROM o.order_date) AS year,
	EXTRACT(MONTH FROM o.order_date) AS month,
	SUM(oi.sales) AS total_sales,
	SUM(oi.profit) AS total_profit,
	COUNT(DISTINCT oi.order_id) AS total_orders,
	SUM(oi.quantity) AS total_quantity_sold,
	SUM(oi.sales)/COUNT(DISTINCT oi.order_id) AS avg_order_value,
	(SUM(oi.profit)/SUM(oi.sales))*100 AS profit_margin
FROM
	order_items oi
JOIN orders o ON oi.order_id = 	 o.order_id
GROUP BY
	year, month
ORDER BY
	year, month