-- =========================================================
-- DAY 16
-- FILE 1 : INDEX BASICS
-- =========================================================

-- =========================================================
-- CREATE SAMPLE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(1,'Aman','IT',60000),
(2,'Riya','HR',45000),
(3,'Karan','IT',75000),
(4,'Neha','Finance',80000),
(5,'Rohit','IT',90000);

-- =========================================================
-- SIMPLE SEARCH QUERY
-- =========================================================

SELECT *
FROM employees
WHERE emp_id = 3;

-- =========================================================
-- CREATE INDEX
-- =========================================================

CREATE INDEX idx_emp_id
ON employees(emp_id);

-- =========================================================
-- SEARCH QUERY AFTER INDEX
-- =========================================================

SELECT *
FROM employees
WHERE emp_id = 3;

-- =========================================================
-- CREATE INDEX ON EMPLOYEE NAME
-- =========================================================

CREATE INDEX idx_emp_name
ON employees(emp_name);

-- =========================================================
-- SEARCH USING NAME
-- =========================================================

SELECT *
FROM employees
WHERE emp_name = 'Aman';

-- =========================================================
-- CREATE INDEX ON DEPARTMENT
-- =========================================================

CREATE INDEX idx_department
ON employees(department);

-- =========================================================
-- SEARCH USING DEPARTMENT
-- =========================================================

SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================================
-- VIEW ALL INDEXES OF A TABLE
-- =========================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- =========================================================
-- DROP INDEX
-- =========================================================

DROP INDEX idx_department;

-- =========================================================
-- VERIFY REMAINING INDEXES
-- =========================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- =========================================================
-- PRACTICE QUERIES
-- =========================================================

SELECT *
FROM employees
WHERE salary > 50000;

SELECT *
FROM employees
WHERE emp_name = 'Neha';

SELECT *
FROM employees
WHERE department = 'Finance';

-- =========================================================
-- END OF FILE
-- =========================================================