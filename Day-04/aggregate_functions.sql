-- =========================================
-- DAY 04 - AGGREGATE FUNCTIONS
-- =========================================

-- =========================================
-- Create Employees Table
-- =========================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

-- =========================================
-- Insert Employee Records
-- =========================================

INSERT INTO employees
VALUES
(101, 'Deepika', 'AI', 85000, 'Jabalpur'),
(102, 'Rahul', 'HR', 45000, 'Delhi'),
(103, 'Riya', 'IT', 70000, 'Mumbai'),
(104, 'Aman', 'Finance', 55000, 'Pune'),
(105, 'Simran', 'Sales', 50000, 'Indore'),
(106, 'Ankit', 'AI', 95000, 'Delhi'),
(107, 'Priya', 'HR', 60000, 'Bhopal'),
(108, 'Kunal', 'IT', 72000, 'Mumbai');

-- =========================================
-- COUNT()
-- =========================================

SELECT COUNT(*) AS total_employees
FROM employees;

-- =========================================
-- SUM()
-- =========================================

SELECT SUM(salary) AS total_salary
FROM employees;

-- =========================================
-- AVG()
-- =========================================

SELECT AVG(salary) AS average_salary
FROM employees;

-- =========================================
-- MAX()
-- =========================================

SELECT MAX(salary) AS highest_salary
FROM employees;

-- =========================================
-- MIN()
-- =========================================

SELECT MIN(salary) AS lowest_salary
FROM employees;

-- =========================================
-- Aggregate Functions with WHERE
-- =========================================

SELECT AVG(salary) AS ai_average_salary
FROM employees
WHERE department = 'AI';