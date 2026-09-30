-- 03 Geographic performance


-- Sales by region
-- Profit by region
SELECT 
	c.region,
	SUM(oi.sales) AS sales,
	SUM(oi.profit) AS profit
FROM 
	customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	c.region;

-- Sales by state
-- Profit by state
SELECT
	c.state,
	SUM(oi.sales) AS sales,
	SUM(oi.profit) AS profit
FROM
	customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	c.state;


-- Top 10 cities by sales
SELECT
	c.city,
	SUM(oi.sales) AS sales
FROM 
	customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	c.city
ORDER BY
	sales DESC
LIMIT 10;

-- Top 10 cities by profit
SELECT
	c.city,
	SUM(oi.profit)  AS profit
FROM 
	customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	c.city
ORDER BY
	profit DESC
LIMIT 10;

-- States generating losses
SELECT
	c.state,
	SUM(oi.sales) AS sales,
	SUM(oi.profit) AS profit
FROM
	customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	c.state
HAVING
	SUM(oi.profit) < 0;

-- Cities generating losses
SELECT
	c.city,
	SUM(oi.sales) AS sales,
	SUM(oi.profit) AS profit
FROM
	customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
	c.city
HAVING
	SUM(oi.profit) < 0;