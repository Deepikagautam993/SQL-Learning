-- =========================================================
-- DAY 17
-- FILE 2 : MATERIALIZED VIEWS
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
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000),
(102,'Riya Gupta','HR',45000),
(103,'Karan Singh','IT',75000),
(104,'Neha Verma','Finance',85000),
(105,'Rohit Patel','IT',95000),
(106,'Priya Jain','HR',55000),
(107,'Arjun Mishra','Finance',72000);

-- =========================================================
-- CREATE MATERIALIZED VIEW
-- =========================================================

CREATE MATERIALIZED VIEW mv_it_employees AS

SELECT
    emp_id,
    emp_name,
    department,
    salary
FROM employees
WHERE department = 'IT';

-- =========================================================
-- VIEW MATERIALIZED DATA
-- =========================================================

SELECT *
FROM mv_it_employees;

-- =========================================================
-- CHECK ORIGINAL TABLE
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- ADD NEW EMPLOYEE
-- =========================================================

INSERT INTO employees
VALUES
(108,'Deepika Gautam','IT',80000);

-- =========================================================
-- CHECK MATERIALIZED VIEW AGAIN
-- =========================================================

SELECT *
FROM mv_it_employees;

-- NOTICE:
-- Deepika will NOT appear yet
-- because Materialized View stores
-- a snapshot of data

-- =========================================================
-- REFRESH MATERIALIZED VIEW
-- =========================================================

REFRESH MATERIALIZED VIEW mv_it_employees;

-- =========================================================
-- CHECK AGAIN AFTER REFRESH
-- =========================================================

SELECT *
FROM mv_it_employees;

-- Now Deepika appears

-- =========================================================
-- MATERIALIZED VIEW FOR HIGH SALARY EMPLOYEES
-- =========================================================

CREATE MATERIALIZED VIEW mv_high_salary AS

SELECT
    emp_id,
    emp_name,
    salary
FROM employees
WHERE salary > 70000;

-- =========================================================
-- VIEW HIGH SALARY DATA
-- =========================================================

SELECT *
FROM mv_high_salary;

-- =========================================================
-- ADD NEW HIGH SALARY EMPLOYEE
-- =========================================================

INSERT INTO employees
VALUES
(109,'Ankit Verma','IT',90000);

-- =========================================================
-- CHECK MATERIALIZED VIEW
-- =========================================================

SELECT *
FROM mv_high_salary;

-- New employee not visible yet

-- =========================================================
-- REFRESH HIGH SALARY VIEW
-- =========================================================

REFRESH MATERIALIZED VIEW mv_high_salary;

-- =========================================================
-- VERIFY REFRESH
-- =========================================================

SELECT *
FROM mv_high_salary;

-- =========================================================
-- DEPARTMENT SUMMARY REPORT
-- =========================================================

CREATE MATERIALIZED VIEW mv_department_summary AS

SELECT
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

-- =========================================================
-- VIEW REPORT
-- =========================================================

SELECT *
FROM mv_department_summary;

-- =========================================================
-- REFRESH REPORT
-- =========================================================

REFRESH MATERIALIZED VIEW mv_department_summary;

-- =========================================================
-- LIST ALL MATERIALIZED VIEWS
-- =========================================================

SELECT *
FROM pg_matviews;

-- =========================================================
-- PRACTICE QUERIES
-- =========================================================

SELECT *
FROM mv_it_employees;

SELECT *
FROM mv_high_salary;

SELECT *
FROM mv_department_summary;

-- =========================================================
-- INTERVIEW NOTES
-- =========================================================

-- Normal View:
-- Stores query only

-- Materialized View:
-- Stores actual query result

-- Normal View:
-- Always latest data

-- Materialized View:
-- Requires refresh

-- Materialized View:
-- Faster for reports

-- =========================================================
-- END OF FILE
-- =========================================================