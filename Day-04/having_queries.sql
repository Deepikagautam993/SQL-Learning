-- =========================================
-- DAY 04 - HAVING CLAUSE
-- =========================================

-- =========================================
-- Categories with Average Sales > 5000
-- =========================================

SELECT
    category,
    AVG(sales_amount) AS average_sales
FROM sales
GROUP BY category
HAVING AVG(sales_amount) > 5000;

-- =========================================
-- Regions with Total Sales > 15000
-- =========================================

SELECT
    region,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(sales_amount) > 15000;

-- =========================================
-- Categories Having More than 2 Orders
-- =========================================

SELECT
    category,
    COUNT(*) AS total_orders
FROM sales
GROUP BY category
HAVING COUNT(*) > 2;