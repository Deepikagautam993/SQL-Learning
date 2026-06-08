-- ============================================================
-- DAY 20 - INDEXING & QUERY OPTIMIZATION
-- FILE 5: ASSIGNMENT WITH SOLUTIONS
-- ============================================================

-- ============================================================
-- INTRODUCTION
-- ============================================================

/*

This assignment is designed to test your
understanding of:

✔ Indexing
✔ B-Tree Index
✔ Unique Index
✔ Composite Index
✔ Partial Index
✔ Expression Index
✔ Query Optimization
✔ EXPLAIN
✔ EXPLAIN ANALYZE

Try solving questions yourself first,
then compare with the solutions.

*/

-- ============================================================
-- DATABASE SETUP
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

-- ============================================================
-- QUESTION 1
-- ============================================================

/*

Create an index on employee_name.

*/

-- SOLUTION

CREATE INDEX idx_employee_name
ON employees(employee_name);

-- ============================================================
-- QUESTION 2
-- ============================================================

/*

Create a unique index on email.

*/

-- SOLUTION

CREATE UNIQUE INDEX idx_email
ON employees(email);

-- ============================================================
-- QUESTION 3
-- ============================================================

/*

Create a composite index using:

department
salary

*/

-- SOLUTION

CREATE INDEX idx_department_salary
ON employees(department, salary);

-- ============================================================
-- QUESTION 4
-- ============================================================

/*

Create a partial index for:

salary > 50000

*/

-- SOLUTION

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 50000;

-- ============================================================
-- QUESTION 5
-- ============================================================

/*

Create an expression index using:

LOWER(employee_name)

*/

-- SOLUTION

CREATE INDEX idx_lower_name
ON employees(LOWER(employee_name));

-- ============================================================
-- QUESTION 6
-- ============================================================

/*

Display all indexes
created on employees table.

*/

-- SOLUTION

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- ============================================================
-- QUESTION 7
-- ============================================================

/*

Use EXPLAIN on:

Search employee_name = 'Neha'

*/

-- SOLUTION

EXPLAIN
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- QUESTION 8
-- ============================================================

/*

Use EXPLAIN ANALYZE on:

salary > 50000

*/

-- SOLUTION

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 50000;

-- ============================================================
-- QUESTION 9
-- ============================================================

/*

Create index on department.

*/

-- SOLUTION

CREATE INDEX idx_department
ON employees(department);

-- ============================================================
-- QUESTION 10
-- ============================================================

/*

Drop index idx_department.

*/

-- SOLUTION

DROP INDEX idx_department;

-- ============================================================
-- THEORY QUESTIONS WITH ANSWERS
-- ============================================================

/*

Q1. What is an Index?

Answer:

An index is a database object that
improves the speed of data retrieval.

------------------------------------------------

Q2. Why are indexes used?

Answer:

Indexes improve query performance
by reducing search time.

------------------------------------------------

Q3. What is Sequential Scan?

Answer:

Sequential Scan reads every row
in a table to find matching data.

------------------------------------------------

Q4. What is Index Scan?

Answer:

Index Scan uses an index to
locate matching rows efficiently.

------------------------------------------------

Q5. What is the default index type
in PostgreSQL?

Answer:

B-Tree Index

------------------------------------------------

Q6. What is a Unique Index?

Answer:

A Unique Index prevents duplicate values.

------------------------------------------------

Q7. What is a Composite Index?

Answer:

An index created on multiple columns.

------------------------------------------------

Q8. What is a Partial Index?

Answer:

An index that stores only selected rows.

------------------------------------------------

Q9. What is an Expression Index?

Answer:

An index built on expressions
or functions.

------------------------------------------------

Q10. Difference between
EXPLAIN and EXPLAIN ANALYZE?

EXPLAIN

Shows estimated execution plan.

EXPLAIN ANALYZE

Executes the query and shows
actual execution details.

*/

-- ============================================================
-- PRACTICAL QUESTIONS
-- ============================================================

/*

Q1.

Create an index on salary.

---------------------------------

Q2.

Create a composite index on:

department
employee_name

---------------------------------

Q3.

Create an expression index using:

UPPER(employee_name)

---------------------------------

Q4.

Create a partial index for:

salary > 55000

---------------------------------

Q5.

Use EXPLAIN ANALYZE on:

department = 'IT'

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

1. What is indexing?

2. Why do databases need indexes?

3. What is B-Tree Index?

4. What is a Unique Index?

5. What is a Composite Index?

6. What is a Partial Index?

7. What is an Expression Index?

8. What is Sequential Scan?

9. Difference between
   Sequential Scan and Index Scan.

10. Difference between
    EXPLAIN and EXPLAIN ANALYZE.

11. What are disadvantages
    of excessive indexing?

12. When should indexes be created?

13. Why should SELECT * be avoided?

14. What is query optimization?

15. How does PostgreSQL choose
    an execution plan?

*/

-- ============================================================
-- REVISION NOTES
-- ============================================================

/*

INDEX
→ Faster Data Retrieval

B-TREE
→ Default Index Type

UNIQUE INDEX
→ Prevents Duplicates

COMPOSITE INDEX
→ Multiple Columns

PARTIAL INDEX
→ Selected Rows Only

EXPRESSION INDEX
→ Function-Based Search

SEQUENTIAL SCAN
→ Reads Entire Table

INDEX SCAN
→ Uses Index

EXPLAIN
→ Estimated Plan

EXPLAIN ANALYZE
→ Actual Plan

QUERY OPTIMIZATION
→ Improve Query Performance

*/

-- ============================================================
-- MARKS-ORIENTED QUESTIONS
-- ============================================================

/*

2 MARKS

1. Define Index.
2. Define Sequential Scan.
3. Define B-Tree Index.
4. Define Unique Index.

---------------------------------

5 MARKS

1. Explain Composite Index.
2. Explain Partial Index.
3. Explain Expression Index.
4. Difference between
   Sequential Scan and Index Scan.

---------------------------------

7 MARKS

1. Explain Indexing in PostgreSQL
   with examples.

2. Explain different types of indexes.

3. Explain Query Optimization
   and EXPLAIN ANALYZE.

*/

-- ============================================================
-- END OF FILE
-- ============================================================