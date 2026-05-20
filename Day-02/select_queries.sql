-- =========================================
-- DAY 02 - SELECT QUERIES PRACTICE
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
(101, 'Deepika', 'AI', 75000, 'Jabalpur'),
(102, 'Rahul', 'HR', 40000, 'Delhi'),
(103, 'Riya', 'IT', 68000, 'Mumbai'),
(104, 'Aman', 'Finance', 55000, 'Pune'),
(105, 'Simran', 'Sales', 47000, 'Indore');

-- =========================================
-- Query 1
-- Display all employee records
-- =========================================

SELECT * FROM employees;

-- =========================================
-- Query 2
-- Display only employee names
-- =========================================

SELECT emp_name
FROM employees;

-- =========================================
-- Query 3
-- Display employee names and salaries
-- =========================================

SELECT emp_name, salary
FROM employees;

-- =========================================
-- Query 4
-- Display employee names and departments
-- =========================================

SELECT emp_name, department
FROM employees;

-- =========================================
-- Query 5
-- Display city column only
-- =========================================

SELECT city
FROM employees;

-- =========================================
-- Query 6
-- Display employee names, salary and city
-- =========================================

SELECT emp_name, salary, city
FROM employees;