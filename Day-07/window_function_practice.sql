-- =========================================================
-- DAY 07 - WINDOW FUNCTION PRACTICE
-- =========================================================

-- =========================================================
-- TOPIC OVERVIEW
-- =========================================================
-- This file contains practice queries for:
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
-- These practice queries help improve:
-- - analytical thinking
-- - dashboard query writing
-- - KPI analysis
-- - interview preparation
-- =========================================================



-- =========================================================
-- VIEW EMPLOYEE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- PRACTICE 1
-- FIND COMPANY-WIDE AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM employees;



-- =========================================================
-- PRACTICE 2
-- FIND COMPANY-WIDE TOTAL SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER() AS total_company_salary
FROM employees;



-- =========================================================
-- PRACTICE 3
-- FIND DEPARTMENT-WISE AVERAGE SALARY
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
-- PRACTICE 4
-- FIND DEPARTMENT-WISE TOTAL SALARY
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
-- PRACTICE 5
-- FIND DEPARTMENT-WISE EMPLOYEE COUNT
-- =========================================================

SELECT
    emp_name,
    department,
    COUNT(*) OVER(
        PARTITION BY department
    ) AS employee_count
FROM employees;



-- =========================================================
-- PRACTICE 6
-- FIND HIGHEST SALARY IN EACH DEPARTMENT
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
-- PRACTICE 7
-- FIND LOWEST SALARY IN EACH DEPARTMENT
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
-- PRACTICE 8
-- CREATE RUNNING SALARY TOTAL
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
    ) AS running_salary_total
FROM employees;



-- =========================================================
-- PRACTICE 9
-- CREATE RUNNING AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER(
        ORDER BY salary
    ) AS running_average_salary
FROM employees;



-- =========================================================
-- PRACTICE 10
-- ASSIGN ROW NUMBERS
-- =========================================================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_number
FROM employees;



-- =========================================================
-- PRACTICE 11
-- CREATE DEPARTMENT-WISE ROW NUMBERS
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_row_number
FROM employees;



-- =========================================================
-- PRACTICE 12
-- CREATE COMPANY-WIDE RANKS
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS company_rank
FROM employees;



-- =========================================================
-- PRACTICE 13
-- CREATE DENSE RANKS
-- =========================================================

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_rank
FROM employees;



-- =========================================================
-- PRACTICE 14
-- CREATE DEPARTMENT-WISE RANKS
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;



-- =========================================================
-- PRACTICE 15
-- FIND TOP 3 HIGHEST PAID EMPLOYEES
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
-- PRACTICE 16
-- ACCESS PREVIOUS MONTH SALES
-- =========================================================

SELECT
    month_name,
    sales,
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS previous_sales
FROM monthly_sales;



-- =========================================================
-- PRACTICE 17
-- ACCESS NEXT MONTH SALES
-- =========================================================

SELECT
    month_name,
    sales,
    LEAD(sales) OVER(
        ORDER BY month_name
    ) AS next_sales
FROM monthly_sales;



-- =========================================================
-- PRACTICE 18
-- FIND MONTHLY SALES DIFFERENCE
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
-- PRACTICE 19
-- FIND MONTHLY GROWTH PERCENTAGE
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
-- PRACTICE 20
-- DEPARTMENT-WISE PREVIOUS SALARY
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
-- PRACTICE 21
-- DEPARTMENT-WISE NEXT SALARY
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
-- PRACTICE 22
-- SALARY DIFFERENCE ANALYSIS
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
-- IMPORTANT INTERVIEW PRACTICE
-- =========================================================
--
-- Most Important Concepts:
--
-- 1. OVER()
-- 2. PARTITION BY
-- 3. ORDER BY
-- 4. ROW_NUMBER()
-- 5. RANK()
-- 6. DENSE_RANK()
-- 7. LEAD()
-- 8. LAG()
--
-- These concepts are heavily asked in:
-- - SQL interviews
-- - Data Analyst jobs
-- - dashboard analytics
-- - KPI reporting
--
-- =========================================================



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Skills Developed:
--
-- 1. Analytical SQL writing
-- 2. Ranking analysis
-- 3. Trend analysis
-- 4. Dashboard calculations
-- 5. KPI reporting
-- 6. Business analytics
-- 7. Window function mastery
--
-- =========================================================