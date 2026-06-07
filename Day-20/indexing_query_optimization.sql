-- =========================================================
-- DAY 20 - INDEXING & QUERY OPTIMIZATION (FULL PRACTICAL)
-- =========================================================

-- =========================================================
-- 1. CREATE EMPLOYEE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)

);

-- =========================================================
-- 🧠 PRIMARY KEY automatically creates index on emp_id
-- =========================================================

-- =========================================================
-- 2. INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees VALUES (101, 'Aman', 'IT', 60000, 'Bhopal');
INSERT INTO employees VALUES (102, 'Riya', 'HR', 45000, 'Indore');
INSERT INTO employees VALUES (103, 'Neha', 'Finance', 80000, 'Delhi');
INSERT INTO employees VALUES (104, 'Karan', 'IT', 70000, 'Bhopal');
INSERT INTO employees VALUES (105, 'Simran', 'Admin', 30000, 'Pune');

-- =========================================================
-- 3. BASIC QUERY (WITHOUT INDEX USAGE)
-- =========================================================

SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================================
-- 🧠 This may use SEQUENTIAL SCAN if no index exists
-- =========================================================

-- =========================================================
-- 4. CREATE INDEX ON SINGLE COLUMN
-- =========================================================

CREATE INDEX idx_department
ON employees(department);

-- =========================================================
-- 5. QUERY USING INDEX
-- =========================================================

SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================================
-- 🧠 Now PostgreSQL may use INDEX SCAN
-- =========================================================

-- =========================================================
-- 6. INDEX ON SALARY COLUMN
-- =========================================================

CREATE INDEX idx_salary
ON employees(salary);

-- =========================================================
-- QUERY: RANGE CONDITION
-- =========================================================

SELECT *
FROM employees
WHERE salary > 50000;

-- =========================================================
-- 7. COMPOSITE INDEX (MULTIPLE COLUMNS)
-- =========================================================

CREATE INDEX idx_dept_salary
ON employees(department, salary);

-- =========================================================
-- QUERY USING COMPOSITE INDEX
-- =========================================================

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;

-- =========================================================
-- 🧠 PostgreSQL first checks department then salary
-- =========================================================

-- =========================================================
-- 8. PARTIAL INDEX (FILTERED DATA)
-- =========================================================

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 50000;

-- =========================================================
-- QUERY USING PARTIAL INDEX
-- =========================================================

SELECT *
FROM employees
WHERE salary > 50000;

-- =========================================================
-- 🧠 Only high salary rows are indexed
-- =========================================================

-- =========================================================
-- 9. EXPRESSION INDEX
-- =========================================================

CREATE INDEX idx_lower_name
ON employees(LOWER(emp_name));

-- =========================================================
-- QUERY USING EXPRESSION INDEX
-- =========================================================

SELECT *
FROM employees
WHERE LOWER(emp_name) = 'aman';

-- =========================================================
-- 🧠 Useful when functions are used in WHERE clause
-- =========================================================

-- =========================================================
-- 10. EXPLAIN QUERY PLAN
-- =========================================================

EXPLAIN
SELECT *
FROM employees
WHERE emp_id = 101;

-- =========================================================
-- 🧠 Shows whether Index Scan or Seq Scan is used
-- =========================================================

-- =========================================================
-- 11. EXPLAIN ANALYZE (REAL PERFORMANCE)
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================================
-- 🧠 Shows actual execution time
-- =========================================================

-- =========================================================
-- 12. QUERY OPTIMIZATION EXAMPLES
-- =========================================================

-- ❌ BAD PRACTICE: SELECT *
SELECT * FROM employees;

-- ✅ GOOD PRACTICE: Select required columns
SELECT emp_name, salary
FROM employees;

-- =========================================================

-- ❌ BAD: No filter
SELECT * FROM employees;

-- ✅ GOOD: Use WHERE condition
SELECT *
FROM employees
WHERE emp_id = 101;

-- =========================================================

-- ❌ BAD: Function without index support
-- WHERE LOWER(emp_name) = 'aman'

-- =========================================================

-- 13. DROP INDEX (OPTIONAL)
-- =========================================================

-- DROP INDEX idx_department;

-- =========================================================
-- 🧠 DROP INDEX used when performance testing or cleanup
-- =========================================================

-- =========================================================
-- 14. FINAL REVISION NOTES
-- =========================================================

-- ✔ Index improves SELECT speed
-- ✔ Index slows INSERT/UPDATE/DELETE
-- ✔ PRIMARY KEY = automatic index
-- ✔ EXPLAIN shows execution plan
-- ✔ EXPLAIN ANALYZE shows real time
-- ✔ Composite index = multiple columns
-- ✔ Partial index = filtered rows
-- ✔ Expression index = function-based index

-- =========================================================
-- END OF FILE
-- =========================================================