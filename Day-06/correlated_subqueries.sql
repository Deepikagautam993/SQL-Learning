-- =========================================================
-- DAY 06 - CORRELATED SUBQUERIES
-- =========================================================

-- =========================================================
-- TOPIC OVERVIEW
-- =========================================================
-- Correlated subqueries depend on outer query values.
--
-- IMPORTANT UNDERSTANDING:
-- Normal subquery executes once.
--
-- Correlated subquery executes repeatedly
-- for every outer query row.
--
-- These are heavily used in:
-- - KPI analysis
-- - department analytics
-- - performance reporting
-- - advanced SQL interviews
-- =========================================================



-- =========================================================
-- INSERT ADDITIONAL DATA
-- =========================================================

INSERT INTO employees
VALUES
(106, 'Kunal', 'IT', 60000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- FIND EMPLOYEES EARNING ABOVE DEPARTMENT AVERAGE
-- =========================================================
-- Correlation condition:
-- e1.department = e2.department
--
-- Inner query:
-- Calculates department average salary.
--
-- Outer query:
-- Compares employee salary with department average.
--
-- Business Use Case:
-- Performance analytics.
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);



-- =========================================================
-- FIND HIGHEST SALARY EMPLOYEE IN EACH DEPARTMENT
-- =========================================================
-- Inner query:
-- Finds maximum department salary.
--
-- Outer query:
-- Finds matching employee.
--
-- Business Use Case:
-- Top performer analysis.
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);



-- =========================================================
-- FIND LOWEST SALARY EMPLOYEE IN EACH DEPARTMENT
-- =========================================================
-- Used for department salary benchmarking.
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MIN(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);



-- =========================================================
-- EXISTS WITH CORRELATED SUBQUERY
-- =========================================================
-- EXISTS checks whether matching rows exist.
--
-- Business Use Case:
-- Department validation analysis.
-- =========================================================

SELECT DISTINCT department
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e1.department = e2.department
      AND e2.salary > 80000
);



-- =========================================================
-- FIND EMPLOYEES EARNING MORE THAN
-- THEIR DEPARTMENT MINIMUM SALARY
-- =========================================================
-- Advanced comparison example.
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary > (
    SELECT MIN(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);



-- =========================================================
-- PERFORMANCE UNDERSTANDING
-- =========================================================
-- Correlated subqueries can be slower because:
--
-- 1. Inner query executes repeatedly
-- 2. Outer rows increase execution time
--
-- In large datasets:
-- JOINs are often preferred.
-- =========================================================



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Correlated subqueries:
--
-- 1. Depend on outer query
-- 2. Execute repeatedly
-- 3. Use correlation conditions
-- 4. Help perform department-level analysis
-- 5. Used heavily in KPI systems
--
-- Skills Developed:
-- - advanced analytical thinking
-- - department analysis
-- - KPI filtering
-- - performance reporting
-- =========================================================