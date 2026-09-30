-- 04_discount_analysis


-- Does higher discount correlate with lower profit?
SELECT
	CORR(discount, profit)::numeric(3,3) AS correlation_coefficient
FROM
	order_items;
-- (Values near 0 = little/no relationship; values above 0.2 or below -0.2 suggest a noticeable positive or negative relationship. and above 0.5 or below -0.5 show strong positive and negative correlations resp.)


-- Average discount by category
SELECT
    p.category,
    AVG(oi.discount)::numeric(4,2) * 100 AS avg_discount
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY avg_discount DESC;


-- Which sub-categories receive the largest discounts on average?
SELECT
    p.sub_category,
    AVG(oi.discount)::numeric(4,2) * 100 AS avg_discount
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.sub_category
ORDER BY avg_discount DESC;


-- Which products have high discounts and negative profit?
SELECT
	p.product_name,
	oi.discount,
	oi.profit
FROM
	products p
JOIN order_items oi ON p.product_id = oi.product_id
WHERE
	oi.discount > 0.5 AND
	oi.profit < 0.0
ORDER BY
	oi.discount DESC, oi.profit ASC;

-- Profit at different discount levels
SELECT 
	discount,
	(SUM(profit)/SUM(sales))::numeric(4,2) AS profit_margin
FROM order_items
GROUP BY
	discount
ORDER BY
	discount;


-- How much sales comes from heavily discounted products?
SELECT 
    'Heavily Discounted' AS discount_type, 
    SUM(sales) AS total_sales 
FROM 
	order_items 
WHERE 
	discount > 0.5

UNION ALL

SELECT 
    'Slightly Discounted' AS discount_type, 
    SUM(sales) AS total_sales 
FROM 
	order_items 
WHERE 
	discount BETWEEN 0.1 AND 0.5;
