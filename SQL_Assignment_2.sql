 -- 1) PRODUCTS TABLE
-- ============================================================

CREATE TABLE products (
product_id NUMBER PRIMARY KEY,
product_name VARCHAR2(200) NOT NULL,
category VARCHAR2(100) NOT NULL,
description VARCHAR2(1000),
unit_price NUMBER(10,2) NOT NULL,
stock NUMBER(10) DEFAULT 0,
created_at DATE DEFAULT SYSDATE,
CONSTRAINT chk_product_price CHECK (unit_price > 0),
CONSTRAINT chk_product_stock CHECK (stock >= 0),
CONSTRAINT uq_product_name_cat UNIQUE (product_name, category)
);

-- ============================================================
-- 2) CUSTOMERS TABLE
-- ============================================================

CREATE TABLE customers (
customer_id NUMBER PRIMARY KEY,
first_name VARCHAR2(100) NOT NULL,
last_name VARCHAR2(100) NOT NULL,
email VARCHAR2(320) NOT NULL UNIQUE,
phone VARCHAR2(30),
created_at DATE DEFAULT SYSDATE
);

-- ============================================================
-- 3) ORDERS TABLE
-- ============================================================

CREATE TABLE orders (
order_id NUMBER PRIMARY KEY,
customer_id NUMBER NOT NULL,
order_date DATE DEFAULT SYSDATE,
total_amount NUMBER(12,2) DEFAULT 0,
status VARCHAR2(30) DEFAULT 'PLACED',
CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
REFERENCES customers(customer_id),
CONSTRAINT chk_order_total CHECK (total_amount >= 0)
);

-- ============================================================
-- 4) ORDERDETAILS TABLE
-- ============================================================

CREATE TABLE orderdetails (
order_detail_id NUMBER PRIMARY KEY,
order_id NUMBER NOT NULL,
product_id NUMBER NOT NULL,
quantity NUMBER(10) NOT NULL,
unit_price NUMBER(10,2) NOT NULL,
CONSTRAINT fk_od_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
CONSTRAINT fk_od_product FOREIGN KEY (product_id) REFERENCES products(product_id),
CONSTRAINT chk_quantity CHECK (quantity > 0),
CONSTRAINT chk_unit_price CHECK (unit_price > 0)
);

-- -- ============================================================
-- -- 5) INSERT SAMPLE DATA
-- -- ============================================================

-- PRODUCTS
INSERT INTO products VALUES (1, 'Ultrabook Pro 14', 'Laptop', '14-inch ultrabook, 16GB RAM, 512GB SSD', 89999, 25, SYSDATE);
INSERT INTO products VALUES (2, 'AeroSound Wireless', 'Headphones', 'Over-ear noise-cancelling Bluetooth headset', 7999, 15, SYSDATE);
INSERT INTO products VALUES (3, 'FastCharge 65W', 'Charger', 'USB-C PD 65W fast charger', 1999, 50, SYSDATE);

-- -- CUSTOMERS
INSERT INTO customers VALUES (100, 'Reha', 'Mittal', 'reha.mittal@example.com', '+91-980000000', SYSDATE);
INSERT INTO customers VALUES (101, 'Mishti', 'Sharma', 'mishti.sharma@example.com', '+91-90000000', SYSDATE);

-- ORDERS
INSERT INTO orders (order_id, customer_id, total_amount, status)
VALUES (1, 100, 0, 'PLACED');

INSERT INTO orders (order_id, customer_id, total_amount, status)
VALUES (2, 101, 0, 'PLACED');

-- ORDER DETAILS
INSERT INTO orderdetails VALUES (1, 1, 1, 1, 89999);  
INSERT INTO orderdetails VALUES (2, 1, 3, 2, 1999); 
INSERT INTO orderdetails VALUES (3, 2, 2, 2, 7999);

COMMIT;
