-- =========================================================
-- DAY 09 MINI PROJECT
-- EMPLOYEE KPI & BUSINESS ANALYTICS SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
--
-- This project demonstrates:
--
-- 1. CTE (Common Table Expression)
-- 2. Multiple CTEs
-- 3. KPI Reporting
-- 4. Business Analytics
-- 5. Salary Analysis
-- 6. Department Performance
-- 7. Nested Analytics
-- 8. Dashboard Queries
-- 9. Aggregate Analytics
-- 10. Business Intelligence SQL
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employee_kpi (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    experience_years INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employee_kpi
VALUES
(1, 'Aman', 'IT', 65000, 3),
(2, 'Riya', 'HR', 45000, 2),
(3, 'Karan', 'IT', 85000, 5),
(4, 'Simran', 'Finance', 55000, 4),
(5, 'Neha', 'IT', 92000, 6),
(6, 'Rohit', 'Finance', 60000, 5),
(7, 'Priya', 'HR', 50000, 3),
(8, 'Vikas', 'IT', 78000, 4);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employee_kpi;



-- =========================================================
-- BASIC KPI REPORT
-- =========================================================

WITH department_kpi AS (

    SELECT
        department,

        COUNT(*) AS total_employees,

        MAX(salary) AS highest_salary,

        MIN(salary) AS lowest_salary,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary

    FROM employee_kpi

    GROUP BY department

)

SELECT *
FROM department_kpi;



-- =========================================================
-- HIGH PERFORMERS REPORT
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employee_kpi
    GROUP BY department

),

high_performers AS (

    SELECT
        e.emp_name,
        e.department,
        e.salary

    FROM employee_kpi e
    JOIN department_average d
    ON e.department = d.department

    WHERE e.salary > d.avg_salary

)

SELECT *
FROM high_performers;



-- =========================================================
-- EXPERIENCE ANALYTICS
-- =========================================================

WITH experience_report AS (

    SELECT
        department,

        AVG(experience_years) AS average_experience,

        MAX(experience_years) AS maximum_experience,

        MIN(experience_years) AS minimum_experience

    FROM employee_kpi

    GROUP BY department

)

SELECT *
FROM experience_report;



-- =========================================================
-- SALARY GAP ANALYSIS
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employee_kpi
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary,
    d.avg_salary,
    e.salary - d.avg_salary AS salary_gap

FROM employee_kpi e
JOIN department_average d
ON e.department = d.department;



-- =========================================================
-- ADVANCED KPI DASHBOARD
-- =========================================================

WITH department_dashboard AS (

    SELECT
        department,

        COUNT(*) AS employee_count,

        MAX(salary) AS highest_salary,

        MIN(salary) AS lowest_salary,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary,

        AVG(experience_years) AS average_experience

    FROM employee_kpi

    GROUP BY department

)

SELECT *
FROM department_dashboard;



-- =========================================================
-- DEPARTMENT PERFORMANCE REPORT
-- =========================================================

WITH performance_report AS (

    SELECT
        department,

        COUNT(*) AS total_employees,

        AVG(salary) AS average_salary,

        MAX(salary) AS highest_salary,

        AVG(experience_years) AS average_experience

    FROM employee_kpi

    GROUP BY department

)

SELECT *
FROM performance_report;



-- =========================================================
-- HIGH EXPERIENCE EMPLOYEES
-- =========================================================

WITH experienced_employees AS (

    SELECT *
    FROM employee_kpi
    WHERE experience_years >= 5

)

SELECT *
FROM experienced_employees;



-- =========================================================
-- TOP SALARY EMPLOYEES
-- =========================================================

WITH top_salary AS (

    SELECT *
    FROM employee_kpi
    WHERE salary > 80000

)

SELECT *
FROM top_salary;



-- =========================================================
-- MULTIPLE CTE ANALYTICS
-- =========================================================

WITH it_department AS (

    SELECT *
    FROM employee_kpi
    WHERE department = 'IT'

),

high_salary AS (

    SELECT *
    FROM it_department
    WHERE salary > 75000

),

experienced_staff AS (

    SELECT *
    FROM high_salary
    WHERE experience_years >= 4

)

SELECT *
FROM experienced_staff;



-- =========================================================
-- BUSINESS INTELLIGENCE REPORT
-- =========================================================

WITH department_stats AS (

    SELECT
        department,

        COUNT(*) AS total_employees,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary,

        AVG(experience_years) AS average_experience

    FROM employee_kpi

    GROUP BY department

)

SELECT *
FROM department_stats;



-- =========================================================
-- FINAL ANALYTICAL REPORT
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employee_kpi
    GROUP BY department

),

employee_analysis AS (

    SELECT
        e.emp_name,
        e.department,
        e.salary,
        e.experience_years,
        d.avg_salary,
        e.salary - d.avg_salary AS salary_difference

    FROM employee_kpi e
    JOIN department_average d
    ON e.department = d.department

)

SELECT *
FROM employee_analysis;



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
-- improve modular analytics
--
-- Recursive CTE:
-- references itself
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Power BI dashboards
-- - Tableau reporting
-- - HR analytics
-- - KPI monitoring
-- - Financial reporting
-- - ETL pipelines
-- - Business intelligence
-- - Data warehousing
--
-- =========================================================



-- =========================================================
-- PROJECT CONCLUSION
-- =========================================================
--
-- Skills Demonstrated:
--
-- - CTE
-- - Multiple CTEs
-- - Aggregate Analytics
-- - KPI Reporting
-- - Business Analytics
-- - Dashboard Queries
-- - Salary Analytics
-- - Business Intelligence SQL
--
-- =========================================================