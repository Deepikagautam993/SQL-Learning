-- ============================================================
-- DAY 20 - INDEXING & QUERY OPTIMIZATION
-- FILE 2: TYPES OF INDEXES IN POSTGRESQL
-- ============================================================

-- ============================================================
-- INTRODUCTION
-- ============================================================

/*

PostgreSQL supports different types of indexes.

Each index is designed for a specific purpose.

Choosing the correct index type
can significantly improve query performance.

In this file we will learn:

1. B-Tree Index
2. Unique Index
3. Composite Index
4. Partial Index
5. Expression Index

*/

-- ============================================================
-- CREATE SAMPLE TABLE
-- ============================================================

CREATE TABLE employees (

    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)

);

-- ============================================================
-- INSERT SAMPLE DATA
-- ============================================================

INSERT INTO employees VALUES
(101,'Aman','aman@gmail.com','IT',50000),
(102,'Riya','riya@gmail.com','HR',45000),
(103,'Neha','neha@gmail.com','IT',60000),
(104,'Karan','karan@gmail.com','Finance',55000),
(105,'Ankit','ankit@gmail.com','Marketing',48000);

-- ============================================================
-- 1. B-TREE INDEX
-- ============================================================

/*

B-Tree is the default index type in PostgreSQL.

Most indexes created in PostgreSQL
are B-Tree indexes.

Best For:

✔ Equality Search (=)
✔ Range Search (<, >, <=, >=)
✔ BETWEEN
✔ ORDER BY

*/

CREATE INDEX idx_emp_name
ON employees(employee_name);

-- Example Queries

SELECT *
FROM employees
WHERE employee_name = 'Neha';

SELECT *
FROM employees
WHERE salary > 50000;

SELECT *
FROM employees
ORDER BY salary;

-- ============================================================
-- B-TREE ADVANTAGES
-- ============================================================

/*

✔ Fast searching
✔ Fast sorting
✔ Default index type
✔ Suitable for most applications

*/

-- ============================================================
-- 2. UNIQUE INDEX
-- ============================================================

/*

A UNIQUE INDEX prevents duplicate values.

Useful for:

✔ Email
✔ Username
✔ Aadhaar Number
✔ Account Number

*/

CREATE UNIQUE INDEX idx_email
ON employees(email);

-- Valid

INSERT INTO employees
VALUES
(106,'Rohit','rohit@gmail.com','IT',52000);

-- Invalid (duplicate email)

-- INSERT INTO employees
-- VALUES
-- (107,'Test','aman@gmail.com','IT',50000);

-- PostgreSQL will generate an error.

-- ============================================================
-- UNIQUE INDEX BENEFITS
-- ============================================================

/*

✔ Prevents duplicate data
✔ Improves search speed
✔ Maintains data integrity

*/

-- ============================================================
-- 3. COMPOSITE INDEX
-- ============================================================

/*

Composite Index uses multiple columns.

Useful when queries frequently
filter using more than one column.

*/

CREATE INDEX idx_dept_salary
ON employees(department, salary);

-- Example

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;

-- ============================================================
-- COMPOSITE INDEX BENEFITS
-- ============================================================

/*

Useful for:

department + salary

city + state

first_name + last_name

customer_id + order_date

*/

-- ============================================================
-- IMPORTANT RULE
-- ============================================================

/*

Composite Index:

(department, salary)

Works efficiently for:

department

department + salary

But NOT always for:

salary only

*/

-- ============================================================
-- 4. PARTIAL INDEX
-- ============================================================

/*

Partial Index indexes only a portion
of the table.

Useful when queries focus on
specific rows.

Reduces storage requirements.

*/

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 50000;

-- Example

SELECT *
FROM employees
WHERE salary > 50000;

-- ============================================================
-- PARTIAL INDEX BENEFITS
-- ============================================================

/*

✔ Smaller index size
✔ Faster maintenance
✔ Better performance
✔ Reduced storage

*/

-- ============================================================
-- REAL-WORLD EXAMPLE
-- ============================================================

/*

E-commerce

Index only active products:

WHERE status = 'Active'

Instead of indexing every row.

*/

-- ============================================================
-- 5. EXPRESSION INDEX
-- ============================================================

/*

Expression Index stores results
of an expression.

Useful when functions are frequently used.

*/

CREATE INDEX idx_lower_name
ON employees(LOWER(employee_name));

-- Example

SELECT *
FROM employees
WHERE LOWER(employee_name) = 'aman';

-- ============================================================
-- EXPRESSION INDEX BENEFITS
-- ============================================================

/*

Useful for:

LOWER()

UPPER()

TRIM()

Date Functions

Calculated Columns

*/

-- ============================================================
-- REAL-WORLD EXAMPLE
-- ============================================================

/*

User Login System

Case-insensitive search

LOWER(username)

*/

-- ============================================================
-- VIEW ALL INDEXES
-- ============================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- ============================================================
-- REMOVE INDEX
-- ============================================================

/*

Syntax:

DROP INDEX index_name;

*/

-- Example

-- DROP INDEX idx_emp_name;

-- ============================================================
-- COMPARISON TABLE
-- ============================================================

/*

B-TREE

Best For:
General Purpose Searches

---------------------------------

UNIQUE INDEX

Best For:
Preventing Duplicates

---------------------------------

COMPOSITE INDEX

Best For:
Multiple Column Searches

---------------------------------

PARTIAL INDEX

Best For:
Specific Rows

---------------------------------

EXPRESSION INDEX

Best For:
Function-Based Searches

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

Q1. Which is the default index type
in PostgreSQL?

Answer:

B-Tree

---------------------------------

Q2. What is a Unique Index?

Answer:

An index that prevents duplicate values.

---------------------------------

Q3. What is a Composite Index?

Answer:

An index created on multiple columns.

---------------------------------

Q4. What is a Partial Index?

Answer:

An index that stores only selected rows.

---------------------------------

Q5. What is an Expression Index?

Answer:

An index created on expressions or functions.

---------------------------------

Q6. Which index is useful for
case-insensitive searching?

Answer:

Expression Index

*/

-- ============================================================
-- REVISION SHEET
-- ============================================================

/*

B-TREE
→ General Purpose

UNIQUE
→ No Duplicates

COMPOSITE
→ Multiple Columns

PARTIAL
→ Selected Rows

EXPRESSION
→ Function-Based Search

*/

-- ============================================================
-- END OF FILE
-- ============================================================