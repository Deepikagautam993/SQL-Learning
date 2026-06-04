-- =========================================================
-- DAY 17
-- FILE 4 : ASSIGNMENTS WITH SOLUTIONS
-- =========================================================

-- =========================================================
-- SETUP
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000),
(102,'Riya Gupta','HR',45000),
(103,'Karan Singh','IT',75000),
(104,'Neha Verma','Finance',85000),
(105,'Rohit Patel','IT',95000);

-- =========================================================
-- ASSIGNMENT 1
-- CREATE A SIMPLE VIEW
-- =========================================================

-- Question:
-- Create a view that displays:
-- emp_id, emp_name

-- Solution

CREATE VIEW employee_names AS

SELECT
    emp_id,
    emp_name
FROM employees;

SELECT *
FROM employee_names;

-- =========================================================
-- ASSIGNMENT 2
-- CREATE A FILTERED VIEW
-- =========================================================

-- Question:
-- Show only IT employees

-- Solution

CREATE VIEW it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';

SELECT *
FROM it_employees;

-- =========================================================
-- ASSIGNMENT 3
-- CREATE A SECURITY VIEW
-- =========================================================

-- Question:
-- Hide salary information

-- Solution

CREATE VIEW employee_public_data AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;

SELECT *
FROM employee_public_data;

-- =========================================================
-- ASSIGNMENT 4
-- CREATE OR REPLACE VIEW
-- =========================================================

-- Question:
-- Modify employee_names view
-- and include department

-- Solution

CREATE OR REPLACE VIEW employee_names AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;

SELECT *
FROM employee_names;

-- =========================================================
-- ASSIGNMENT 5
-- RENAME VIEW
-- =========================================================

-- Solution

ALTER VIEW employee_names
RENAME TO employee_details;

SELECT *
FROM employee_details;

-- =========================================================
-- ASSIGNMENT 6
-- DROP VIEW
-- =========================================================

-- Solution

DROP VIEW employee_details;

-- =========================================================
-- ASSIGNMENT 7
-- CREATE MATERIALIZED VIEW
-- =========================================================

CREATE MATERIALIZED VIEW mv_it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';

SELECT *
FROM mv_it_employees;

-- =========================================================
-- ASSIGNMENT 8
-- REFRESH MATERIALIZED VIEW
-- =========================================================

INSERT INTO employees
VALUES
(106,'Priya Jain','IT',70000);

REFRESH MATERIALIZED VIEW mv_it_employees;

SELECT *
FROM mv_it_employees;

-- =========================================================
-- ASSIGNMENT 9
-- DEPARTMENT REPORT
-- =========================================================

CREATE MATERIALIZED VIEW mv_department_summary AS

SELECT
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

SELECT *
FROM mv_department_summary;

-- =========================================================
-- ASSIGNMENT 10
-- LIST ALL VIEWS
-- =========================================================

SELECT *
FROM information_schema.views;

-- =========================================================
-- ASSIGNMENT 11
-- LIST MATERIALIZED VIEWS
-- =========================================================

SELECT *
FROM pg_matviews;

-- =========================================================
-- THEORY QUESTIONS
-- =========================================================

-- Q1. What is a View?
-- Answer:
-- A virtual table based on a SQL query.

-- ---------------------------------------------------------

-- Q2. Does a View store data?
-- Answer:
-- No

-- ---------------------------------------------------------

-- Q3. What is a Materialized View?
-- Answer:
-- A database object that stores
-- the actual result of a query.

-- ---------------------------------------------------------

-- Q4. Does a Materialized View
-- automatically update?
-- Answer:
-- No

-- ---------------------------------------------------------

-- Q5. Which command updates it?
-- Answer:
-- REFRESH MATERIALIZED VIEW

-- ---------------------------------------------------------

-- Q6. Difference between
-- View and Materialized View?

-- View:
-- Stores query only

-- Materialized View:
-- Stores actual result

-- ---------------------------------------------------------

-- Q7. Which is better for reporting?
-- Answer:
-- Materialized View

-- ---------------------------------------------------------

-- Q8. Can a view with GROUP BY
-- usually be updated?
-- Answer:
-- No

-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- Q1. What is CREATE OR REPLACE VIEW?

-- Answer:
-- Modifies an existing view
-- without dropping it.

-- ---------------------------------------------------------

-- Q2. Does dropping a view
-- delete the table?

-- Answer:
-- No

-- ---------------------------------------------------------

-- Q3. Which command refreshes
-- a Materialized View?

-- Answer:

-- REFRESH MATERIALIZED VIEW view_name;

-- ---------------------------------------------------------

-- Q4. Why are Materialized Views
-- used in reporting systems?

-- Answer:
-- Faster performance because
-- results are precomputed
-- and stored.

-- =========================================================
-- PRACTICE TASKS
-- =========================================================

-- TASK 1
-- Create Finance Employee View

CREATE VIEW finance_employees AS

SELECT *
FROM employees
WHERE department = 'Finance';

-- ---------------------------------------------------------

-- TASK 2
-- Create High Salary View

CREATE VIEW high_salary_employees AS

SELECT *
FROM employees
WHERE salary > 70000;

-- ---------------------------------------------------------

-- TASK 3
-- Create Materialized View
-- for salaries above 60000

CREATE MATERIALIZED VIEW mv_high_salary AS

SELECT *
FROM employees
WHERE salary > 60000;

-- ---------------------------------------------------------

-- TASK 4
-- Refresh Materialized View

REFRESH MATERIALIZED VIEW mv_high_salary;

-- =========================================================
-- END OF FILE
-- =========================================================