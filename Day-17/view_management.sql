-- =========================================================
-- DAY 17
-- FILE 3 : VIEW MANAGEMENT
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

-- =========================================================
-- INSERT DATA
-- =========================================================

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000),
(102,'Riya Gupta','HR',45000),
(103,'Karan Singh','IT',75000),
(104,'Neha Verma','Finance',85000),
(105,'Rohit Patel','IT',95000);

-- =========================================================
-- CREATE VIEW
-- =========================================================

CREATE VIEW employee_view AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;

-- =========================================================
-- USE VIEW
-- =========================================================

SELECT *
FROM employee_view;

-- =========================================================
-- CREATE OR REPLACE VIEW
-- =========================================================

CREATE OR REPLACE VIEW employee_view AS

SELECT
    emp_id,
    emp_name,
    department,
    salary
FROM employees;

-- =========================================================
-- VERIFY CHANGES
-- =========================================================

SELECT *
FROM employee_view;

-- =========================================================
-- RENAME VIEW
-- =========================================================

ALTER VIEW employee_view
RENAME TO employee_details;

-- =========================================================
-- VERIFY RENAMED VIEW
-- =========================================================

SELECT *
FROM employee_details;

-- =========================================================
-- CREATE UPDATABLE VIEW
-- =========================================================

CREATE VIEW employee_update_view AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;

-- =========================================================
-- UPDATE THROUGH VIEW
-- =========================================================

UPDATE employee_update_view
SET department = 'Finance'
WHERE emp_id = 101;

-- =========================================================
-- VERIFY ORIGINAL TABLE
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- CREATE NON-UPDATABLE VIEW
-- =========================================================

CREATE VIEW department_summary AS

SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- =========================================================
-- VIEW SUMMARY
-- =========================================================

SELECT *
FROM department_summary;

-- =========================================================
-- THIS WILL FAIL
-- =========================================================

-- UPDATE department_summary
-- SET total_employees = 10;

-- Reason:
-- GROUP BY makes the view non-updatable

-- =========================================================
-- LIST ALL VIEWS
-- =========================================================

SELECT *
FROM information_schema.views;

-- =========================================================
-- DROP VIEW
-- =========================================================

DROP VIEW department_summary;

-- =========================================================
-- VERIFY REMOVAL
-- =========================================================

SELECT *
FROM information_schema.views;

-- =========================================================
-- MULTIPLE VIEWS
-- =========================================================

CREATE VIEW it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';

CREATE VIEW high_salary_employees AS

SELECT *
FROM employees
WHERE salary > 70000;

-- =========================================================
-- USE VIEWS
-- =========================================================

SELECT *
FROM it_employees;

SELECT *
FROM high_salary_employees;

-- =========================================================
-- ADVANCED SECURITY VIEW
-- =========================================================

CREATE VIEW employee_public_data AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;

-- Salary hidden

SELECT *
FROM employee_public_data;

-- =========================================================
-- END OF FILE
-- =========================================================