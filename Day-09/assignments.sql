-- =========================================================
-- DAY 09 ASSIGNMENTS WITH SOLUTIONS
-- CTE (COMMON TABLE EXPRESSIONS)
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE staff_data (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO staff_data
VALUES
(1, 'Aman', 'IT', 65000),
(2, 'Riya', 'HR', 45000),
(3, 'Karan', 'IT', 78000),
(4, 'Simran', 'Finance', 52000),
(5, 'Neha', 'IT', 88000),
(6, 'Rohit', 'Finance', 57000),
(7, 'Priya', 'HR', 48000),
(8, 'Vikas', 'IT', 72000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM staff_data;



-- =========================================================
-- Q1. CREATE BASIC CTE
-- =========================================================

WITH employee_cte AS (

    SELECT *
    FROM staff_data

)

SELECT *
FROM employee_cte;



-- =========================================================
-- Q2. FILTER HIGH SALARY EMPLOYEES
-- =========================================================

WITH high_salary AS (

    SELECT *
    FROM staff_data
    WHERE salary > 70000

)

SELECT *
FROM high_salary;



-- =========================================================
-- Q3. FILTER IT EMPLOYEES
-- =========================================================

WITH it_employees AS (

    SELECT *
    FROM staff_data
    WHERE department = 'IT'

)

SELECT *
FROM it_employees;



-- =========================================================
-- Q4. CREATE MULTIPLE CTEs
-- =========================================================

WITH it_employees AS (

    SELECT *
    FROM staff_data
    WHERE department = 'IT'

),

high_salary AS (

    SELECT *
    FROM it_employees
    WHERE salary > 75000

)

SELECT *
FROM high_salary;



-- =========================================================
-- Q5. FIND AVERAGE SALARY
-- USING CTE
-- =========================================================

WITH average_salary AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM staff_data
    GROUP BY department

)

SELECT *
FROM average_salary;



-- =========================================================
-- Q6. FIND MAXIMUM SALARY
-- =========================================================

WITH max_salary AS (

    SELECT
        department,
        MAX(salary) AS highest_salary
    FROM staff_data
    GROUP BY department

)

SELECT *
FROM max_salary;



-- =========================================================
-- Q7. FIND MINIMUM SALARY
-- =========================================================

WITH min_salary AS (

    SELECT
        department,
        MIN(salary) AS lowest_salary
    FROM staff_data
    GROUP BY department

)

SELECT *
FROM min_salary;



-- =========================================================
-- Q8. FIND TOTAL SALARY
-- =========================================================

WITH total_salary AS (

    SELECT
        department,
        SUM(salary) AS total_department_salary
    FROM staff_data
    GROUP BY department

)

SELECT *
FROM total_salary;



-- =========================================================
-- Q9. CREATE KPI REPORT
-- =========================================================

WITH kpi_report AS (

    SELECT
        department,

        COUNT(*) AS total_employees,

        MAX(salary) AS highest_salary,

        MIN(salary) AS lowest_salary,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary

    FROM staff_data

    GROUP BY department

)

SELECT *
FROM kpi_report;



-- =========================================================
-- Q10. EMPLOYEE VS DEPARTMENT AVERAGE
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM staff_data
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary,
    d.avg_salary

FROM staff_data e
JOIN department_average d
ON e.department = d.department;



-- =========================================================
-- Q11. HIGHER THAN DEPARTMENT AVERAGE
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM staff_data
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary

FROM staff_data e
JOIN department_average d
ON e.department = d.department

WHERE e.salary > d.avg_salary;



-- =========================================================
-- Q12. CREATE PERFORMANCE REPORT
-- =========================================================

WITH performance_report AS (

    SELECT
        department,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary

    FROM staff_data

    GROUP BY department

)

SELECT *
FROM performance_report;



-- =========================================================
-- Q13. CREATE COMPLEX ANALYTICS
-- =========================================================

WITH department_avg AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM staff_data
    GROUP BY department

),

salary_analysis AS (

    SELECT
        e.emp_name,
        e.department,
        e.salary,
        d.avg_salary,
        e.salary - d.avg_salary AS salary_gap

    FROM staff_data e
    JOIN department_avg d
    ON e.department = d.department

)

SELECT *
FROM salary_analysis;



-- =========================================================
-- Q14. CREATE ORDERED CTE
-- =========================================================

WITH ordered_salary AS (

    SELECT *
    FROM staff_data
    ORDER BY salary DESC

)

SELECT *
FROM ordered_salary;



-- =========================================================
-- Q15. CREATE HIGH PERFORMANCE REPORT
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM staff_data
    GROUP BY department

),

high_performers AS (

    SELECT
        e.emp_name,
        e.department,
        e.salary

    FROM staff_data e
    JOIN department_average d
    ON e.department = d.department

    WHERE e.salary > d.avg_salary

)

SELECT *
FROM high_performers;



-- =========================================================
-- Q16. CREATE TOTAL EMPLOYEE REPORT
-- =========================================================

WITH employee_report AS (

    SELECT
        department,
        COUNT(*) AS total_employees

    FROM staff_data

    GROUP BY department

)

SELECT *
FROM employee_report;



-- =========================================================
-- Q17. CREATE ADVANCED KPI DASHBOARD
-- =========================================================

WITH dashboard_kpi AS (

    SELECT
        department,

        COUNT(*) AS employee_count,

        MAX(salary) AS highest_salary,

        MIN(salary) AS lowest_salary,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary

    FROM staff_data

    GROUP BY department

)

SELECT *
FROM dashboard_kpi;



-- =========================================================
-- Q18. CREATE SALARY GAP REPORT
-- =========================================================

WITH department_avg AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM staff_data
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary,
    d.avg_salary,
    e.salary - d.avg_salary AS salary_gap

FROM staff_data e
JOIN department_avg d
ON e.department = d.department;



-- =========================================================
-- Q19. COMPARE CTE VS SUBQUERY
-- =========================================================

-- SUBQUERY

SELECT *
FROM (
    SELECT *
    FROM staff_data
    WHERE salary > 70000
) AS temp_table;



-- CTE

WITH high_salary AS (

    SELECT *
    FROM staff_data
    WHERE salary > 70000

)

SELECT *
FROM high_salary;



-- =========================================================
-- Q20. CREATE FINAL BUSINESS REPORT
-- =========================================================

WITH department_stats AS (

    SELECT
        department,

        COUNT(*) AS total_employees,

        MAX(salary) AS highest_salary,

        MIN(salary) AS lowest_salary,

        AVG(salary) AS average_salary,

        SUM(salary) AS total_salary

    FROM staff_data

    GROUP BY department

)

SELECT *
FROM department_stats;



-- =========================================================
-- THEORY QUESTIONS WITH ANSWERS
-- =========================================================

-- =========================================================
-- Q21. WHAT IS CTE?
-- =========================================================
--
-- CTE stands for:
-- Common Table Expression
--
-- It is a temporary result set
-- used inside query execution.
--
-- =========================================================



-- =========================================================
-- Q22. WHY USE CTE?
-- =========================================================
--
-- CTE improves:
-- - readability
-- - debugging
-- - modular query writing
-- - analytical reporting
--
-- =========================================================



-- =========================================================
-- Q23. DIFFERENCE BETWEEN
-- CTE AND SUBQUERY
-- =========================================================
--
-- CTE:
-- cleaner and reusable
--
-- Subquery:
-- harder to read
--
-- =========================================================



-- =========================================================
-- Q24. WHAT IS MULTIPLE CTE?
-- =========================================================
--
-- Multiple CTE means:
-- multiple temporary result sets
-- inside one query.
--
-- =========================================================



-- =========================================================
-- Q25. WHAT IS RECURSIVE CTE?
-- =========================================================
--
-- Recursive CTE references itself.
--
-- Used in:
-- hierarchy data
-- tree structures
-- recursive calculations
--
-- =========================================================



-- =========================================================
-- Q26. ADVANTAGES OF CTE
-- =========================================================
--
-- Advantages:
-- - clean queries
-- - modular design
-- - easier debugging
-- - reusable logic
-- - better analytics
--
-- =========================================================



-- =========================================================
-- Q27. REAL-WORLD USES OF CTE
-- =========================================================
--
-- Used in:
-- - Power BI
-- - Tableau
-- - KPI dashboards
-- - ETL pipelines
-- - HR analytics
-- - Financial reporting
-- - Business intelligence
--
-- =========================================================