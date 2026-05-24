-- =========================================================
-- MINI PROJECT
-- EMPLOYEE PERFORMANCE ANALYTICS SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
-- This project simulates a real-world employee performance
-- analytics system used by companies to:
--
-- 1. Analyze employee salaries
-- 2. Compare department performance
-- 3. Identify top performers
-- 4. Generate KPI reports
-- 5. Perform advanced filtering
--
-- Concepts Used:
-- - Single-row Subqueries
-- - Multiple-row Subqueries
-- - Correlated Subqueries
-- - IN
-- - EXISTS
-- - ANY
-- - ALL
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
(105, 'Simran', 'AI', 95000),
(106, 'Kunal', 'IT', 60000),
(107, 'Neha', 'Finance', 75000);



-- =========================================================
-- View Employee Data
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- Find Highest Salary Employee
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);



-- =========================================================
-- Find Employees Earning Above Average Salary
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);



-- =========================================================
-- Find Employees Working in High Salary Departments
-- =========================================================

SELECT emp_name, department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 70000
);



-- =========================================================
-- Find Employees Earning Above Department Average
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);



-- =========================================================
-- Find Highest Salary Employee in Each Department
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);



-- =========================================================
-- Find Lowest Salary Employee in Each Department
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MIN(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);



-- =========================================================
-- EXISTS Query Example
-- =========================================================

SELECT DISTINCT department
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e1.department = e2.department
      AND e2.salary > 80000
);



-- =========================================================
-- Department-wise Salary Analytics
-- =========================================================

SELECT
    department,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;



-- =========================================================
-- FINAL PROJECT UNDERSTANDING
-- =========================================================
-- This project demonstrates:
--
-- 1. Dynamic Filtering
-- 2. Salary Comparison
-- 3. Department Analytics
-- 4. Correlated Logic
-- 5. KPI Reporting
-- 6. Advanced SQL Filtering
--
-- Skills Developed:
-- - analytical thinking
-- - advanced SQL logic
-- - business reporting
-- - department analysis
-- - performance analytics
-- =========================================================