-- top most repeated customers

SELECT 
	o.customer_id,
	COUNT(*) AS total_orders,
	c.customer_name,
	c.segment,
	c.country,
	c.city,
	c.state,
	c.postal_code,
	c.region
FROM
	orders o
LEFT JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	o.customer_id,
	c.customer_name,
	c.segment,
	c.country,
	c.city,
	c.state,
	c.postal_code,
	c.region
ORDER BY
	total_orders DESC
LIMIT 10;



-- top most profitable customers
SELECT 
	o.customer_id,
	SUM(oi.profit) AS total_profit,
	c.customer_name,
	c.country,
	c.state,
	c.city,
	c.postal_code,
	c.region
FROM
	customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 
	o.customer_id,
	c.customer_name,
	c.country,
	c.state,
	c.city,
	c.postal_code,
	c.region
ORDER BY 
	total_profit DESC
LIMIT 10;