-- =========================================
-- DAY 03 - ORDER BY PRACTICE
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
-- Sort Salary Ascending
-- =========================================

SELECT *
FROM employees
ORDER BY salary ASC;

-- =========================================
-- Sort Salary Descending
-- =========================================

SELECT *
FROM employees
ORDER BY salary DESC;

-- =========================================
-- Sort Employee Names Alphabetically
-- =========================================

SELECT *
FROM employees
ORDER BY emp_name ASC;

-- =========================================
-- Sort Department Alphabetically
-- =========================================

SELECT *
FROM employees
ORDER BY department ASC;

-- =========================================
-- Sort Cities Descending
-- =========================================

SELECT *
FROM employees
ORDER BY city DESC;