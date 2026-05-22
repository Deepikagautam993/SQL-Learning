-- =========================================
-- DAY 04 - GROUP BY QUERIES
-- =========================================

CREATE TABLE sales (
    sale_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    region VARCHAR(50),
    sales_amount INT
);

INSERT INTO sales
VALUES
(1, 'Laptop', 'Electronics', 'North', 70000),
(2, 'Phone', 'Electronics', 'South', 50000),
(3, 'Shoes', 'Fashion', 'West', 4000),
(4, 'Watch', 'Accessories', 'North', 8000),
(5, 'Rice Bag', 'Grocery', 'East', 3000),
(6, 'Tablet', 'Electronics', 'South', 60000),
(7, 'Jacket', 'Fashion', 'West', 5000),
(8, 'Headphones', 'Electronics', 'North', 6000),
(9, 'Milk', 'Grocery', 'East', 2000),
(10, 'Bag', 'Fashion', 'South', 3500);

-- =========================================
-- Total Sales by Category
-- =========================================

SELECT
    category,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY category;

-- =========================================
-- Average Sales by Region
-- =========================================

SELECT
    region,
    AVG(sales_amount) AS average_sales
FROM sales
GROUP BY region;

-- =========================================
-- Highest Sale by Category
-- =========================================

SELECT
    category,
    MAX(sales_amount) AS highest_sale
FROM sales
GROUP BY category;

-- =========================================
-- Total Orders by Region
-- =========================================

SELECT
    region,
    COUNT(*) AS total_orders
FROM sales
GROUP BY region;