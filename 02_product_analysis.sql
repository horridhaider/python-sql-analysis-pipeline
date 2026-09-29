-- 02 Product & category performance


-- Best/worst-selling products (sale count)
-- Most/least profitable products (net profit)
SELECT 
	p.product_name,
	COUNT(*) AS sales_count,
    SUM(oi.sales) AS total_sales,
    SUM(oi.profit) AS total_profit
FROM
	order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
	p.product_name
ORDER BY
	total_profit DESC;

-- sales & profit by category
SELECT
	p.category,
	SUM(oi.sales) AS total_sales,
	SUM(oi.profit) AS total_profit
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY
	p.category;

-- sales & profit by sub-category
SELECT
	p.sub_category,
	SUM(oi.sales) AS total_sales,
	SUM(oi.profit) AS total_profit
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY
	p.sub_category
ORDER BY
	total_profit DESC;
	
-- Products with high sales but low/negative profit
SELECT 
	p.product_name,
	COUNT(oi.product_id) AS sales_count,
    SUM(oi.sales) AS total_sales,
	SUM(oi.profit) AS total_profit
FROM
	order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
	p.product_name
ORDER BY
	sales_count DESC,
	total_profit ASC;

-- Products with high profit margin
SELECT 
	p.product_name,
	SUM(oi.profit)/SUM(oi.sales)*100 AS profit_margin,
	COUNT(*) AS sales,
	SUM(oi.profit) AS profit
FROM
	order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
	p.product_id
ORDER BY
	profit_margin DESC;