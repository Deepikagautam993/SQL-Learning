-- =========================================================
-- DAY 07 - WINDOW FUNCTIONS BASICS
-- =========================================================

-- =========================================================
-- TOPIC OVERVIEW
-- =========================================================
-- Window functions perform calculations across
-- a group of rows while keeping individual rows visible.
--
-- IMPORTANT UNDERSTANDING:
-- Aggregate functions collapse rows,
-- but window functions do not collapse rows.
--
-- Window functions are heavily used in:
-- - dashboards
-- - KPI reporting
-- - business analytics
-- - trend analysis
-- - financial reporting
-- =========================================================



-- =========================================================
-- CREATE EMPLOYEES TABLE
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
(106, 'Kunal', 'IT', 60000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- OVER() WINDOW FUNCTION
-- =========================================================
-- OVER() defines calculation window.
--
-- This query calculates overall average salary
-- while keeping all rows visible.
--
-- IMPORTANT:
-- Rows are NOT collapsed.
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM employees;



-- =========================================================
-- TOTAL COMPANY SALARY USING OVER()
-- =========================================================
-- Calculates complete company salary total.
--
-- Business Use Case:
-- Company expense analysis.
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER() AS total_company_salary
FROM employees;



-- =========================================================
-- PARTITION BY EXAMPLE
-- =========================================================
-- PARTITION BY creates logical groups.
--
-- IMPORTANT:
-- Rows remain visible.
--
-- Business Use Case:
-- Department-wise salary analysis.
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS department_avg_salary
FROM employees;



-- =========================================================
-- DEPARTMENT-WISE TOTAL SALARY
-- =========================================================
-- Calculates total salary inside each department.
--
-- Business Use Case:
-- Department budget analysis.
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
-- COUNT WINDOW FUNCTION
-- =========================================================
-- Counts employees inside each department.
--
-- Business Use Case:
-- Workforce distribution analysis.
-- =========================================================

SELECT
    emp_name,
    department,
    COUNT(*) OVER(
        PARTITION BY department
    ) AS total_department_employees
FROM employees;



-- =========================================================
-- MAX WINDOW FUNCTION
-- =========================================================
-- Finds highest salary in each department.
--
-- Business Use Case:
-- Top performer analysis.
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
-- MIN WINDOW FUNCTION
-- =========================================================
-- Finds lowest salary in each department.
--
-- Business Use Case:
-- Salary benchmarking analysis.
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
-- ORDER BY IN WINDOW FUNCTIONS
-- =========================================================
-- ORDER BY defines row sequence
-- inside window calculation.
--
-- MOST IMPORTANT:
-- ORDER BY controls calculation flow.
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
    ) AS running_salary_total
FROM employees;



-- =========================================================
-- RUNNING AVERAGE USING ORDER BY
-- =========================================================
-- Calculates cumulative average salary.
--
-- Business Use Case:
-- Trend analysis dashboards.
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER(
        ORDER BY salary
    ) AS running_average_salary
FROM employees;



-- =========================================================
-- PARTITION BY + ORDER BY
-- =========================================================
-- Creates separate department groups
-- and performs ordered calculations.
--
-- VERY IMPORTANT analytical pattern.
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
-- COMPANY-WIDE HIGHEST SALARY
-- =========================================================
-- Finds highest salary across all employees.
-- =========================================================

SELECT
    emp_name,
    salary,
    MAX(salary) OVER() AS highest_company_salary
FROM employees;



-- =========================================================
-- COMPANY-WIDE LOWEST SALARY
-- =========================================================
-- Finds minimum salary across company.
-- =========================================================

SELECT
    emp_name,
    salary,
    MIN(salary) OVER() AS lowest_company_salary
FROM employees;



-- =========================================================
-- IMPORTANT INTERVIEW QUERY
-- =========================================================
-- Department-wise average salary
-- with row-level employee details.
--
-- This query is heavily used in:
-- - dashboards
-- - KPI reporting
-- - salary analytics
-- - business intelligence
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
-- DIFFERENCE BETWEEN GROUP BY
-- AND WINDOW FUNCTIONS
-- =========================================================
--
-- GROUP BY:
-- - collapses rows
-- - gives summary output
--
-- WINDOW FUNCTIONS:
-- - keep rows visible
-- - provide analytical output
--
-- MOST IMPORTANT INTERVIEW CONCEPT.
-- =========================================================



-- =========================================================
-- IMPORTANT INTERVIEW CONCEPTS
-- =========================================================
--
-- 1. Window functions do NOT collapse rows.
--
-- 2. OVER() defines calculation window.
--
-- 3. PARTITION BY creates logical groups.
--
-- 4. ORDER BY controls row sequence.
--
-- 5. Window functions are heavily used in:
--    - dashboards
--    - KPI systems
--    - analytics reporting
--    - business intelligence
--
-- 6. Aggregate functions with windows:
--    - SUM()
--    - AVG()
--    - COUNT()
--    - MIN()
--    - MAX()
--
-- 7. PARTITION BY is similar to GROUP BY
--    but rows remain visible.
--
-- =========================================================



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Concepts Learned:
--
-- 1. OVER()
-- 2. PARTITION BY
-- 3. ORDER BY in window functions
-- 4. Running calculations
-- 5. Department-wise analysis
-- 6. Window aggregations
-- 7. Row preservation
--
-- Skills Developed:
-- - analytical SQL logic
-- - dashboard calculations
-- - KPI reporting
-- - business analytics
-- - trend analysis
-- =========================================================