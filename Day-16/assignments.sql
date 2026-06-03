-- =========================================================
-- DAY 16
-- FILE 4 : ASSIGNMENTS WITH SOLUTIONS
-- =========================================================

-- =========================================================
-- ASSIGNMENT 1
-- CREATE INDEX ON EMPLOYEE ID
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    email VARCHAR(100)

);

-- Solution

CREATE INDEX idx_emp_id
ON employees(emp_id);

-- =========================================================
-- ASSIGNMENT 2
-- CREATE UNIQUE INDEX ON EMAIL
-- =========================================================

-- Solution

CREATE UNIQUE INDEX idx_email
ON employees(email);

-- =========================================================
-- ASSIGNMENT 3
-- CREATE COMPOSITE INDEX
-- =========================================================

-- Requirement:
-- Optimize searches using:
-- department + salary

-- Solution

CREATE INDEX idx_dept_salary
ON employees(department, salary);

-- =========================================================
-- ASSIGNMENT 4
-- CREATE PARTIAL INDEX
-- =========================================================

-- Requirement:
-- Frequently searched:
-- salary > 70000

-- Solution

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 70000;

-- =========================================================
-- ASSIGNMENT 5
-- VIEW ALL INDEXES
-- =========================================================

-- Solution

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- =========================================================
-- ASSIGNMENT 6
-- DROP AN INDEX
-- =========================================================

-- Solution

DROP INDEX idx_high_salary;

-- =========================================================
-- ASSIGNMENT 7
-- USE EXPLAIN
-- =========================================================

-- Solution

EXPLAIN
SELECT *
FROM employees
WHERE emp_id = 5;

-- =========================================================
-- ASSIGNMENT 8
-- USE EXPLAIN ANALYZE
-- =========================================================

-- Solution

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE emp_id = 5;

-- =========================================================
-- ASSIGNMENT 9
-- ORDER BY OPTIMIZATION
-- =========================================================

CREATE INDEX idx_salary
ON employees(salary);

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary;

-- =========================================================
-- ASSIGNMENT 10
-- PRIMARY KEY INDEX
-- =========================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);

-- PostgreSQL automatically creates
-- an index on student_id

-- =========================================================
-- THEORY QUESTIONS
-- =========================================================

-- Q1. What is an Index?
-- Answer:
-- A database object used to speed up data retrieval.

-- ---------------------------------------------------------

-- Q2. Which operation benefits most?
-- Answer:
-- SELECT

-- ---------------------------------------------------------

-- Q3. What is PostgreSQL's default index?
-- Answer:
-- B-Tree Index

-- ---------------------------------------------------------

-- Q4. What is a Unique Index?
-- Answer:
-- Prevents duplicate values.

-- ---------------------------------------------------------

-- Q5. What is a Composite Index?
-- Answer:
-- Index built on multiple columns.

-- ---------------------------------------------------------

-- Q6. What is a Partial Index?
-- Answer:
-- Index built only on rows matching a condition.

-- ---------------------------------------------------------

-- Q7. What is EXPLAIN?
-- Answer:
-- Shows estimated execution plan.

-- ---------------------------------------------------------

-- Q8. What is EXPLAIN ANALYZE?
-- Answer:
-- Runs query and shows actual execution statistics.

-- ---------------------------------------------------------

-- Q9. What is Sequential Scan?
-- Answer:
-- Reading rows one by one.

-- ---------------------------------------------------------

-- Q10. What is Index Scan?
-- Answer:
-- Using index to locate rows quickly.

-- =========================================================
-- PRACTICE TASKS
-- =========================================================

-- Task 1
-- Create an index on emp_name

CREATE INDEX idx_emp_name
ON employees(emp_name);

-- ---------------------------------------------------------

-- Task 2
-- Create a unique index on email

CREATE UNIQUE INDEX idx_email2
ON employees(email);

-- ---------------------------------------------------------

-- Task 3
-- Create a composite index on:
-- department and emp_name

CREATE INDEX idx_dept_name
ON employees(department, emp_name);

-- ---------------------------------------------------------

-- Task 4
-- Create a partial index:
-- salary > 50000

CREATE INDEX idx_salary_partial
ON employees(salary)
WHERE salary > 50000;

-- =========================================================
-- END OF FILE
-- =========================================================