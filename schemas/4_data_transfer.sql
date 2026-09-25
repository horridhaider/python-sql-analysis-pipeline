-- 1. Load your raw CSV into the temporary staging table
COPY temp_raw_superstore
FROM 'E:\coding\projects\sql\project1\datasets\raw_dataset.csv'
WITH (FORMAT csv, HEADER true);

-- 2. Populate parent table: customers (deduplicated)
INSERT INTO customers (customer_id, customer_name, segment, country, city, state, postal_code, region)
SELECT DISTINCT 
    customer_id, customer_name, segment, country, city, state, postal_code, region
FROM temp_raw_superstore
ON CONFLICT (customer_id) DO NOTHING;

-- 3. Populate parent table: products (deduplicated)
INSERT INTO products (product_id, product_name, category, sub_category)
SELECT DISTINCT 
    product_id, product_name, category, sub_category
FROM temp_raw_superstore
ON CONFLICT (product_id) DO NOTHING;

-- 4. Populate child table: orders (deduplicated)
INSERT INTO orders (order_id, customer_id, order_date, ship_date, ship_mode)
SELECT DISTINCT 
    order_id, customer_id, order_date, ship_date, ship_mode
FROM temp_raw_superstore
ON CONFLICT (order_id) DO NOTHING;

-- 5. Populate child table: order_items
INSERT INTO order_items (row_id, order_id, product_id, sales, quantity, discount, profit)
SELECT 
    row_id, order_id, product_id, sales, quantity, discount, profit
FROM temp_raw_superstore;

-- 6. Clean up temporary table (optional, as temp tables drop automatically when session ends)
DROP TABLE temp_raw_superstore;