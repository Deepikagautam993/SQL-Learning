-- =========================================================
-- DAY 10
-- ADVANCED VIEWS ANALYTICS
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
--
-- This file focuses on:
--
-- 1. Advanced Views
-- 2. Reporting Views
-- 3. Security Views
-- 4. KPI Analytics
-- 5. Aggregate Views
-- 6. Business Intelligence Queries
-- 7. Dashboard Reporting
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE company_staff (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    experience_years INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO company_staff
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
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM company_staff;



-- =========================================================
-- CREATE IT DEPARTMENT VIEW
-- =========================================================

CREATE VIEW it_department AS

SELECT *
FROM company_staff
WHERE department = 'IT';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM it_department;



-- =========================================================
-- HIGH SALARY VIEW
-- =========================================================

CREATE VIEW high_salary_employees AS

SELECT
    emp_name,
    department,
    salary

FROM company_staff

WHERE salary > 70000;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM high_salary_employees;



-- =========================================================
-- SECURITY BASED VIEW
-- =========================================================
-- Hides salary information
-- =========================================================

CREATE VIEW public_employee_view AS

SELECT
    emp_name,
    department,
    experience_years

FROM company_staff;



-- =========================================================
-- ACCESS SECURITY VIEW
-- =========================================================

SELECT *
FROM public_employee_view;



-- =========================================================
-- KPI REPORT VIEW
-- =========================================================

CREATE VIEW department_kpi AS

SELECT
    department,

    COUNT(*) AS total_employees,

    MAX(salary) AS highest_salary,

    MIN(salary) AS lowest_salary,

    AVG(salary) AS average_salary,

    SUM(salary) AS total_salary

FROM company_staff

GROUP BY department;



-- =========================================================
-- ACCESS KPI VIEW
-- =========================================================

SELECT *
FROM department_kpi;



-- =========================================================
-- EXPERIENCE ANALYTICS VIEW
-- =========================================================

CREATE VIEW experience_report AS

SELECT
    department,

    AVG(experience_years) AS average_experience,

    MAX(experience_years) AS maximum_experience,

    MIN(experience_years) AS minimum_experience

FROM company_staff

GROUP BY department;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM experience_report;



-- =========================================================
-- FINANCE REPORT VIEW
-- =========================================================

CREATE VIEW finance_report AS

SELECT
    emp_name,
    salary,
    experience_years

FROM company_staff

WHERE department = 'Finance';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM finance_report;



-- =========================================================
-- MULTIPLE CONDITIONS VIEW
-- =========================================================

CREATE VIEW senior_it_staff AS

SELECT
    emp_name,
    salary,
    experience_years

FROM company_staff

WHERE department = 'IT'
AND experience_years >= 4;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM senior_it_staff;



-- =========================================================
-- CREATE OR REPLACE VIEW
-- =========================================================

CREATE OR REPLACE VIEW high_salary_employees AS

SELECT
    emp_name,
    department,
    salary,
    experience_years

FROM company_staff

WHERE salary > 65000;



-- =========================================================
-- ACCESS UPDATED VIEW
-- =========================================================

SELECT *
FROM high_salary_employees;



-- =========================================================
-- DASHBOARD ANALYTICS VIEW
-- =========================================================

CREATE VIEW dashboard_summary AS

SELECT
    department,

    COUNT(*) AS employee_count,

    AVG(salary) AS average_salary,

    AVG(experience_years) AS average_experience

FROM company_staff

GROUP BY department;



-- =========================================================
-- ACCESS DASHBOARD VIEW
-- =========================================================

SELECT *
FROM dashboard_summary;



-- =========================================================
-- BUSINESS INTELLIGENCE VIEW
-- =========================================================

CREATE VIEW business_intelligence_report AS

SELECT
    emp_name,
    department,
    salary,

    CASE

        WHEN salary > 80000 THEN 'High Salary'
        WHEN salary > 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'

    END AS salary_category

FROM company_staff;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM business_intelligence_report;



-- =========================================================
-- DROP VIEW
-- =========================================================

DROP VIEW finance_report;



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- View:
-- virtual table
--
-- CREATE VIEW:
-- creates view
--
-- CREATE OR REPLACE VIEW:
-- updates existing view
--
-- DROP VIEW:
-- deletes view only
--
-- Views improve:
-- readability and security
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - KPI dashboards
-- - Tableau
-- - Power BI
-- - HR analytics
-- - Financial reporting
-- - Dashboard systems
-- - Business intelligence
--
-- =========================================================