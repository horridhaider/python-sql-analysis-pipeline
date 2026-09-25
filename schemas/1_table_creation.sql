-- table creation

CREATE TABLE customers (
  customer_id   VARCHAR(20) PRIMARY KEY,
  customer_name VARCHAR(100),
  segment       VARCHAR(50),
  country      VARCHAR(50),
  city         VARCHAR(100),
  state        VARCHAR(100),
  postal_code  VARCHAR(10),
  region       VARCHAR(20)
);

CREATE TABLE products (
  product_id   VARCHAR(20) PRIMARY KEY,
  product_name VARCHAR(255),
  category     VARCHAR(50),
  sub_category VARCHAR(50)
);

CREATE TABLE orders (
  order_id     VARCHAR(20) PRIMARY KEY,
  customer_id  VARCHAR(20),
  order_date   DATE,
  ship_date    DATE,
  ship_mode    VARCHAR(30),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  row_id      INT PRIMARY KEY,
  order_id    VARCHAR(20),
  product_id  VARCHAR(20),
  sales       DECIMAL(10,2),
  quantity    INT,
  discount    DECIMAL(4,2),
  profit      DECIMAL(10,2),
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);