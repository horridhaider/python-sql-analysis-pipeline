SELECT
	TO_CHAR(o.order_date, '2017-MM') AS month,
	SUM(oi.profit) AS total_profit
FROM 
	orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	month
ORDER BY
	total_profit DESC
LIMIT 3
