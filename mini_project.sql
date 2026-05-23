-- =========================================================
-- MINI PROJECT
-- EMPLOYEE ANALYTICS MANAGEMENT SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
-- This project simulates a real-world employee analytics
-- system used by companies to analyze:
--
-- 1. Employee information
-- 2. Department mapping
-- 3. Salary analytics
-- 4. Missing department records
-- 5. KPI reporting
--
-- Concepts Used:
-- - INNER JOIN
-- - LEFT JOIN
-- - RIGHT JOIN
-- - FULL OUTER JOIN
-- - GROUP BY
-- - HAVING
-- - Aggregate Functions
-- =========================================================



-- =========================================================
-- CREATE EMPLOYEES TABLE
-- =========================================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    city VARCHAR(50)
);



-- =========================================================
-- INSERT EMPLOYEE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101, 'Deepika', 'Jabalpur'),
(102, 'Rahul', 'Delhi'),
(103, 'Riya', 'Mumbai'),
(104, 'Aman', 'Pune'),
(105, 'Simran', 'Indore'),
(106, 'Kunal', 'Bhopal');



-- =========================================================
-- CREATE DEPARTMENTS TABLE
-- =========================================================

CREATE TABLE departments (
    emp_id INT,
    department VARCHAR(50),
    salary INT
);



-- =========================================================
-- INSERT DEPARTMENT DATA
-- =========================================================

INSERT INTO departments
VALUES
(101, 'AI', 85000),
(102, 'HR', 45000),
(103, 'IT', 70000),
(104, 'Finance', 55000),
(107, 'Sales', 40000);



-- =========================================================
-- VIEW EMPLOYEE DATA
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- VIEW DEPARTMENT DATA
-- =========================================================

SELECT *
FROM departments;



-- =========================================================
-- INNER JOIN
-- Show employees with department details
-- =========================================================

SELECT
    e.emp_name,
    e.city,
    d.department,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id;



-- =========================================================
-- LEFT JOIN
-- Find employees without departments
-- =========================================================

SELECT
    e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.emp_id = d.emp_id
WHERE d.department IS NULL;



-- =========================================================
-- RIGHT JOIN
-- Find departments without employees
-- =========================================================

SELECT
    d.department
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.emp_id
WHERE e.emp_name IS NULL;



-- =========================================================
-- FULL OUTER JOIN
-- Find unmatched records from both tables
-- =========================================================

SELECT
    e.emp_name,
    d.department
FROM employees e
FULL OUTER JOIN departments d
ON e.emp_id = d.emp_id
WHERE e.emp_id IS NULL
   OR d.emp_id IS NULL;



-- =========================================================
-- Department-wise Employee Count
-- =========================================================

SELECT
    d.department,
    COUNT(*) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;



-- =========================================================
-- Department-wise Average Salary
-- =========================================================

SELECT
    d.department,
    AVG(d.salary) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;



-- =========================================================
-- Departments Having Average Salary > 50000
-- =========================================================

SELECT
    d.department,
    AVG(d.salary) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department
HAVING AVG(d.salary) > 50000;



-- =========================================================
-- Highest Paid Employee
-- =========================================================

SELECT
    e.emp_name,
    d.department,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
ORDER BY d.salary DESC
LIMIT 1;



-- =========================================================
-- FINAL PROJECT UNDERSTANDING
-- =========================================================
-- This project demonstrates:
--
-- 1. Table Relationships
-- 2. INNER JOIN
-- 3. LEFT JOIN
-- 4. RIGHT JOIN
-- 5. FULL OUTER JOIN
-- 6. NULL Analysis
-- 7. KPI Queries
-- 8. Department Analytics
-- 9. Salary Reporting
--
-- Skills Developed:
-- - SQL joins
-- - analytical thinking
-- - business reporting
-- - data relationship analysis
-- - dashboard-style queries
-- =========================================================