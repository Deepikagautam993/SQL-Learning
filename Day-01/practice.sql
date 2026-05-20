-- =========================================
-- SQL PRACTICE QUERIES - DAY 01
-- =========================================

-- =========================================
-- Create Product Table
-- =========================================

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

-- =========================================
-- Insert Product Records
-- =========================================

INSERT INTO products
VALUES
(1, 'Laptop', 'Electronics', 70000),
(2, 'Phone', 'Electronics', 50000),
(3, 'Shoes', 'Fashion', 3000),
(4, 'Watch', 'Fashion', 8000),
(5, 'Tablet', 'Electronics', 25000);

-- =========================================
-- Practice Query 1
-- Display all product records
-- =========================================

SELECT * FROM products;

-- =========================================
-- Practice Query 2
-- Display only product names
-- =========================================

SELECT product_name
FROM products;

-- =========================================
-- Practice Query 3
-- Display product names and prices
-- =========================================

SELECT product_name, price
FROM products;

-- =========================================
-- Practice Query 4
-- Display all electronics products
-- =========================================

SELECT *
FROM products
WHERE category = 'Electronics';

-- =========================================
-- Practice Query 5
-- Display products with price greater
-- than 10000
-- =========================================

SELECT *
FROM products
WHERE price > 10000;

-- =========================================
-- Practice Query 6
-- Display fashion category products
-- =========================================

SELECT *
FROM products
WHERE category = 'Fashion';

-- =========================================
-- Practice Query 7
-- Display products with price less
-- than 50000
-- =========================================

SELECT *
FROM products
WHERE price < 50000;

-- =========================================
-- Practice Query 8
-- Display only category column
-- =========================================

SELECT category
FROM products;