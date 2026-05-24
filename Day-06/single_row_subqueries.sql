-- =========================================================
-- DAY 06 - SINGLE ROW SUBQUERIES
-- =========================================================

-- =========================================================
-- TOPIC OVERVIEW
-- =========================================================
-- Single-row subqueries are subqueries that return
-- only one value.
--
-- These subqueries are commonly used with:
-- - MAX()
-- - MIN()
-- - AVG()
-- - COUNT()
--
-- Single-row subqueries are heavily used in:
-- - salary analysis
-- - KPI dashboards
-- - employee analytics
-- - business reporting
--
-- MOST IMPORTANT UNDERSTANDING:
-- The inner query executes first,
-- then the outer query executes.
-- =========================================================



-- =========================================================
-- CREATE EMPLOYEES TABLE
-- =========================================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);



-- =========================================================
-- INSERT EMPLOYEE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101, 'Deepika', 'AI', 85000),
(102, 'Rahul', 'HR', 45000),
(103, 'Riya', 'IT', 70000),
(104, 'Aman', 'Finance', 55000),
(105, 'Simran', 'AI', 95000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- FIND HIGHEST SALARY EMPLOYEE
-- =========================================================
-- Inner query:
-- Finds maximum salary from table.
--
-- Outer query:
-- Finds employee matching that salary.
--
-- Business Use Case:
-- Find top paid employee in company.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);



-- =========================================================
-- FIND LOWEST SALARY EMPLOYEE
-- =========================================================
-- Inner query:
-- Finds minimum salary.
--
-- Outer query:
-- Finds employee having lowest salary.
--
-- Business Use Case:
-- Identify entry-level or lowest paid employees.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);



-- =========================================================
-- FIND EMPLOYEES EARNING ABOVE AVERAGE SALARY
-- =========================================================
-- Inner query:
-- Calculates average salary.
--
-- Outer query:
-- Returns employees earning above average.
--
-- Business Use Case:
-- High performer salary analysis.
-- KPI reporting.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);



-- =========================================================
-- FIND EMPLOYEES EARNING BELOW AVERAGE SALARY
-- =========================================================
-- Inner query:
-- Calculates average salary.
--
-- Outer query:
-- Returns employees earning below average.
--
-- Business Use Case:
-- Compensation analysis.
-- Salary benchmarking.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);



-- =========================================================
-- FIND EMPLOYEES IN SAME DEPARTMENT AS DEEPIKA
-- =========================================================
-- Inner query:
-- Finds Deepika's department.
--
-- Outer query:
-- Finds all employees from same department.
--
-- MOST IMPORTANT UNDERSTANDING:
-- Subqueries help create dynamic filtering.
-- =========================================================

SELECT emp_name, department
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE emp_name = 'Deepika'
);



-- =========================================================
-- FIND TOTAL EMPLOYEES IN COMPANY
-- =========================================================
-- Inner query:
-- Counts total employees.
--
-- Outer query:
-- Uses returned value dynamically.
--
-- Business Use Case:
-- Company workforce analysis.
-- =========================================================

SELECT emp_name
FROM employees
WHERE (
    SELECT COUNT(*)
    FROM employees
) > 3;



-- =========================================================
-- FIND EMPLOYEES HAVING SAME SALARY AS RAHUL
-- =========================================================
-- Inner query:
-- Finds Rahul's salary.
--
-- Outer query:
-- Finds all employees having same salary.
--
-- Business Use Case:
-- Salary comparison analysis.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT salary
    FROM employees
    WHERE emp_name = 'Rahul'
);



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Single-row subqueries:
--
-- 1. Return only one value
-- 2. Execute inner query first
-- 3. Help create dynamic filtering
-- 4. Commonly used with aggregates
-- 5. Used heavily in analytics systems
--
-- Skills Developed:
-- - dynamic SQL logic
-- - salary analysis
-- - analytical thinking
-- - business reporting
-- =========================================================