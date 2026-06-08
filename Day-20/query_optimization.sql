-- ============================================================
-- DAY 20 - INDEXING & QUERY OPTIMIZATION
-- FILE 3: QUERY OPTIMIZATION & EXPLAIN ANALYZE
-- ============================================================

-- ============================================================
-- INTRODUCTION
-- ============================================================

/*

Query Optimization is the process of improving
SQL query performance so that data can be
retrieved faster with minimum resource usage.

Goal:

✔ Faster Execution
✔ Lower CPU Usage
✔ Less Memory Consumption
✔ Better User Experience

In real-world applications:

A query taking 20 seconds is bad.

A query taking 0.2 seconds is good.

Optimization helps PostgreSQL choose
the most efficient execution plan.

*/

-- ============================================================
-- CREATE SAMPLE TABLE
-- ============================================================

CREATE TABLE employees (

    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)

);

-- ============================================================
-- SAMPLE DATA
-- ============================================================

INSERT INTO employees VALUES
(101,'Aman','IT',50000),
(102,'Riya','HR',45000),
(103,'Neha','IT',60000),
(104,'Karan','Finance',55000),
(105,'Ankit','Marketing',48000);

-- ============================================================
-- WHAT IS QUERY EXECUTION PLAN?
-- ============================================================

/*

Before executing a query,
PostgreSQL decides:

How to find the data?

This decision is called:

Query Execution Plan

PostgreSQL may choose:

1. Sequential Scan
2. Index Scan
3. Bitmap Scan
4. Join Strategies

The optimizer automatically chooses
the cheapest plan.

*/

-- ============================================================
-- SEQUENTIAL SCAN
-- ============================================================

/*

Sequential Scan means:

Read every row of the table.

Example:

Row 1
Row 2
Row 3
Row 4
...

until matching data is found.

Useful for:

✔ Small Tables

Not ideal for:

✔ Large Tables

*/

SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- EXPLAIN
-- ============================================================

/*

EXPLAIN shows PostgreSQL's plan
without executing the query.

Syntax:

EXPLAIN
SELECT ...;

*/

EXPLAIN
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- SAMPLE OUTPUT INTERPRETATION
-- ============================================================

/*

Example Output:

Seq Scan on employees

Meaning:

PostgreSQL plans to scan
the entire table.

*/

-- ============================================================
-- CREATE INDEX
-- ============================================================

CREATE INDEX idx_emp_name
ON employees(employee_name);

-- ============================================================
-- CHECK PLAN AGAIN
-- ============================================================

EXPLAIN
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- INDEX SCAN
-- ============================================================

/*

Possible Output:

Index Scan using idx_emp_name

Meaning:

PostgreSQL is using the index.

Benefits:

✔ Faster Search
✔ Less Data Reading
✔ Better Performance

*/

-- ============================================================
-- EXPLAIN ANALYZE
-- ============================================================

/*

EXPLAIN ANALYZE executes the query
and shows actual execution details.

Syntax:

EXPLAIN ANALYZE
SELECT ...;

*/

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- WHY EXPLAIN ANALYZE IS IMPORTANT?
-- ============================================================

/*

EXPLAIN

Shows estimated plan.

--------------------------------

EXPLAIN ANALYZE

Shows actual execution.

--------------------------------

Interview Tip:

EXPLAIN ANALYZE is used
for performance tuning.

*/

-- ============================================================
-- COST ESTIMATION
-- ============================================================

/*

Example Output:

cost=0.00..12.50

Meaning:

PostgreSQL estimates
the work required.

Lower cost usually means:

✔ Better performance

The optimizer tries to choose
the plan with the lowest cost.

*/

-- ============================================================
-- BAD QUERY EXAMPLE
-- ============================================================

SELECT *
FROM employees;

-- Problem:

/*

Returns all columns.

May transfer unnecessary data.

Avoid when only a few columns
are needed.

*/

-- ============================================================
-- BETTER QUERY
-- ============================================================

SELECT employee_name,
       salary
FROM employees;

-- Benefits:

/*

✔ Less Data Transfer

✔ Faster Processing

✔ Better Performance

*/

-- ============================================================
-- BAD QUERY EXAMPLE 2
-- ============================================================

SELECT *
FROM employees
WHERE LOWER(employee_name) = 'aman';

-- Problem:

/*

Function may prevent
normal index usage.

*/

-- ============================================================
-- BETTER SOLUTION
-- ============================================================

CREATE INDEX idx_lower_name
ON employees(LOWER(employee_name));

SELECT *
FROM employees
WHERE LOWER(employee_name) = 'aman';

-- ============================================================
-- BAD QUERY EXAMPLE 3
-- ============================================================

SELECT *
FROM employees
WHERE salary + 1000 > 50000;

-- Problem:

/*

Expression on column
can reduce index usage.

*/

-- ============================================================
-- BETTER QUERY
-- ============================================================

SELECT *
FROM employees
WHERE salary > 49000;

-- Benefits:

/*

Allows PostgreSQL to use indexes
more effectively.

*/

-- ============================================================
-- INDEXED SEARCH
-- ============================================================

CREATE INDEX idx_salary
ON employees(salary);

SELECT *
FROM employees
WHERE salary > 50000;

-- ============================================================
-- ORDER BY OPTIMIZATION
-- ============================================================

CREATE INDEX idx_salary_sort
ON employees(salary);

SELECT *
FROM employees
ORDER BY salary;

-- ============================================================
-- JOIN OPTIMIZATION
-- ============================================================

CREATE TABLE departments (

    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)

);

-- Join columns should often be indexed

/*

Commonly Indexed:

employee_id
customer_id
department_id
order_id

*/

-- ============================================================
-- QUERY OPTIMIZATION RULES
-- ============================================================

/*

RULE 1

Use indexes on frequently searched columns.

-----------------------------------

RULE 2

Avoid SELECT *

-----------------------------------

RULE 3

Retrieve only required columns.

-----------------------------------

RULE 4

Use EXPLAIN ANALYZE regularly.

-----------------------------------

RULE 5

Index JOIN columns.

-----------------------------------

RULE 6

Avoid unnecessary functions
inside WHERE clauses.

-----------------------------------

RULE 7

Create composite indexes
for multi-column filtering.

*/

-- ============================================================
-- REAL-WORLD EXAMPLES
-- ============================================================

/*

E-Commerce

Search Product

WHERE product_name = ?

-----------------------------------

Banking

Search Customer

WHERE account_number = ?

-----------------------------------

Social Media

Search User

WHERE username = ?

-----------------------------------

University

Search Student

WHERE roll_number = ?

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

Q1. What is Query Optimization?

Answer:

Improving query performance
to retrieve data efficiently.

-----------------------------------

Q2. What is Sequential Scan?

Answer:

Scanning every row
of a table.

-----------------------------------

Q3. What is Index Scan?

Answer:

Using an index to locate data.

-----------------------------------

Q4. Difference between
EXPLAIN and EXPLAIN ANALYZE?

EXPLAIN

Shows estimated plan.

EXPLAIN ANALYZE

Executes query and shows
actual execution details.

-----------------------------------

Q5. Why should we avoid SELECT * ?

Answer:

It retrieves unnecessary columns
and increases resource usage.

-----------------------------------

Q6. Why is EXPLAIN ANALYZE important?

Answer:

It helps identify performance bottlenecks.

*/

-- ============================================================
-- REVISION SHEET
-- ============================================================

/*

SEQUENTIAL SCAN

Read every row.

-----------------------------------

INDEX SCAN

Use index for searching.

-----------------------------------

EXPLAIN

Estimated execution plan.

-----------------------------------

EXPLAIN ANALYZE

Actual execution plan.

-----------------------------------

OPTIMIZATION

Make queries faster.

*/

-- ============================================================
-- END OF FILE
-- ============================================================