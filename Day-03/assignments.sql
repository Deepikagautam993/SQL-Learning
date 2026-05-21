-- =========================================
-- DAY 03 ASSIGNMENTS
-- ORDER BY, LIMIT & DISTINCT
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
(4, 'Watch', 'Accessories', 8000, 18),
(5, 'Tablet', 'Electronics', 25000, 12),
(6, 'Bag', 'Fashion', 2000, 30),
(7, 'Headphones', 'Electronics', 6000, 22),
(8, 'Jacket', 'Fashion', 4500, 10);

-- =========================================
-- Sort Products by Price Ascending
-- =========================================

SELECT *
FROM products
ORDER BY price ASC;

-- =========================================
-- Sort Products by Price Descending
-- =========================================

SELECT *
FROM products
ORDER BY price DESC;

-- =========================================
-- Sort Product Names Alphabetically
-- =========================================

SELECT *
FROM products
ORDER BY product_name ASC;

-- =========================================
-- Top 3 Expensive Products
-- =========================================

SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;

-- =========================================
-- Highest Price Product
-- =========================================

SELECT *
FROM products
ORDER BY price DESC
LIMIT 1;

-- =========================================
-- Lowest Stock Product
-- =========================================

SELECT *
FROM products
ORDER BY stock ASC
LIMIT 1;

-- =========================================
-- Display Unique Categories
-- =========================================

SELECT DISTINCT category
FROM products;

-- =========================================
-- Display Unique Prices
-- =========================================

SELECT DISTINCT price
FROM products;

-- =========================================
-- Display Unique Stock Values
-- =========================================

SELECT DISTINCT stock
FROM products;

-- =========================================
-- Top 2 Products with Highest Stock
-- =========================================

SELECT *
FROM products
ORDER BY stock DESC
LIMIT 2;