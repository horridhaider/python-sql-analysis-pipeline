-- high prorfit product categories and sub-categories

-- category profit
SELECT 
	p.category,
	SUM(oi.profit) AS profit
FROM
	products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY
	p.category
ORDER BY
	profit DESC

-- subcategories profit
SELECT 
	p.sub_category,
	SUM(oi.profit) AS profit
FROM
	products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY
	p.sub_category
ORDER BY
	profit DESC

-- best selling sub-categories
SELECT
	p.sub_category,
	COUNT(oi.order_id) AS sales
FROM 
	order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
	p.sub_category
ORDER BY
	sales DESC