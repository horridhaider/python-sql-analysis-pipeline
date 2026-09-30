-- 05 shipping_analysis


-- Average shipping time by ship mode
SELECT
	ship_mode,
	AVG(ship_date - order_date)::numeric(4,2) AS shipping_days 
FROM 
	orders
GROUP BY
	ship_mode;


-- Number of orders with longest shipping times
SELECT
	ship_date - order_date AS shipping_days,
	COUNT(ship_date - order_date) no_of_orders
FROM 
	orders
GROUP BY
	shipping_days
ORDER BY
	shipping_days DESC;


-- Shipping time by region
SELECT
	c.region,
	AVG(ship_date - order_date)::numeric(4,2) AS shipping_days 
FROM 
	customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
	c.region;


-- Sales/profit by ship mode
SELECT
	o.ship_mode,
	SUM(oi.sales) AS total_sales,
	SUM(oi.profit) AS total_profit
FROM
	orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	o.ship_mode
ORDER BY
	total_profit DESC;


-- Which shipping mode is most frequently used?
SELECT
	ship_mode,
	COUNT(ship_mode) AS total_orders
FROM
	orders
GROUP BY
	ship_mode
ORDER BY
	total_orders DESC;


-- Does shipping mode differ by region?
SELECT
	c.region,
	o.ship_mode,
	COUNT(ship_mode) AS total_orders
FROM
	orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY
	c.region, o.ship_mode
ORDER BY
	c.region, total_orders DESC

