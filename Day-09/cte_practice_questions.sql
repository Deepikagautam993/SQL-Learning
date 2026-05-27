-- =========================================================
-- DAY 09 PRACTICE QUESTIONS
-- CTE (COMMON TABLE EXPRESSIONS)
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees_data (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees_data
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
FROM employees_data;



-- =========================================================
-- Q1. CREATE BASIC CTE
-- =========================================================

WITH employee_cte AS (

    SELECT *
    FROM employees_data

)

SELECT *
FROM employee_cte;



-- =========================================================
-- Q2. FILTER HIGH SALARY EMPLOYEES
-- =========================================================

WITH high_salary AS (

    SELECT *
    FROM employees_data
    WHERE salary > 70000

)

SELECT *
FROM high_salary;



-- =========================================================
-- Q3. FILTER IT EMPLOYEES
-- =========================================================

WITH it_employees AS (

    SELECT *
    FROM employees_data
    WHERE department = 'IT'

)

SELECT *
FROM it_employees;



-- =========================================================
-- Q4. CREATE MULTIPLE CTEs
-- =========================================================

WITH it_employees AS (

    SELECT *
    FROM employees_data
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
-- Q5. FIND AVERAGE SALARY
-- USING CTE
-- =========================================================

WITH avg_salary AS (

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees_data
    GROUP BY department

)

SELECT *
FROM avg_salary;



-- =========================================================
-- Q6. FIND MAXIMUM SALARY
-- =========================================================

WITH max_salary AS (

    SELECT
        department,
        MAX(salary) AS highest_salary
    FROM employees_data
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
    FROM employees_data
    GROUP BY department

)

SELECT *
FROM min_salary;



-- =========================================================
-- Q8. FIND TOTAL DEPARTMENT SALARY
-- =========================================================

WITH total_salary AS (

    SELECT
        department,
        SUM(salary) AS total_department_salary
    FROM employees_data
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

    FROM employees_data

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
    FROM employees_data
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary,
    d.avg_salary

FROM employees_data e
JOIN department_average d
ON e.department = d.department;



-- =========================================================
-- Q11. HIGHER THAN DEPARTMENT AVERAGE
-- =========================================================

WITH department_average AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees_data
    GROUP BY department

)

SELECT
    e.emp_name,
    e.department,
    e.salary

FROM employees_data e
JOIN department_average d
ON e.department = d.department

WHERE e.salary > d.avg_salary;



-- =========================================================
-- Q12. CTE WITH ORDER BY
-- =========================================================

WITH salary_order AS (

    SELECT *
    FROM employees_data
    ORDER BY salary DESC

)

SELECT *
FROM salary_order;



-- =========================================================
-- Q13. CREATE PERFORMANCE REPORT
-- =========================================================

WITH performance_report AS (

    SELECT
        department,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary

    FROM employees_data

    GROUP BY department

)

SELECT *
FROM performance_report;



-- =========================================================
-- Q14. CREATE COMPLEX ANALYTICS
-- =========================================================

WITH department_avg AS (

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees_data
    GROUP BY department

),

salary_analysis AS (

    SELECT
        e.emp_name,
        e.department,
        e.salary,
        d.avg_salary,
        e.salary - d.avg_salary AS salary_gap

    FROM employees_data e
    JOIN department_avg d
    ON e.department = d.department

)

SELECT *
FROM salary_analysis;



-- =========================================================
-- Q15. COMPARE CTE AND SUBQUERY
-- =========================================================

-- SUBQUERY VERSION

SELECT *
FROM (
    SELECT *
    FROM employees_data
    WHERE salary > 70000
) AS temp_table;



-- CTE VERSION

WITH high_salary AS (

    SELECT *
    FROM employees_data
    WHERE salary > 70000

)

SELECT *
FROM high_salary;



-- =========================================================
-- IMPORTANT INTERVIEW QUESTIONS
-- =========================================================
--
-- Q1. What is CTE?
--
-- Q2. Why use CTE?
--
-- Q3. Difference between:
-- CTE and Subquery
--
-- Q4. Advantages of CTE
--
-- Q5. What is Multiple CTE?
--
-- Q6. What is Recursive CTE?
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Power BI
-- - Tableau
-- - KPI dashboards
-- - ETL pipelines
-- - Business intelligence
-- - HR analytics
-- - Financial reporting
--
-- =========================================================