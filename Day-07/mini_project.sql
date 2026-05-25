-- =========================================================
-- DAY 07 MINI PROJECT
-- EMPLOYEE ANALYTICS DASHBOARD SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
-- This mini project simulates a real-world
-- employee analytics dashboard used by companies.
--
-- In this project we will perform:
--
-- - salary analysis
-- - department analytics
-- - ranking analysis
-- - trend analysis
-- - growth analysis
-- - leaderboard creation
-- - KPI reporting
--
-- Concepts Used:
-- - OVER()
-- - PARTITION BY
-- - ORDER BY
-- - ROW_NUMBER()
-- - RANK()
-- - DENSE_RANK()
-- - LEAD()
-- - LAG()
--
-- Business Goal:
-- Build analytical SQL queries
-- for dashboard reporting systems.
-- =========================================================



-- =========================================================
-- CREATE EMPLOYEE TABLE
-- =========================================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);



-- =========================================================
-- INSERT EMPLOYEE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101, 'Deepika', 'AI', 85000),
(102, 'Rahul', 'HR', 45000),
(103, 'Riya', 'IT', 70000),
(104, 'Aman', 'Finance', 55000),
(105, 'Simran', 'AI', 95000),
(106, 'Kunal', 'IT', 60000),
(107, 'Anjali', 'Finance', 75000),
(108, 'Vikas', 'HR', 50000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- KPI 1
-- COMPANY-WIDE AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER() AS company_average_salary
FROM employees;



-- =========================================================
-- KPI 2
-- DEPARTMENT-WISE AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS department_average_salary
FROM employees;



-- =========================================================
-- KPI 3
-- COMPANY-WIDE TOTAL SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER() AS company_total_salary
FROM employees;



-- =========================================================
-- KPI 4
-- DEPARTMENT-WISE TOTAL SALARY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
    ) AS department_total_salary
FROM employees;



-- =========================================================
-- KPI 5
-- DEPARTMENT EMPLOYEE COUNT
-- =========================================================

SELECT
    emp_name,
    department,
    COUNT(*) OVER(
        PARTITION BY department
    ) AS department_employee_count
FROM employees;



-- =========================================================
-- KPI 6
-- HIGHEST SALARY IN EACH DEPARTMENT
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    MAX(salary) OVER(
        PARTITION BY department
    ) AS department_highest_salary
FROM employees;



-- =========================================================
-- KPI 7
-- LOWEST SALARY IN EACH DEPARTMENT
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    MIN(salary) OVER(
        PARTITION BY department
    ) AS department_lowest_salary
FROM employees;



-- =========================================================
-- KPI 8
-- COMPANY-WIDE EMPLOYEE RANKING
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS company_salary_rank
FROM employees;



-- =========================================================
-- KPI 9
-- DEPARTMENT-WISE EMPLOYEE RANKING
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;



-- =========================================================
-- KPI 10
-- DENSE RANK ANALYSIS
-- =========================================================

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_salary_rank
FROM employees;



-- =========================================================
-- KPI 11
-- TOP 3 HIGHEST PAID EMPLOYEES
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        ROW_NUMBER() OVER(
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
) ranked_data
WHERE row_num <= 3;



-- =========================================================
-- KPI 12
-- HIGHEST PAID EMPLOYEE
-- FROM EACH DEPARTMENT
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        department,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
) ranked_data
WHERE row_num = 1;



-- =========================================================
-- KPI 13
-- RUNNING SALARY TOTAL
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
    ) AS running_salary_total
FROM employees;



-- =========================================================
-- KPI 14
-- RUNNING AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER(
        ORDER BY salary
    ) AS running_average_salary
FROM employees;



-- =========================================================
-- KPI 15
-- DEPARTMENT-WISE RUNNING TOTAL
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS department_running_total
FROM employees;



-- =========================================================
-- CREATE MONTHLY SALES TABLE
-- =========================================================

CREATE TABLE monthly_sales (
    month_name VARCHAR(20),
    sales INT
);



-- =========================================================
-- INSERT MONTHLY SALES DATA
-- =========================================================

INSERT INTO monthly_sales
VALUES
('January', 50000),
('February', 65000),
('March', 70000),
('April', 60000),
('May', 80000);



-- =========================================================
-- KPI 16
-- PREVIOUS MONTH SALES ANALYSIS
-- =========================================================

SELECT
    month_name,
    sales,
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS previous_month_sales
FROM monthly_sales;



-- =========================================================
-- KPI 17
-- NEXT MONTH SALES ANALYSIS
-- =========================================================

SELECT
    month_name,
    sales,
    LEAD(sales) OVER(
        ORDER BY month_name
    ) AS next_month_sales
FROM monthly_sales;



-- =========================================================
-- KPI 18
-- MONTHLY SALES DIFFERENCE
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
-- KPI 19
-- MONTHLY GROWTH PERCENTAGE
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
-- KPI 20
-- SALES TREND ANALYSIS
-- =========================================================

SELECT
    month_name,
    sales,
    LEAD(sales) OVER(
        ORDER BY month_name
    ) - sales AS future_growth_difference
FROM monthly_sales;



-- =========================================================
-- FINAL BUSINESS INSIGHTS
-- =========================================================
--
-- Insights Generated:
--
-- 1. Company salary distribution
--
-- 2. Department performance analysis
--
-- 3. Employee ranking system
--
-- 4. Top performer identification
--
-- 5. Running salary analytics
--
-- 6. Monthly sales growth analysis
--
-- 7. Business trend analysis
--
-- 8. Dashboard KPI reporting
--
-- =========================================================



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Skills Developed:
--
-- 1. Analytical SQL writing
-- 2. Dashboard query creation
-- 3. KPI analysis
-- 4. Ranking analysis
-- 5. Trend analysis
-- 6. Growth analytics
-- 7. Business intelligence reporting
-- 8. Window function mastery
--
-- Real-World Concepts Covered:
--
-- - OVER()
-- - PARTITION BY
-- - ORDER BY
-- - ROW_NUMBER()
-- - RANK()
-- - DENSE_RANK()
-- - LEAD()
-- - LAG()
--
-- =========================================================