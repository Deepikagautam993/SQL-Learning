-- =========================================
-- DAY 02 - WHERE CLAUSE PRACTICE
-- =========================================

-- =========================================
-- Create Products Table
-- =========================================

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    stock INT
);

-- =========================================
-- Insert Product Records
-- =========================================

INSERT INTO products
VALUES
(1, 'Laptop', 'Electronics', 70000, 15),
(2, 'Phone', 'Electronics', 50000, 25),
(3, 'Shoes', 'Fashion', 3000, 40),
(4, 'Watch', 'Fashion', 8000, 18),
(5, 'Tablet', 'Electronics', 25000, 12),
(6, 'Bag', 'Accessories', 2000, 35);

-- =========================================
-- Query 1
-- Display products with price greater
-- than 10000
-- =========================================

SELECT *
FROM products
WHERE price > 10000;

-- =========================================
-- Query 2
-- Display electronics products
-- =========================================

SELECT *
FROM products
WHERE category = 'Electronics';

-- =========================================
-- Query 3
-- Display products with stock less
-- than 20
-- =========================================

SELECT *
FROM products
WHERE stock < 20;

-- =========================================
-- Query 4
-- Display fashion products
-- =========================================

SELECT *
FROM products
WHERE category = 'Fashion';

-- =========================================
-- Query 5
-- Display products with price less
-- than 5000
-- =========================================

SELECT *
FROM products
WHERE price < 5000;

-- =========================================
-- Query 6
-- Display accessories products
-- =========================================

SELECT *
FROM products
WHERE category = 'Accessories';

-- =========================================
-- Query 7
-- Display products with stock greater
-- than 20
-- =========================================

SELECT *
FROM products
WHERE stock > 20;