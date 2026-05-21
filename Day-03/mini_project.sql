-- =========================================
-- MINI PROJECT - E-COMMERCE PRODUCT ANALYTICS SYSTEM
-- =========================================

-- =========================================
-- Create Ecommerce Products Table
-- =========================================

CREATE TABLE ecommerce_products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    brand VARCHAR(50),
    price INT,
    stock INT
);

-- =========================================
-- Insert Product Records
-- =========================================

INSERT INTO ecommerce_products
VALUES
(1, 'Laptop', 'Electronics', 'HP', 70000, 15),
(2, 'Phone', 'Electronics', 'Samsung', 50000, 25),
(3, 'Shoes', 'Fashion', 'Nike', 3000, 40),
(4, 'Watch', 'Accessories', 'Titan', 8000, 18),
(5, 'Tablet', 'Electronics', 'Apple', 60000, 10),
(6, 'Bag', 'Fashion', 'Skybags', 2000, 35),
(7, 'Headphones', 'Electronics', 'Boat', 4000, 50),
(8, 'Jacket', 'Fashion', 'Puma', 4500, 12);

-- =========================================
-- Display All Products
-- =========================================

SELECT *
FROM ecommerce_products;

-- =========================================
-- Sort Products by Price Descending
-- =========================================

SELECT *
FROM ecommerce_products
ORDER BY price DESC;

-- =========================================
-- Top 3 Expensive Products
-- =========================================

SELECT *
FROM ecommerce_products
ORDER BY price DESC
LIMIT 3;

-- =========================================
-- Lowest Stock Products
-- =========================================

SELECT *
FROM ecommerce_products
ORDER BY stock ASC;

-- =========================================
-- Display Unique Categories
-- =========================================

SELECT DISTINCT category
FROM ecommerce_products;

-- =========================================
-- Display Unique Brands
-- =========================================

SELECT DISTINCT brand
FROM ecommerce_products;

-- =========================================
-- Highest Stock Product
-- =========================================

SELECT *
FROM ecommerce_products
ORDER BY stock DESC
LIMIT 1;

-- =========================================
-- Lowest Price Product
-- =========================================

SELECT *
FROM ecommerce_products
ORDER BY price ASC
LIMIT 1;