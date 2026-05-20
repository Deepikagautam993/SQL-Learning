-- =========================================
-- Assignment 1
-- Create an employees table
-- =========================================

CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

-- =========================================
-- Assignment 2
-- Insert employee records
-- =========================================

INSERT INTO employees
VALUES
(1, 'Deepika', 'AI', 50000, 'Jabalpur'),
(2, 'Rahul', 'HR', 40000, 'Delhi'),
(3, 'Aman', 'Sales', 45000, 'Mumbai'),
(4, 'Riya', 'IT', 70000, 'Pune'),
(5, 'Kunal', 'Finance', 65000, 'Delhi');

-- =========================================
-- Assignment 3
-- Display all employee records
-- =========================================

SELECT * FROM employees;

-- =========================================
-- Assignment 4
-- Display employee names and salaries
-- =========================================

SELECT name, salary
FROM employees;

-- =========================================
-- Assignment 5
-- Display employees with salary greater
-- than 50000
-- =========================================

SELECT *
FROM employees
WHERE salary > 50000;

-- =========================================
-- Assignment 6
-- Display employees from Delhi
-- =========================================

SELECT *
FROM employees
WHERE city = 'Delhi';

-- =========================================
-- Assignment 7
-- Display employee names and departments
-- =========================================

SELECT name, department
FROM employees;

-- =========================================
-- Assignment 8
-- Display employees whose salary is less
-- than 60000
-- =========================================

SELECT *
FROM employees
WHERE salary < 60000;

-- =========================================
-- Assignment 9
-- Display employees from IT department
-- =========================================

SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================
-- Assignment 10
-- Display employees from Delhi with salary
-- greater than 45000
-- =========================================

SELECT *
FROM employees
WHERE city = 'Delhi'
AND salary > 45000;