-- ============================================================
-- DAY 20 - INDEXING & QUERY OPTIMIZATION
-- FILE 4: PRACTICE LAB
-- ============================================================

-- ============================================================
-- OBJECTIVE
-- ============================================================

/*

This practice file helps you build confidence
with Indexing and Query Optimization.

You will practice:

✔ Creating Indexes
✔ Different Index Types
✔ EXPLAIN
✔ EXPLAIN ANALYZE
✔ Query Optimization
✔ Performance-Oriented Thinking

Complete each exercise carefully and
observe query behavior.

*/

-- ============================================================
-- SETUP DATABASE
-- ============================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (

    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)

);

INSERT INTO employees VALUES
(101,'Aman','aman@gmail.com','IT',50000),
(102,'Riya','riya@gmail.com','HR',45000),
(103,'Neha','neha@gmail.com','IT',60000),
(104,'Karan','karan@gmail.com','Finance',55000),
(105,'Ankit','ankit@gmail.com','Marketing',48000);

SELECT * FROM employees;

-- ============================================================
-- EXERCISE 1
-- CREATE BASIC INDEX
-- ============================================================

/*

Task:

Create an index on employee_name.

*/

CREATE INDEX idx_employee_name
ON employees(employee_name);

-- Verify

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- ============================================================
-- EXERCISE 2
-- SEARCH USING INDEXED COLUMN
-- ============================================================

SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- EXERCISE 3
-- CHECK EXECUTION PLAN
-- ============================================================

EXPLAIN
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- EXERCISE 4
-- EXPLAIN ANALYZE
-- ============================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- EXERCISE 5
-- UNIQUE INDEX
-- ============================================================

/*

Task:

Prevent duplicate email entries.

*/

CREATE UNIQUE INDEX idx_email
ON employees(email);

-- ============================================================
-- EXERCISE 6
-- TEST UNIQUE INDEX
-- ============================================================

/*

Expected:

Error due to duplicate email.

*/

-- Uncomment to test

/*
INSERT INTO employees
VALUES
(106,'Test','aman@gmail.com','IT',50000);
*/

-- ============================================================
-- EXERCISE 7
-- COMPOSITE INDEX
-- ============================================================

CREATE INDEX idx_dept_salary
ON employees(department, salary);

-- Query

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;

-- ============================================================
-- EXERCISE 8
-- PARTIAL INDEX
-- ============================================================

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 50000;

SELECT *
FROM employees
WHERE salary > 50000;

-- ============================================================
-- EXERCISE 9
-- EXPRESSION INDEX
-- ============================================================

CREATE INDEX idx_lower_name
ON employees(LOWER(employee_name));

SELECT *
FROM employees
WHERE LOWER(employee_name) = 'aman';

-- ============================================================
-- EXERCISE 10
-- IDENTIFY BAD QUERY
-- ============================================================

SELECT *
FROM employees;

-- Question:
-- Why is SELECT * often discouraged?

/*

Answer:

Retrieves unnecessary columns.

*/

-- ============================================================
-- EXERCISE 11
-- OPTIMIZE QUERY
-- ============================================================

SELECT employee_name,
       salary
FROM employees;

-- Better than SELECT *

-- ============================================================
-- EXERCISE 12
-- INDEXED RANGE SEARCH
-- ============================================================

CREATE INDEX idx_salary
ON employees(salary);

SELECT *
FROM employees
WHERE salary > 50000;

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 50000;

-- ============================================================
-- EXERCISE 13
-- ORDER BY OPTIMIZATION
-- ============================================================

CREATE INDEX idx_salary_order
ON employees(salary);

SELECT *
FROM employees
ORDER BY salary;

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary;

-- ============================================================
-- EXERCISE 14
-- INDEX INFORMATION
-- ============================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- ============================================================
-- EXERCISE 15
-- DROP INDEX
-- ============================================================

/*

Syntax Practice

*/

-- DROP INDEX idx_salary_order;

-- ============================================================
-- INTERVIEW CHALLENGE 1
-- ============================================================

/*

Question:

Which index should be used
for preventing duplicate emails?

Answer:

UNIQUE INDEX

*/

-- ============================================================
-- INTERVIEW CHALLENGE 2
-- ============================================================

/*

Question:

Which command shows
actual query execution details?

Answer:

EXPLAIN ANALYZE

*/

-- ============================================================
-- INTERVIEW CHALLENGE 3
-- ============================================================

/*

Question:

Which index is useful for:

department + salary

Answer:

COMPOSITE INDEX

*/

-- ============================================================
-- INTERVIEW CHALLENGE 4
-- ============================================================

/*

Question:

Which index is useful
for LOWER(username)?

Answer:

EXPRESSION INDEX

*/

-- ============================================================
-- INTERVIEW CHALLENGE 5
-- ============================================================

/*

Question:

What is the default index type
in PostgreSQL?

Answer:

B-TREE

*/

-- ============================================================
-- SELF PRACTICE TASKS
-- ============================================================

/*

TASK 1

Create an index on department.

-----------------------------------

TASK 2

Create a unique index on employee_name.

-----------------------------------

TASK 3

Create a composite index on:

department, employee_name

-----------------------------------

TASK 4

Create a partial index for:

salary > 55000

-----------------------------------

TASK 5

Create an expression index using UPPER().

-----------------------------------

TASK 6

Use EXPLAIN on a query.

-----------------------------------

TASK 7

Use EXPLAIN ANALYZE on a query.

-----------------------------------

TASK 8

Compare a query before and after indexing.

*/

-- ============================================================
-- REVISION SHEET
-- ============================================================

/*

INDEX
→ Faster Searching

B-TREE
→ Default Index

UNIQUE
→ Prevent Duplicates

COMPOSITE
→ Multiple Columns

PARTIAL
→ Selected Rows

EXPRESSION
→ Function-Based Search

EXPLAIN
→ Estimated Plan

EXPLAIN ANALYZE
→ Actual Plan

*/

-- ============================================================
-- END OF FILE
-- ============================================================