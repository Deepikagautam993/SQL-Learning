-- =========================================================
-- DAY 16
-- FILE 3 : INDEX PERFORMANCE & QUERY OPTIMIZATION
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    emp_name VARCHAR(50),
    salary INT

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(1,'Aman',60000),
(2,'Riya',45000),
(3,'Karan',75000),
(4,'Neha',80000),
(5,'Rohit',90000);

-- =========================================================
-- CREATE INDEX
-- =========================================================

CREATE INDEX idx_emp_id
ON employees(emp_id);

-- =========================================================
-- EXPLAIN
-- =========================================================

EXPLAIN
SELECT *
FROM employees
WHERE emp_id = 3;

-- Shows estimated execution plan

-- =========================================================
-- EXPLAIN ANALYZE
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE emp_id = 3;

-- Executes query
-- Shows actual execution statistics

-- =========================================================
-- ANOTHER EXAMPLE
-- =========================================================

EXPLAIN
SELECT *
FROM employees
WHERE salary > 50000;

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 50000;

-- =========================================================
-- CREATE INDEX ON SALARY
-- =========================================================

CREATE INDEX idx_salary
ON employees(salary);

-- =========================================================
-- CHECK AGAIN
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 50000;

-- =========================================================
-- ORDER BY OPTIMIZATION
-- =========================================================

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary;

-- =========================================================
-- INDEX SUPPORTING ORDER BY
-- =========================================================

CREATE INDEX idx_salary_order
ON employees(salary);

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary;

-- =========================================================
-- VIEW INDEXES
-- =========================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- =========================================================
-- PRACTICE QUERIES
-- =========================================================

EXPLAIN
SELECT *
FROM employees
WHERE emp_name = 'Aman';

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE emp_name = 'Aman';

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY emp_name;

-- =========================================================
-- IMPORTANT NOTES
-- =========================================================

-- EXPLAIN
-- Shows estimated execution plan

-- EXPLAIN ANALYZE
-- Executes query and shows actual performance

-- Sequential Scan
-- Reads rows one by one

-- Index Scan
-- Uses index for faster searching

-- Query Planner
-- Chooses cheapest execution plan

-- =========================================================
-- END OF FILE
-- =========================================================