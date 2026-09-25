-- loading data into tables

COPY customers
FROM 'E:\coding\projects\sql\project1\datasets\customers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'WIN1252');

COPY products
FROM 'E:\coding\projects\sql\project1\datasets\products.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'WIN1252');

COPY orders
FROM 'E:\coding\projects\sql\project1\datasets\orders.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'WIN1252');

COPY order_items
FROM 'E:\coding\projects\sql\project1\datasets\order_items.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'WIN1252');

