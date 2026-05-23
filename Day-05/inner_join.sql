-- =========================================================
-- DAY 05 - INNER JOIN
-- =========================================================

-- =========================================================
-- Create Employees Table
-- =========================================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    city VARCHAR(50)
);

-- =========================================================
-- Insert Employee Data
-- =========================================================

INSERT INTO employees
VALUES
(101, 'Deepika', 'Jabalpur'),
(102, 'Rahul', 'Delhi'),
(103, 'Riya', 'Mumbai'),
(104, 'Aman', 'Pune'),
(105, 'Simran', 'Indore');

-- =========================================================
-- Create Departments Table
-- =========================================================

CREATE TABLE departments (
    emp_id INT,
    department VARCHAR(50),
    salary INT
);

-- =========================================================
-- Insert Department Data
-- =========================================================

INSERT INTO departments
VALUES
(101, 'AI', 85000),
(102, 'HR', 45000),
(103, 'IT', 70000),
(104, 'Finance', 55000);

-- =========================================================
-- INNER JOIN
-- Returns only matching rows
-- =========================================================

SELECT *
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- Professional INNER JOIN Query
-- =========================================================

SELECT
    e.emp_name,
    d.department,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- INNER JOIN + WHERE
-- =========================================================

SELECT
    e.emp_name,
    d.department,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
WHERE d.salary > 50000;

-- =========================================================
-- INNER JOIN + ORDER BY
-- =========================================================

SELECT
    e.emp_name,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
ORDER BY d.salary DESC;