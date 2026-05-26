-- =========================================================
-- DAY 08
-- ROLLING WINDOW ANALYSIS
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
-- This file focuses on:
--
-- 1. Rolling Window Calculations
-- 2. Moving Average
-- 3. Rolling Sum
-- 4. Rolling Maximum
-- 5. Rolling Minimum
-- 6. Trend Analysis
-- 7. Forecasting Logic
-- 8. Advanced Frame Clauses
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE monthly_revenue (
    month_id INT,
    month_name VARCHAR(20),
    revenue INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO monthly_revenue
VALUES
(1, 'January', 45000),
(2, 'February', 50000),
(3, 'March', 47000),
(4, 'April', 60000),
(5, 'May', 65000),
(6, 'June', 70000),
(7, 'July', 68000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM monthly_revenue;



-- =========================================================
-- MOVING AVERAGE
-- =========================================================
-- Calculates average using
-- previous 2 rows + current row
-- =========================================================

SELECT
    month_name,
    revenue,

    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average

FROM monthly_revenue;



-- =========================================================
-- ROLLING SUM
-- =========================================================
-- Fixed-size rolling total
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_sum

FROM monthly_revenue;



-- =========================================================
-- ROLLING MAXIMUM
-- =========================================================
-- Highest revenue inside rolling frame
-- =========================================================

SELECT
    month_name,
    revenue,

    MAX(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_maximum

FROM monthly_revenue;



-- =========================================================
-- ROLLING MINIMUM
-- =========================================================
-- Lowest revenue inside rolling frame
-- =========================================================

SELECT
    month_name,
    revenue,

    MIN(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_minimum

FROM monthly_revenue;



-- =========================================================
-- CURRENT ROW ANALYSIS
-- =========================================================
-- Uses only current row
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND CURRENT ROW
    ) AS current_revenue

FROM monthly_revenue;



-- =========================================================
-- PREVIOUS + CURRENT ROW ANALYSIS
-- =========================================================
-- Uses previous row and current row
-- =========================================================

SELECT
    month_name,
    revenue,

    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 1 PRECEDING
        AND CURRENT ROW
    ) AS previous_current_average

FROM monthly_revenue;



-- =========================================================
-- FUTURE ANALYSIS USING FOLLOWING
-- =========================================================
-- Uses current row + next row
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND 1 FOLLOWING
    ) AS future_revenue

FROM monthly_revenue;



-- =========================================================
-- UNBOUNDED PRECEDING
-- =========================================================
-- Uses all previous rows
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_revenue

FROM monthly_revenue;



-- =========================================================
-- RUNNING MAXIMUM
-- =========================================================
-- Highest revenue till current row
-- =========================================================

SELECT
    month_name,
    revenue,

    MAX(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_maximum

FROM monthly_revenue;



-- =========================================================
-- RUNNING MINIMUM
-- =========================================================
-- Lowest revenue till current row
-- =========================================================

SELECT
    month_name,
    revenue,

    MIN(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_minimum

FROM monthly_revenue;



-- =========================================================
-- REVENUE TREND ANALYSIS
-- =========================================================
-- Compare current and previous revenue
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

FROM monthly_revenue;



-- =========================================================
-- FUTURE GROWTH ANALYSIS
-- =========================================================
-- Compare current and next revenue
-- =========================================================

SELECT
    month_name,
    revenue,

    LEAD(revenue) OVER(
        ORDER BY month_id
    ) AS next_revenue,

    LEAD(revenue) OVER(
        ORDER BY month_id
    ) - revenue AS future_growth

FROM monthly_revenue;



-- =========================================================
-- COMBINED DASHBOARD ANALYTICS
-- =========================================================
-- Real-world dashboard style query
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
    ) AS running_total,

    AVG(revenue) OVER(
        ORDER BY month_id
    ) AS running_average,

    MAX(revenue) OVER(
        ORDER BY month_id
    ) AS running_maximum,

    MIN(revenue) OVER(
        ORDER BY month_id
    ) AS running_minimum

FROM monthly_revenue;



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- Running Total:
-- cumulative calculation
--
-- Rolling Window:
-- fixed-size calculation frame
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
-- - Financial dashboards
-- - Revenue analytics
-- - Stock market analysis
-- - Forecasting systems
-- - KPI reporting
-- - Trend analysis
-- - Power BI dashboards
-- - Tableau reporting
--
-- =========================================================