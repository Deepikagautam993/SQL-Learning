-- ============================================================
-- DAY 20 - INDEXING & QUERY OPTIMIZATION
-- FILE 1: INDEXING BASICS
-- ============================================================

-- ============================================================
-- INTRODUCTION TO INDEXING
-- ============================================================

/*

INDEX is a database object that improves
the speed of data retrieval operations.

Without an index, PostgreSQL may need to
scan every row in a table to find data.

This is called:

SEQUENTIAL SCAN (SEQ SCAN)

An index allows PostgreSQL to locate
required rows much faster.

Think of an index like the index page
of a book.

Without an index:
You read the entire book.

With an index:
You directly jump to the required page.

*/

-- ============================================================
-- WHY DO WE NEED INDEXES?
-- ============================================================

/*

As table size increases:

10 rows      → Fast search
100 rows     → Fast search
1,000 rows   → Acceptable
10,000 rows  → Slower
100,000+     → Noticeable delay
Millions     → Very slow

Indexes help reduce search time.

Benefits:

✔ Faster SELECT queries
✔ Faster WHERE filtering
✔ Faster JOIN operations
✔ Faster ORDER BY operations
✔ Better database performance

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
-- INSERT SAMPLE DATA
-- ============================================================

INSERT INTO employees VALUES
(101,'Aman','IT',50000),
(102,'Riya','HR',45000),
(103,'Neha','IT',60000),
(104,'Karan','Finance',55000),
(105,'Ankit','Marketing',48000);

-- ============================================================
-- VIEW DATA
-- ============================================================

SELECT *
FROM employees;

-- ============================================================
-- SEARCH WITHOUT INDEX
-- ============================================================

/*

Suppose PostgreSQL executes:

SELECT *
FROM employees
WHERE employee_name = 'Neha';

Without an index:

PostgreSQL checks:

Row 1
Row 2
Row 3
...

until the record is found.

This process is called:

SEQUENTIAL SCAN

*/

SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- CREATE FIRST INDEX
-- ============================================================

/*

Syntax:

CREATE INDEX index_name
ON table_name(column_name);

*/

CREATE INDEX idx_employee_name
ON employees(employee_name);

-- ============================================================
-- SEARCH WITH INDEX
-- ============================================================

/*

Now PostgreSQL can use the index
to locate records quickly.

Instead of checking every row,
it uses the index structure.

*/

SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- VIEW ALL INDEXES
-- ============================================================

/*

Shows indexes created on a table.

*/

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- ============================================================
-- PRIMARY KEY INDEX
-- ============================================================

/*

Important:

When PRIMARY KEY is created,
PostgreSQL automatically creates
a unique index.

Example:

employee_id INT PRIMARY KEY

Automatically generates an index.

No need to create another index
on the same column.

*/

-- ============================================================
-- PRIMARY KEY SEARCH
-- ============================================================

SELECT *
FROM employees
WHERE employee_id = 101;

-- ============================================================
-- WHEN SHOULD WE CREATE INDEXES?
-- ============================================================

/*

Create indexes on columns used frequently in:

✔ WHERE clause
✔ JOIN conditions
✔ ORDER BY clause
✔ GROUP BY clause

Examples:

employee_id
email
username
department_id
customer_id

*/

-- ============================================================
-- EXAMPLE: INDEX ON DEPARTMENT
-- ============================================================

CREATE INDEX idx_department
ON employees(department);

SELECT *
FROM employees
WHERE department = 'IT';

-- ============================================================
-- ADVANTAGES OF INDEXING
-- ============================================================

/*

1. Faster Data Retrieval

PostgreSQL finds records quickly.

-----------------------------------

2. Improved Query Performance

Complex queries become faster.

-----------------------------------

3. Better User Experience

Applications respond quickly.

-----------------------------------

4. Faster JOIN Operations

Useful for large databases.

*/

-- ============================================================
-- DISADVANTAGES OF INDEXING
-- ============================================================

/*

Indexes are useful,
but too many indexes can create problems.

1. Extra Storage

Indexes consume disk space.

-----------------------------------

2. Slower INSERT

Every insert updates indexes.

-----------------------------------

3. Slower UPDATE

Indexes must be maintained.

-----------------------------------

4. Slower DELETE

Index entries must be removed.

*/

-- ============================================================
-- EXAMPLE: INSERT PERFORMANCE
-- ============================================================

/*

When a new row is inserted:

INSERT INTO employees
VALUES (...);

PostgreSQL updates:

1. Table Data
2. All Related Indexes

More indexes = More work.

*/

-- ============================================================
-- BEST PRACTICES
-- ============================================================

/*

✔ Create indexes only when needed

✔ Index frequently searched columns

✔ Avoid unnecessary indexes

✔ Monitor query performance

✔ Use EXPLAIN ANALYZE
   to check execution plans

*/

-- ============================================================
-- REAL-WORLD USE CASES
-- ============================================================

/*

E-Commerce:

Search products by product_name

-----------------------------------

Banking:

Search customer by account_number

-----------------------------------

Social Media:

Search users by username

-----------------------------------

University:

Search students by roll_number

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

Q1. What is an Index?

Answer:

An index is a database object
that improves the speed of data retrieval.

-----------------------------------

Q2. Why are indexes used?

Answer:

To improve query performance.

-----------------------------------

Q3. What is Sequential Scan?

Answer:

Scanning every row of a table
to find matching records.

-----------------------------------

Q4. Does PRIMARY KEY create an index?

Answer:

Yes.

PostgreSQL automatically creates
a unique index for PRIMARY KEY.

-----------------------------------

Q5. What are disadvantages of indexing?

Answer:

✔ Extra storage
✔ Slower INSERT
✔ Slower UPDATE
✔ Slower DELETE

*/

-- ============================================================
-- REVISION SHEET
-- ============================================================

/*

INDEX
→ Faster searching

SEQUENTIAL SCAN
→ Check every row

PRIMARY KEY
→ Automatically indexed

CREATE INDEX
→ Create custom index

Advantages

✔ Fast Queries
✔ Better Performance

Disadvantages

✔ More Storage
✔ Slower Modifications

*/

-- ============================================================
-- END OF FILE
-- ============================================================