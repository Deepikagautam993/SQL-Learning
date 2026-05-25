-- =========================================================
-- DAY 07 - LEAD() AND LAG() FUNCTIONS
-- =========================================================

-- =========================================================
-- TOPIC OVERVIEW
-- =========================================================
-- LAG() accesses previous row values.
-- LEAD() accesses next row values.
--
-- These functions are heavily used in:
-- - trend analysis
-- - growth analysis
-- - financial reporting
-- - KPI dashboards
-- - sales analytics
-- - forecasting systems
--
-- IMPORTANT:
-- LEAD and LAG depend heavily on ORDER BY.
-- =========================================================



-- =========================================================
-- CREATE MONTHLY SALES TABLE
-- =========================================================

CREATE TABLE monthly_sales (
    month_name VARCHAR(20),
    sales INT
);



-- =========================================================
-- INSERT SALES DATA
-- =========================================================

INSERT INTO monthly_sales
VALUES
('January', 50000),
('February', 65000),
('March', 70000),
('April', 60000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM monthly_sales;



-- =========================================================
-- LAG() FUNCTION
-- =========================================================
-- LAG accesses previous row value.
--
-- IMPORTANT:
-- First row returns NULL
-- because no previous row exists.
-- =========================================================

SELECT
    month_name,
    sales,
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS previous_month_sales
FROM monthly_sales;



-- =========================================================
-- LEAD() FUNCTION
-- =========================================================
-- LEAD accesses next row value.
--
-- IMPORTANT:
-- Last row returns NULL
-- because no next row exists.
-- =========================================================

SELECT
    month_name,
    sales,
    LEAD(sales) OVER(
        ORDER BY month_name
    ) AS next_month_sales
FROM monthly_sales;



-- =========================================================
-- MONTHLY SALES DIFFERENCE
-- =========================================================
-- Current month sales minus previous month sales.
--
-- Business Use Case:
-- Growth tracking dashboards.
-- =========================================================

SELECT
    month_name,
    sales,
    sales -
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS sales_difference
FROM monthly_sales;



-- =========================================================
-- MONTH-OVER-MONTH GROWTH ANALYSIS
-- =========================================================
-- Calculates growth percentage.
--
-- Used heavily in:
-- - dashboards
-- - KPI systems
-- - revenue tracking
-- =========================================================

SELECT
    month_name,
    sales,
    ROUND(
        (
            sales -
            LAG(sales) OVER(
                ORDER BY month_name
            )
        ) * 100.0 /
        LAG(sales) OVER(
            ORDER BY month_name
        ),
        2
    ) AS growth_percentage
FROM monthly_sales;



-- =========================================================
-- PREVIOUS MONTH SALES ANALYSIS
-- =========================================================
-- Another LAG example for trend comparison.
-- =========================================================

SELECT
    month_name,
    sales,
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS previous_sales
FROM monthly_sales;



-- =========================================================
-- NEXT MONTH SALES ANALYSIS
-- =========================================================
-- Another LEAD example for future comparison.
-- =========================================================

SELECT
    month_name,
    sales,
    LEAD(sales) OVER(
        ORDER BY month_name
    ) AS next_sales
FROM monthly_sales;



-- =========================================================
-- SALES TREND ANALYSIS
-- =========================================================
-- Identifies sales increase or decrease.
--
-- Business Use Case:
-- Business performance monitoring.
-- =========================================================

SELECT
    month_name,
    sales,
    sales -
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS trend_difference
FROM monthly_sales;



-- =========================================================
-- DEPARTMENT-WISE PREVIOUS SALARY
-- =========================================================
-- PARTITION BY creates separate groups.
--
-- Business Use Case:
-- Department-level salary comparison.
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    LAG(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS previous_department_salary
FROM employees;



-- =========================================================
-- DEPARTMENT-WISE NEXT SALARY
-- =========================================================
-- Compares next employee salary
-- inside each department.
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    LEAD(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS next_department_salary
FROM employees;



-- =========================================================
-- SALARY DIFFERENCE INSIDE DEPARTMENT
-- =========================================================
-- Difference between current salary
-- and previous department salary.
--
-- Used in compensation analysis.
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    salary -
    LAG(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS salary_difference
FROM employees;



-- =========================================================
-- LEAD() WITH SALARY FORECAST ANALYSIS
-- =========================================================
-- Compares current salary
-- with next employee salary.
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    LEAD(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) - salary AS next_salary_difference
FROM employees;



-- =========================================================
-- IMPORTANT INTERVIEW QUERY
-- =========================================================
-- Monthly growth percentage analysis.
--
-- Most common business dashboard query.
-- =========================================================

SELECT
    month_name,
    sales,
    ROUND(
        (
            sales -
            LAG(sales) OVER(
                ORDER BY month_name
            )
        ) * 100.0 /
        LAG(sales) OVER(
            ORDER BY month_name
        ),
        2
    ) AS monthly_growth_percentage
FROM monthly_sales;



-- =========================================================
-- DIFFERENCE BETWEEN LEAD AND LAG
-- =========================================================
--
-- LAG:
-- - accesses previous row
-- - backward comparison
--
-- LEAD:
-- - accesses next row
-- - forward comparison
--
-- MOST IMPORTANT INTERVIEW CONCEPT.
-- =========================================================



-- =========================================================
-- IMPORTANT INTERVIEW CONCEPTS
-- =========================================================
--
-- 1. LAG accesses previous row value.
--
-- 2. LEAD accesses next row value.
--
-- 3. ORDER BY controls comparison sequence.
--
-- 4. PARTITION BY creates separate comparison groups.
--
-- 5. First row in LAG returns NULL.
--
-- 6. Last row in LEAD returns NULL.
--
-- 7. LEAD and LAG are heavily used in:
--    - trend analysis
--    - KPI dashboards
--    - financial reporting
--    - growth analysis
--
-- =========================================================



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Concepts Learned:
--
-- 1. LAG()
-- 2. LEAD()
-- 3. Previous row analysis
-- 4. Next row analysis
-- 5. Growth analysis
-- 6. Trend comparison
-- 7. Department-wise comparison
--
-- Skills Developed:
-- - trend analytics
-- - KPI reporting
-- - growth analysis
-- - financial comparison
-- - dashboard calculations
-- =========================================================