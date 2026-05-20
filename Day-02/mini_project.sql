-- =========================================
-- MINI PROJECT - EMPLOYEE ANALYTICS SYSTEM
-- =========================================

-- =========================================
-- Create Employee Table
-- =========================================

CREATE TABLE employee_data (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);

-- =========================================
-- Insert Employee Records
-- =========================================

INSERT INTO employee_data
VALUES
(101, 'Deepika', 'AI', 85000, 'Jabalpur', 2),
(102, 'Rahul', 'HR', 45000, 'Delhi', 3),
(103, 'Riya', 'IT', 70000, 'Mumbai', 4),
(104, 'Aman', 'Finance', 55000, 'Pune', 2),
(105, 'Simran', 'Sales', 50000, 'Indore', 1),
(106, 'Ankit', 'AI', 95000, 'Delhi', 5);

-- =========================================
-- Query 1
-- Display all employee records
-- =========================================

SELECT * FROM employee_data;

-- =========================================
-- Query 2
-- Display employees with salary
-- greater than 60000
-- =========================================

SELECT *
FROM employee_data
WHERE salary > 60000;

-- =========================================
-- Query 3
-- Display employees from Delhi
-- =========================================

SELECT *
FROM employee_data
WHERE city = 'Delhi';

-- =========================================
-- Query 4
-- Display employees from AI department
-- =========================================

SELECT *
FROM employee_data
WHERE department = 'AI';

-- =========================================
-- Query 5
-- Display employees with experience
-- greater than 2 years
-- =========================================

SELECT *
FROM employee_data
WHERE experience > 2;

-- =========================================
-- Query 6
-- Display employee names and salaries
-- =========================================

SELECT emp_name, salary
FROM employee_data;

-- =========================================
-- Query 7
-- Display employees from Delhi with
-- salary greater than 50000
-- =========================================

SELECT *
FROM employee_data
WHERE city = 'Delhi'
AND salary > 50000;