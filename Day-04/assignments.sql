-- =========================================
-- DAY 04 ASSIGNMENTS
-- AGGREGATE FUNCTIONS, GROUP BY, HAVING
-- =========================================

-- Total Number of Sales

SELECT COUNT(*)
FROM sales;

-- Total Sales Revenue

SELECT SUM(sales_amount)
FROM sales;

-- Average Sales Amount

SELECT AVG(sales_amount)
FROM sales;

-- Highest Sales Amount

SELECT MAX(sales_amount)
FROM sales;

-- Lowest Sales Amount

SELECT MIN(sales_amount)
FROM sales;

-- Total Sales by Category

SELECT
    category,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY category;

-- Average Sales by Region

SELECT
    region,
    AVG(sales_amount) AS average_sales
FROM sales
GROUP BY region;

-- Categories with High Revenue

SELECT
    category,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(sales_amount) > 10000;