-- =========================================================
-- DAY 16
-- FILE 2 : INDEX TYPES
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    email VARCHAR(100)

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(1,'Aman','IT',60000,'aman@gmail.com'),
(2,'Riya','HR',45000,'riya@gmail.com'),
(3,'Karan','IT',75000,'karan@gmail.com'),
(4,'Neha','Finance',80000,'neha@gmail.com'),
(5,'Rohit','IT',90000,'rohit@gmail.com');

-- =========================================================
-- 1. B-TREE INDEX (DEFAULT)
-- =========================================================

CREATE INDEX idx_salary
ON employees(salary);

SELECT *
FROM employees
WHERE salary > 50000;

-- =========================================================
-- 2. UNIQUE INDEX
-- =========================================================

CREATE UNIQUE INDEX idx_email
ON employees(email);

-- This would fail if email already exists

-- INSERT INTO employees
-- VALUES
-- (6,'Priya','HR',55000,'aman@gmail.com');

-- =========================================================
-- 3. COMPOSITE INDEX
-- =========================================================

CREATE INDEX idx_dept_salary
ON employees(department, salary);

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- =========================================================
-- 4. PARTIAL INDEX
-- =========================================================

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 70000;

SELECT *
FROM employees
WHERE salary > 70000;

-- =========================================================
-- 5. PRIMARY KEY INDEX
-- =========================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);

-- PostgreSQL automatically creates
-- an index for PRIMARY KEY

-- =========================================================
-- VIEW ALL INDEXES
-- =========================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- =========================================================
-- PRACTICE QUERIES
-- =========================================================

SELECT *
FROM employees
WHERE email = 'aman@gmail.com';

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 70000;

SELECT *
FROM employees
WHERE salary > 80000;

-- =========================================================
-- INTERVIEW NOTES
-- =========================================================

-- B-Tree Index
-- Default PostgreSQL index

-- Unique Index
-- Prevents duplicate values

-- Composite Index
-- Multiple columns together

-- Partial Index
-- Index only selected rows

-- Primary Key
-- Auto indexed

-- =========================================================
-- END OF FILE
-- =========================================================