-- =========================================================
-- DAY 09
-- BASIC CTE QUERIES
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. CTE (Common Table Expression)
-- 2. WITH Clause
-- 3. Temporary Result Sets
-- 4. Multiple CTEs
-- 5. Aggregate Functions in CTE
-- 6. Nested Analytics
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(1, 'Aman', 'IT', 60000),
(2, 'Riya', 'HR', 45000),
(3, 'Karan', 'IT', 75000),
(4, 'Simran', 'Finance', 50000),
(5, 'Neha', 'IT', 80000),
(6, 'Rohit', 'Finance', 55000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- BASIC CTE
-- =========================================================
-- Creates temporary result set
-- =========================================================

WITH high_salary AS (

    SELECT *
    FROM employees
    WHERE salary > 60000

)

SELECT *
FROM high_salary;



-- =========================================================
-- CTE WITH DEPARTMENT FILTER
-- =========================================================

WITH it_employees AS (

    SELECT *
    FROM employees
    WHERE department = 'IT'

)

SELECT *
FROM it_employees;



-- =========================================================
-- MULTIPLE CTEs
-- =========================================================
-- One CTE can use another CTE
-- =========================================================

WITH it_employees AS (

    SELECT *
    FROM employees
    WHERE department = 'IT'

),

high_salary AS (

    SELECT *
    FROM it_employees
    WHERE salary > 70000

)

SELECT *
FROM high_salary;



-- =========================================================
-- CTE WITH AGGREGATE FUNCTION
-- =========================================================

WITH department_salary AS (

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department

)

SELECT *
FROM department_salary;



-- =========================================================
-- CTE WITH MAXIMUM SALARY
-- =========================================================

WITH max_salary AS (

    SELECT
        department,
        MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department

)

SELECT *
FROM max_salary;



-- =========================================================
-- CTE WITH MINIMUM SALARY
-- =========================================================

WITH min_salary AS (

    SELECT
        department,
        MIN(salary) AS lowest_salary
    FROM employees
    GROUP BY department

)

SELECT *
FROM min_salary;



-- =========================================================
-- CTE WITH TOTAL SALARY
-- =========================================================

WITH total_salary AS (

    SELECT
        department,
        SUM(salary) AS total_department_salary
    FROM employees
    GROUP BY department

)

SELECT *
FROM total_salary;



-- =========================================================
-- NESTED ANALYTICS USING CTE
-- =========================================================

WITH department_avg AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary,
    d.avg_salary

FROM employees e
JOIN department_avg d
ON e.department = d.department;



-- =========================================================
-- KPI ANALYTICS QUERY
-- =========================================================

WITH salary_stats AS (

    SELECT
        department,
        MAX(salary) AS highest_salary,
        MIN(salary) AS lowest_salary,
        AVG(salary) AS average_salary,
        SUM(salary) AS total_salary

    FROM employees

    GROUP BY department

)

SELECT *
FROM salary_stats;



-- =========================================================
-- HIGH SALARY KPI REPORT
-- =========================================================

WITH high_salary_employees AS (

    SELECT *
    FROM employees
    WHERE salary > 65000

)

SELECT
    emp_name,
    department,
    salary
FROM high_salary_employees;



-- =========================================================
-- CTE VS SUBQUERY
-- =========================================================

-- SUBQUERY VERSION

SELECT *
FROM (
    SELECT *
    FROM employees
    WHERE salary > 60000
) AS temp_table;



-- CTE VERSION

WITH high_salary AS (

    SELECT *
    FROM employees
    WHERE salary > 60000

)

SELECT *
FROM high_salary;



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- CTE:
-- temporary result set
--
-- WITH:
-- starts CTE
--
-- Multiple CTEs:
-- can be chained together
--
-- CTE improves:
-- readability and debugging
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Power BI
-- - Tableau
-- - KPI Dashboards
-- - HR Analytics
-- - ETL Pipelines
-- - Business Intelligence
-- - Financial Reporting
--
-- =========================================================