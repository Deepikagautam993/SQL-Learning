-- =========================================================
-- DAY 10 MINI PROJECT
-- EMPLOYEE REPORTING & VIEW MANAGEMENT SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
--
-- This project demonstrates:
--
-- 1. SQL Views
-- 2. Reporting Views
-- 3. Security Views
-- 4. KPI Dashboards
-- 5. Business Intelligence Queries
-- 6. Aggregate Analytics
-- 7. Department Reporting
-- 8. Salary Analytics
-- 9. Dashboard Management
-- 10. Enterprise SQL Concepts
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employee_reports (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    experience_years INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employee_reports
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
FROM employee_reports;



-- =========================================================
-- CREATE IT DEPARTMENT VIEW
-- =========================================================

CREATE VIEW it_department AS

SELECT *
FROM employee_reports
WHERE department = 'IT';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM it_department;



-- =========================================================
-- HIGH SALARY VIEW
-- =========================================================

CREATE VIEW high_salary_staff AS

SELECT
    emp_name,
    department,
    salary

FROM employee_reports

WHERE salary > 70000;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM high_salary_staff;



-- =========================================================
-- SECURITY VIEW
-- =========================================================
-- Hides salary information
-- =========================================================

CREATE VIEW public_employee_view AS

SELECT
    emp_name,
    department,
    experience_years

FROM employee_reports;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM public_employee_view;



-- =========================================================
-- KPI DASHBOARD VIEW
-- =========================================================

CREATE VIEW department_dashboard AS

SELECT
    department,

    COUNT(*) AS total_employees,

    MAX(salary) AS highest_salary,

    MIN(salary) AS lowest_salary,

    AVG(salary) AS average_salary,

    SUM(salary) AS total_salary

FROM employee_reports

GROUP BY department;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM department_dashboard;



-- =========================================================
-- EXPERIENCE REPORT VIEW
-- =========================================================

CREATE VIEW experience_report AS

SELECT
    department,

    AVG(experience_years) AS average_experience,

    MAX(experience_years) AS maximum_experience,

    MIN(experience_years) AS minimum_experience

FROM employee_reports

GROUP BY department;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM experience_report;



-- =========================================================
-- SENIOR IT STAFF VIEW
-- =========================================================

CREATE VIEW senior_it_staff AS

SELECT
    emp_name,
    salary,
    experience_years

FROM employee_reports

WHERE department = 'IT'
AND experience_years >= 4;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM senior_it_staff;



-- =========================================================
-- BUSINESS INTELLIGENCE VIEW
-- =========================================================

CREATE VIEW business_report AS

SELECT
    emp_name,
    department,
    salary,

    CASE

        WHEN salary > 80000 THEN 'High Salary'
        WHEN salary > 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'

    END AS salary_category

FROM employee_reports;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM business_report;



-- =========================================================
-- CREATE OR REPLACE VIEW
-- =========================================================

CREATE OR REPLACE VIEW high_salary_staff AS

SELECT
    emp_name,
    department,
    salary,
    experience_years

FROM employee_reports

WHERE salary > 65000;



-- =========================================================
-- ACCESS UPDATED VIEW
-- =========================================================

SELECT *
FROM high_salary_staff;



-- =========================================================
-- FINAL DASHBOARD SUMMARY
-- =========================================================

CREATE VIEW final_dashboard AS

SELECT
    department,

    COUNT(*) AS employee_count,

    AVG(salary) AS average_salary,

    AVG(experience_years) AS average_experience

FROM employee_reports

GROUP BY department;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM final_dashboard;



-- =========================================================
-- DROP VIEW
-- =========================================================

DROP VIEW senior_it_staff;



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
-- - Power BI
-- - Tableau
-- - Dashboard systems
-- - KPI analytics
-- - HR analytics
-- - Financial reporting
-- - Business intelligence
-- - Enterprise databases
--
-- =========================================================



-- =========================================================
-- PROJECT CONCLUSION
-- =========================================================
--
-- Skills Demonstrated:
--
-- - SQL Views
-- - Reporting Systems
-- - Dashboard Queries
-- - KPI Analytics
-- - Security Views
-- - Business Intelligence SQL
-- - Enterprise SQL Concepts
--
-- =========================================================