-- =========================================================
-- DAY 10
-- VIEWS IN SQL
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. CREATE VIEW
-- 2. ACCESS VIEW
-- 3. CONDITIONAL VIEW
-- 4. CREATE OR REPLACE VIEW
-- 5. DROP VIEW
-- 6. VIEW VS TABLE
-- 7. SECURITY USING VIEWS
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
(5, 'Neha', 'IT', 85000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- CREATE FIRST VIEW
-- =========================================================
-- Creates virtual table
-- =========================================================

CREATE VIEW it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM it_employees;



-- =========================================================
-- VIEW WITH SPECIFIC COLUMNS
-- =========================================================

CREATE VIEW employee_salary AS

SELECT
    emp_name,
    salary
FROM employees;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM employee_salary;



-- =========================================================
-- CONDITIONAL VIEW
-- =========================================================

CREATE VIEW high_salary AS

SELECT *
FROM employees
WHERE salary > 60000;



-- =========================================================
-- ACCESS CONDITIONAL VIEW
-- =========================================================

SELECT *
FROM high_salary;



-- =========================================================
-- CREATE OR REPLACE VIEW
-- =========================================================
-- Updates existing view
-- =========================================================

CREATE OR REPLACE VIEW high_salary AS

SELECT
    emp_name,
    department,
    salary

FROM employees

WHERE salary > 55000;



-- =========================================================
-- ACCESS UPDATED VIEW
-- =========================================================

SELECT *
FROM high_salary;



-- =========================================================
-- SECURITY BASED VIEW
-- =========================================================
-- Hides sensitive salary data
-- =========================================================

CREATE VIEW public_employee_data AS

SELECT
    emp_name,
    department

FROM employees;



-- =========================================================
-- ACCESS SECURITY VIEW
-- =========================================================

SELECT *
FROM public_employee_data;



-- =========================================================
-- VIEW FOR REPORTING
-- =========================================================

CREATE VIEW finance_department AS

SELECT
    emp_name,
    salary

FROM employees

WHERE department = 'Finance';



-- =========================================================
-- ACCESS REPORTING VIEW
-- =========================================================

SELECT *
FROM finance_department;



-- =========================================================
-- MULTIPLE CONDITIONS VIEW
-- =========================================================

CREATE VIEW experienced_salary AS

SELECT
    emp_name,
    department,
    salary

FROM employees

WHERE salary > 50000
AND department = 'IT';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM experienced_salary;



-- =========================================================
-- DROP VIEW
-- =========================================================
-- Deletes view only
-- Original table remains safe
-- =========================================================

DROP VIEW finance_department;



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- View:
-- virtual table
--
-- View stores:
-- query not actual data
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
-- =========================================================



-- =========================================================
-- VIEW VS TABLE
-- =========================================================
--
-- VIEW:
-- virtual structure
--
-- TABLE:
-- physical structure
--
-- View does not store data
-- Table stores actual data
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
-- - Reporting systems
-- - Financial analytics
-- - HR analytics
-- - Business intelligence
--
-- =========================================================