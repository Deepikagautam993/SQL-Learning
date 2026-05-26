-- =========================================================
-- DAY 08
-- ADVANCED RUNNING TOTALS & WINDOW ANALYTICS
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. Running Totals
-- 2. Running Average
-- 3. Cumulative Sum
-- 4. Moving Average
-- 5. ROWS BETWEEN
-- 6. PRECEDING
-- 7. FOLLOWING
-- 8. CURRENT ROW
-- 9. UNBOUNDED PRECEDING
-- 10. Rolling Analytics
-- =========================================================



-- =========================================================
-- CREATE SALES TABLE
-- =========================================================

CREATE TABLE sales (
    sale_id INT,
    month_name VARCHAR(20),
    sales_amount INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO sales
VALUES
(1, 'January', 10000),
(2, 'February', 15000),
(3, 'March', 12000),
(4, 'April', 18000),
(5, 'May', 20000),
(6, 'June', 17000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM sales;



-- =========================================================
-- RUNNING TOTAL
-- =========================================================
-- Running Total means:
-- current row + all previous rows
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_total
FROM sales;



-- =========================================================
-- RUNNING AVERAGE
-- =========================================================
-- Running Average means:
-- average of current + previous rows
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_average
FROM sales;



-- =========================================================
-- CUMULATIVE SUM
-- =========================================================
-- Cumulative Sum and Running Total
-- are almost same concepts.
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
    ) AS cumulative_sales
FROM sales;



-- =========================================================
-- ROWS BETWEEN
-- =========================================================
-- Defines calculation frame
-- inside window functions.
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average
FROM sales;



-- =========================================================
-- CURRENT ROW
-- =========================================================
-- Uses only current row value
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN CURRENT ROW
        AND CURRENT ROW
    ) AS current_sales
FROM sales;



-- =========================================================
-- PRECEDING
-- =========================================================
-- PRECEDING means previous rows
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 1 PRECEDING
        AND CURRENT ROW
    ) AS rolling_average
FROM sales;



-- =========================================================
-- FOLLOWING
-- =========================================================
-- FOLLOWING means next rows
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN CURRENT ROW
        AND 1 FOLLOWING
    ) AS future_sales
FROM sales;



-- =========================================================
-- UNBOUNDED PRECEDING
-- =========================================================
-- Uses all previous rows
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_total
FROM sales;



-- =========================================================
-- ROLLING SUM
-- =========================================================
-- Fixed-size rolling calculation
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_sum
FROM sales;



-- =========================================================
-- ROLLING MAXIMUM
-- =========================================================
-- Highest value inside rolling frame
-- =========================================================

SELECT
    month_name,
    sales_amount,
    MAX(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_maximum
FROM sales;



-- =========================================================
-- ROLLING MINIMUM
-- =========================================================
-- Lowest value inside rolling frame
-- =========================================================

SELECT
    month_name,
    sales_amount,
    MIN(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_minimum
FROM sales;



-- =========================================================
-- FUTURE TREND ANALYSIS
-- =========================================================
-- Compare current and next rows
-- =========================================================

SELECT
    month_name,
    sales_amount,
    LEAD(sales_amount) OVER(
        ORDER BY sale_id
    ) AS next_month_sales
FROM sales;



-- =========================================================
-- PREVIOUS TREND ANALYSIS
-- =========================================================
-- Compare current and previous rows
-- =========================================================

SELECT
    month_name,
    sales_amount,
    LAG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS previous_month_sales
FROM sales;



-- =========================================================
-- SALES DIFFERENCE ANALYSIS
-- =========================================================
-- Monthly growth comparison
-- =========================================================

SELECT
    month_name,
    sales_amount,
    sales_amount -
    LAG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS sales_difference
FROM sales;



-- =========================================================
-- MOVING WINDOW ANALYSIS
-- =========================================================
-- Uses rolling frame calculations
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_window_average
FROM sales;



-- =========================================================
-- ADVANCED CUMULATIVE ANALYSIS
-- =========================================================
-- Combines multiple analytics
-- =========================================================

SELECT
    month_name,
    sales_amount,

    SUM(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_total,

    AVG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_average,

    MAX(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_maximum

FROM sales;



-- =========================================================
-- IMPORTANT INTERVIEW CONCEPTS
-- =========================================================
--
-- Running Total:
-- all previous rows included
--
-- Moving Average:
-- fixed rolling window
--
-- PRECEDING:
-- previous rows
--
-- FOLLOWING:
-- next rows
--
-- CURRENT ROW:
-- active row
--
-- UNBOUNDED PRECEDING:
-- all previous rows
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Power BI dashboards
-- - Tableau reporting
-- - Financial analytics
-- - Revenue tracking
-- - Forecasting systems
-- - KPI reporting
-- - Trend analysis
-- - Business intelligence
--
-- =========================================================