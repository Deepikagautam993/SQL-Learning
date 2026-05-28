-- =========================================================
-- DAY 10 ASSIGNMENTS WITH SOLUTIONS
-- VIEWS IN SQL
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
(3, 'Karan', 'IT', 82000),
(4, 'Simran', 'Finance', 55000),
(5, 'Neha', 'IT', 91000),
(6, 'Rohit', 'Finance', 60000),
(7, 'Priya', 'HR', 48000),
(8, 'Vikas', 'IT', 76000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM staff_data;



-- =========================================================
-- Q1. CREATE BASIC VIEW
-- =========================================================

CREATE VIEW it_employees AS

SELECT *
FROM staff_data
WHERE department = 'IT';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM it_employees;



-- =========================================================
-- Q2. CREATE VIEW WITH SPECIFIC COLUMNS
-- =========================================================

CREATE VIEW employee_salary AS

SELECT
    emp_name,
    salary

FROM staff_data;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM employee_salary;



-- =========================================================
-- Q3. CREATE CONDITIONAL VIEW
-- =========================================================

CREATE VIEW high_salary AS

SELECT *
FROM staff_data
WHERE salary > 70000;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM high_salary;



-- =========================================================
-- Q4. CREATE SECURITY VIEW
-- =========================================================

CREATE VIEW public_employee_data AS

SELECT
    emp_name,
    department

FROM staff_data;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM public_employee_data;



-- =========================================================
-- Q5. CREATE FINANCE VIEW
-- =========================================================

CREATE VIEW finance_department AS

SELECT
    emp_name,
    salary

FROM staff_data

WHERE department = 'Finance';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM finance_department;



-- =========================================================
-- Q6. CREATE MULTIPLE CONDITIONS VIEW
-- =========================================================

CREATE VIEW senior_salary AS

SELECT
    emp_name,
    department,
    salary

FROM staff_data

WHERE department = 'IT'
AND salary > 75000;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM senior_salary;



-- =========================================================
-- Q7. CREATE KPI VIEW
-- =========================================================

CREATE VIEW department_kpi AS

SELECT
    department,

    COUNT(*) AS total_employees,

    MAX(salary) AS highest_salary,

    MIN(salary) AS lowest_salary,

    AVG(salary) AS average_salary,

    SUM(salary) AS total_salary

FROM staff_data

GROUP BY department;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM department_kpi;



-- =========================================================
-- Q8. UPDATE VIEW
-- =========================================================

CREATE OR REPLACE VIEW high_salary AS

SELECT
    emp_name,
    department,
    salary

FROM staff_data

WHERE salary > 65000;



-- =========================================================
-- ACCESS UPDATED VIEW
-- =========================================================

SELECT *
FROM high_salary;



-- =========================================================
-- Q9. CREATE DASHBOARD VIEW
-- =========================================================

CREATE VIEW dashboard_summary AS

SELECT
    department,

    COUNT(*) AS employee_count,

    AVG(salary) AS average_salary

FROM staff_data

GROUP BY department;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM dashboard_summary;



-- =========================================================
-- Q10. BUSINESS INTELLIGENCE VIEW
-- =========================================================

CREATE VIEW business_report AS

SELECT
    emp_name,
    department,

    CASE

        WHEN salary > 80000 THEN 'High Salary'
        WHEN salary > 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'

    END AS salary_category

FROM staff_data;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM business_report;



-- =========================================================
-- Q11. DROP VIEW
-- =========================================================

DROP VIEW finance_department;



-- =========================================================
-- THEORY QUESTIONS WITH ANSWERS
-- =========================================================

-- =========================================================
-- Q12. WHAT IS VIEW?
-- =========================================================
--
-- View is:
-- virtual table created from query.
--
-- =========================================================



-- =========================================================
-- Q13. WHY USE VIEWS?
-- =========================================================
--
-- Views improve:
-- - security
-- - readability
-- - dashboard reporting
-- - query simplification
--
-- =========================================================



-- =========================================================
-- Q14. DIFFERENCE BETWEEN
-- VIEW AND TABLE
-- =========================================================
--
-- VIEW:
-- virtual structure
--
-- TABLE:
-- physical structure
--
-- View stores query
-- Table stores actual data
--
-- =========================================================



-- =========================================================
-- Q15. WHAT IS CREATE VIEW?
-- =========================================================
--
-- CREATE VIEW:
-- creates virtual table.
--
-- =========================================================



-- =========================================================
-- Q16. WHAT IS CREATE OR REPLACE VIEW?
-- =========================================================
--
-- Used for:
-- updating existing view.
--
-- =========================================================



-- =========================================================
-- Q17. WHAT IS DROP VIEW?
-- =========================================================
--
-- DROP VIEW:
-- deletes view only.
--
-- Original table remains safe.
--
-- =========================================================



-- =========================================================
-- Q18. HOW VIEWS IMPROVE SECURITY?
-- =========================================================
--
-- Views can hide:
-- - salary
-- - confidential columns
-- - sensitive information
--
-- =========================================================



-- =========================================================
-- Q19. REAL-WORLD USES OF VIEWS
-- =========================================================
--
-- Used in:
-- - Power BI
-- - Tableau
-- - KPI dashboards
-- - Financial analytics
-- - HR analytics
-- - Enterprise systems
--
-- =========================================================