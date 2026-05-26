-- =========================================================
-- DAY 08
-- ADVANCED FRAME CLAUSES
-- =========================================================

-- =========================================================
-- INTRODUCTION
-- =========================================================
-- Frame Clauses define:
-- which rows participate
-- inside window calculations.
--
-- Most Common Syntax:
--
-- ROWS BETWEEN start AND end
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE company_sales (
    sale_id INT,
    month_name VARCHAR(20),
    sales_amount INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO company_sales
VALUES
(1, 'January', 30000),
(2, 'February', 42000),
(3, 'March', 38000),
(4, 'April', 50000),
(5, 'May', 55000),
(6, 'June', 60000),
(7, 'July', 65000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM company_sales;



-- =========================================================
-- CURRENT ROW
-- =========================================================
-- Uses only current row
-- =========================================================

SELECT
    month_name,
    sales_amount,

    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN CURRENT ROW
        AND CURRENT ROW
    ) AS current_row_sales

FROM company_sales;



-- =========================================================
-- 1 PRECEDING
-- =========================================================
-- Uses previous row + current row
-- =========================================================

SELECT
    month_name,
    sales_amount,

    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 1 PRECEDING
        AND CURRENT ROW
    ) AS previous_current_average

FROM company_sales;



-- =========================================================
-- 2 PRECEDING
-- =========================================================
-- Uses previous 2 rows + current row
-- =========================================================

SELECT
    month_name,
    sales_amount,

    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_sum

FROM company_sales;



-- =========================================================
-- CURRENT ROW TO FOLLOWING
-- =========================================================
-- Uses current row + next row
-- =========================================================

SELECT
    month_name,
    sales_amount,

    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN CURRENT ROW
        AND 1 FOLLOWING
    ) AS future_sales

FROM company_sales;



-- =========================================================
-- CURRENT ROW TO 2 FOLLOWING
-- =========================================================
-- Uses current row + next 2 rows
-- =========================================================

SELECT
    month_name,
    sales_amount,

    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN CURRENT ROW
        AND 2 FOLLOWING
    ) AS future_average

FROM company_sales;



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
    ) AS cumulative_sales

FROM company_sales;



-- =========================================================
-- RUNNING MAXIMUM
-- =========================================================
-- Highest sales till current row
-- =========================================================

SELECT
    month_name,
    sales_amount,

    MAX(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_maximum

FROM company_sales;



-- =========================================================
-- RUNNING MINIMUM
-- =========================================================
-- Lowest sales till current row
-- =========================================================

SELECT
    month_name,
    sales_amount,

    MIN(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_minimum

FROM company_sales;



-- =========================================================
-- MOVING AVERAGE
-- =========================================================
-- Fixed-size rolling average
-- =========================================================

SELECT
    month_name,
    sales_amount,

    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average

FROM company_sales;



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

FROM company_sales;



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

FROM company_sales;



-- =========================================================
-- ADVANCED TREND ANALYSIS
-- =========================================================
-- Compare current and previous sales
-- =========================================================

SELECT
    month_name,
    sales_amount,

    LAG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS previous_sales,

    sales_amount -
    LAG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS sales_growth

FROM company_sales;



-- =========================================================
-- FUTURE TREND ANALYSIS
-- =========================================================
-- Compare current and future sales
-- =========================================================

SELECT
    month_name,
    sales_amount,

    LEAD(sales_amount) OVER(
        ORDER BY sale_id
    ) AS next_sales,

    LEAD(sales_amount) OVER(
        ORDER BY sale_id
    ) - sales_amount AS future_growth

FROM company_sales;



-- =========================================================
-- COMBINED FRAME ANALYTICS
-- =========================================================
-- Real-world dashboard analytics
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
    ) AS running_maximum,

    MIN(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_minimum,

    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average

FROM company_sales;



-- =========================================================
-- IMPORTANT FRAME CLAUSE STRUCTURES
-- =========================================================
--
-- CURRENT ROW:
-- current active row
--
-- PRECEDING:
-- previous rows
--
-- FOLLOWING:
-- next rows
--
-- UNBOUNDED PRECEDING:
-- all previous rows
--
-- =========================================================



-- =========================================================
-- IMPORTANT INTERVIEW DIFFERENCES
-- =========================================================
--
-- Running Total:
-- cumulative calculation
--
-- Moving Average:
-- rolling calculation
--
-- PRECEDING:
-- backward analysis
--
-- FOLLOWING:
-- future analysis
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Financial analytics
-- - Revenue forecasting
-- - KPI reporting
-- - Dashboard systems
-- - Business intelligence
-- - Trend analysis
-- - Stock market analysis
-- - Time-series analytics
--
-- =========================================================