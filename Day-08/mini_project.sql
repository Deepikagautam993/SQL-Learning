-- =========================================================
-- DAY 08 MINI PROJECT
-- SALES TREND & KPI ANALYTICS DASHBOARD
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
--
-- This project demonstrates:
--
-- 1. Running Totals
-- 2. Running Average
-- 3. Rolling Sum
-- 4. Moving Average
-- 5. Trend Analysis
-- 6. Future Forecasting
-- 7. KPI Analytics
-- 8. Frame Clauses
-- 9. Window Functions
-- 10. Dashboard Reporting
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE company_revenue (
    month_id INT,
    month_name VARCHAR(20),
    revenue INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO company_revenue
VALUES
(1, 'January', 50000),
(2, 'February', 55000),
(3, 'March', 53000),
(4, 'April', 60000),
(5, 'May', 65000),
(6, 'June', 70000),
(7, 'July', 72000),
(8, 'August', 68000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM company_revenue;



-- =========================================================
-- KPI DASHBOARD QUERY
-- =========================================================
--
-- This query creates:
-- - Running Total
-- - Running Average
-- - Running Maximum
-- - Running Minimum
-- - Revenue Growth
-- - Future Revenue
-- - Rolling Average
--
-- =========================================================

SELECT
    month_name,
    revenue,

    -- Running Total
    SUM(revenue) OVER(
        ORDER BY month_id
    ) AS running_total,

    -- Running Average
    AVG(revenue) OVER(
        ORDER BY month_id
    ) AS running_average,

    -- Running Maximum
    MAX(revenue) OVER(
        ORDER BY month_id
    ) AS running_maximum,

    -- Running Minimum
    MIN(revenue) OVER(
        ORDER BY month_id
    ) AS running_minimum,

    -- Previous Revenue
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS previous_revenue,

    -- Revenue Growth
    revenue -
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS revenue_growth,

    -- Future Revenue
    LEAD(revenue) OVER(
        ORDER BY month_id
    ) AS future_revenue,

    -- Rolling Average
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_average

FROM company_revenue;



-- =========================================================
-- CUMULATIVE REVENUE ANALYSIS
-- =========================================================
--
-- Tracks cumulative business growth
--
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_revenue

FROM company_revenue;



-- =========================================================
-- MOVING WINDOW ANALYSIS
-- =========================================================
--
-- Rolling window analytics
-- using previous 2 rows
--
-- =========================================================

SELECT
    month_name,
    revenue,

    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average,

    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_sum

FROM company_revenue;



-- =========================================================
-- REVENUE TREND ANALYSIS
-- =========================================================
--
-- Compare current and previous revenue
--
-- =========================================================

SELECT
    month_name,
    revenue,

    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS previous_revenue,

    revenue -
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS revenue_difference

FROM company_revenue;



-- =========================================================
-- FUTURE FORECAST ANALYSIS
-- =========================================================
--
-- Compare current and future revenue
--
-- =========================================================

SELECT
    month_name,
    revenue,

    LEAD(revenue) OVER(
        ORDER BY month_id
    ) AS next_month_revenue,

    LEAD(revenue) OVER(
        ORDER BY month_id
    ) - revenue AS future_growth

FROM company_revenue;



-- =========================================================
-- RUNNING MAXIMUM ANALYSIS
-- =========================================================
--
-- Highest revenue till current month
--
-- =========================================================

SELECT
    month_name,
    revenue,

    MAX(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_maximum

FROM company_revenue;



-- =========================================================
-- RUNNING MINIMUM ANALYSIS
-- =========================================================
--
-- Lowest revenue till current month
--
-- =========================================================

SELECT
    month_name,
    revenue,

    MIN(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_minimum

FROM company_revenue;



-- =========================================================
-- ROLLING MAXIMUM ANALYSIS
-- =========================================================
--
-- Highest revenue inside rolling frame
--
-- =========================================================

SELECT
    month_name,
    revenue,

    MAX(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_maximum

FROM company_revenue;



-- =========================================================
-- ROLLING MINIMUM ANALYSIS
-- =========================================================
--
-- Lowest revenue inside rolling frame
--
-- =========================================================

SELECT
    month_name,
    revenue,

    MIN(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_minimum

FROM company_revenue;



-- =========================================================
-- FUTURE ANALYSIS USING FOLLOWING
-- =========================================================
--
-- Uses future rows
--
-- =========================================================

SELECT
    month_name,
    revenue,

    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND 2 FOLLOWING
    ) AS future_average

FROM company_revenue;



-- =========================================================
-- PROJECT CONCLUSION
-- =========================================================
--
-- Skills Demonstrated:
--
-- - Window Functions
-- - Running Totals
-- - Rolling Analytics
-- - KPI Reporting
-- - Trend Analysis
-- - Forecasting Logic
-- - Frame Clauses
-- - Business Intelligence SQL
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- This project can be used in:
--
-- - Power BI Dashboards
-- - Tableau Reporting
-- - Financial Analytics
-- - Revenue Tracking
-- - KPI Monitoring
-- - Forecasting Systems
-- - Business Intelligence
-- - Sales Trend Analysis
--
-- =========================================================