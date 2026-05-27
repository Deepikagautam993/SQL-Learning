-- =========================================================
-- DAY 09
-- ADVANCED CTE ANALYTICS
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
-- This file focuses on:
--
-- 1. Multiple CTEs
-- 2. Nested Analytics
-- 3. KPI Reporting
-- 4. Aggregate Analytics
-- 5. Business Intelligence Queries
-- 6. Advanced Reporting
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE company_employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO company_employees
VALUES
(1, 'Aman', 'IT', 60000),
(2, 'Riya', 'HR', 45000),
(3, 'Karan', 'IT', 75000),
(4, 'Simran', 'Finance', 50000),
(5, 'Neha', 'IT', 85000),
(6, 'Rohit', 'Finance', 55000),
(7, 'Priya', 'HR', 48000),
(8, 'Vikas', 'IT', 72000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM company_employees;



-- =========================================================
-- MULTIPLE CTE ANALYSIS
-- =========================================================

WITH it_employees AS (

    SELECT *
    FROM company_employees
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
-- DEPARTMENT KPI REPORT
-- =========================================================

WITH department_kpi AS (

    SELECT
        department,

        COUNT(*) AS total_employees,

        MAX(salary) AS highest_salary,

        MIN(salary) AS lowest_salary,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary

    FROM company_employees

    GROUP BY department

)

SELECT *
FROM department_kpi;



-- =========================================================
-- EMPLOYEE VS DEPARTMENT AVERAGE
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM company_employees
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary,
    d.avg_salary,
    e.salary - d.avg_salary AS salary_difference

FROM company_employees e
JOIN department_average d
ON e.department = d.department;



-- =========================================================
-- HIGHER THAN DEPARTMENT AVERAGE
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM company_employees
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary

FROM company_employees e
JOIN department_average d
ON e.department = d.department

WHERE e.salary > d.avg_salary;



-- =========================================================
-- LOWEST SALARY ANALYSIS
-- =========================================================

WITH minimum_salary AS (

    SELECT
        department,
        MIN(salary) AS min_salary
    FROM company_employees
    GROUP BY department

)

SELECT *
FROM minimum_salary;



-- =========================================================
-- HIGHEST SALARY ANALYSIS
-- =========================================================

WITH maximum_salary AS (

    SELECT
        department,
        MAX(salary) AS max_salary
    FROM company_employees
    GROUP BY department

)

SELECT *
FROM maximum_salary;



-- =========================================================
-- TOTAL DEPARTMENT SALARY
-- =========================================================

WITH department_total AS (

    SELECT
        department,
        SUM(salary) AS total_department_salary
    FROM company_employees
    GROUP BY department

)

SELECT *
FROM department_total;



-- =========================================================
-- ADVANCED KPI DASHBOARD
-- =========================================================

WITH department_stats AS (

    SELECT
        department,

        COUNT(*) AS employee_count,

        MAX(salary) AS highest_salary,

        MIN(salary) AS lowest_salary,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary

    FROM company_employees

    GROUP BY department

)

SELECT *
FROM department_stats;



-- =========================================================
-- NESTED BUSINESS ANALYTICS
-- =========================================================

WITH department_avg AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM company_employees
    GROUP BY department

),

high_performers AS (

    SELECT
        e.emp_name,
        e.department,
        e.salary

    FROM company_employees e
    JOIN department_avg d
    ON e.department = d.department

    WHERE e.salary > d.avg_salary

)

SELECT *
FROM high_performers;



-- =========================================================
-- DEPARTMENT PERFORMANCE REPORT
-- =========================================================

WITH performance_report AS (

    SELECT
        department,

        COUNT(*) AS total_employees,

        AVG(salary) AS average_salary,

        MAX(salary) AS highest_salary

    FROM company_employees

    GROUP BY department

)

SELECT *
FROM performance_report;



-- =========================================================
-- CTE WITH ORDER BY
-- =========================================================

WITH salary_ranking AS (

    SELECT *
    FROM company_employees
    ORDER BY salary DESC

)

SELECT *
FROM salary_ranking;



-- =========================================================
-- COMPLEX ANALYTICAL QUERY
-- =========================================================

WITH department_avg AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM company_employees
    GROUP BY department

),

salary_analysis AS (

    SELECT
        e.emp_name,
        e.department,
        e.salary,
        d.avg_salary,
        e.salary - d.avg_salary AS salary_gap

    FROM company_employees e
    JOIN department_avg d
    ON e.department = d.department

)

SELECT *
FROM salary_analysis;



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- CTE:
-- temporary virtual table
--
-- WITH:
-- starts CTE
--
-- Multiple CTEs:
-- improve modular queries
--
-- CTEs improve:
-- readability and debugging
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - KPI dashboards
-- - HR analytics
-- - ETL pipelines
-- - Data Warehousing
-- - Power BI
-- - Tableau
-- - Financial reporting
-- - Business intelligence
--
-- =========================================================