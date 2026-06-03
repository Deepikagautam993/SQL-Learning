-- =========================================================
-- DAY 16 MINI PROJECT
-- EMPLOYEE SEARCH OPTIMIZATION SYSTEM
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    email VARCHAR(100)

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000,'aman@gmail.com'),
(102,'Riya Gupta','HR',45000,'riya@gmail.com'),
(103,'Karan Singh','IT',75000,'karan@gmail.com'),
(104,'Neha Verma','Finance',85000,'neha@gmail.com'),
(105,'Rohit Patel','IT',95000,'rohit@gmail.com'),
(106,'Priya Jain','HR',55000,'priya@gmail.com'),
(107,'Arjun Mishra','Finance',72000,'arjun@gmail.com');

-- =========================================================
-- UNIQUE INDEX ON EMAIL
-- =========================================================

CREATE UNIQUE INDEX idx_email
ON employees(email);

-- =========================================================
-- COMPOSITE INDEX
-- =========================================================

CREATE INDEX idx_dept_salary
ON employees(department, salary);

-- =========================================================
-- PARTIAL INDEX
-- =========================================================

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 70000;

-- =========================================================
-- SEARCH BY EMPLOYEE ID
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE emp_id = 103;

-- =========================================================
-- SEARCH BY EMAIL
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE email = 'karan@gmail.com';

-- =========================================================
-- SEARCH BY DEPARTMENT
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================================
-- SEARCH BY DEPARTMENT + SALARY
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 70000;

-- =========================================================
-- HIGH SALARY EMPLOYEES
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 70000;

-- =========================================================
-- SORT EMPLOYEES BY SALARY
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary;

-- =========================================================
-- VIEW ALL INDEXES
-- =========================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- =========================================================
-- PROJECT REPORT QUERIES
-- =========================================================

-- Total Employees

SELECT COUNT(*)
FROM employees;

-- Average Salary

SELECT AVG(salary)
FROM employees;

-- Highest Salary

SELECT MAX(salary)
FROM employees;

-- Department Wise Employees

SELECT department,
       COUNT(*)
FROM employees
GROUP BY department;

-- =========================================================
-- END OF PROJECT
-- =========================================================