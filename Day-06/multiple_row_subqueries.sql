-- =========================================================
-- DAY 06 - MULTIPLE ROW SUBQUERIES
-- =========================================================

-- =========================================================
-- TOPIC OVERVIEW
-- =========================================================
-- Multiple-row subqueries return more than one value.
--
-- IMPORTANT RULE:
-- = operator cannot handle multiple rows.
--
-- Therefore we use:
-- - IN
-- - NOT IN
-- - ANY
-- - ALL
-- - EXISTS
--
-- These are heavily used in:
-- - advanced filtering
-- - customer segmentation
-- - KPI dashboards
-- - reporting systems
-- =========================================================



-- =========================================================
-- FIND EMPLOYEES WORKING IN HIGH SALARY DEPARTMENTS
-- =========================================================
-- Inner query:
-- Finds departments where salary > 60000.
--
-- Outer query:
-- Returns employees working in those departments.
--
-- IMPORTANT UNDERSTANDING:
-- IN checks multiple values.
-- =========================================================

SELECT emp_name, department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 60000
);



-- =========================================================
-- FIND EMPLOYEES NOT IN AI DEPARTMENT
-- =========================================================
-- NOT IN excludes matching values.
--
-- Business Use Case:
-- Department exclusion analysis.
-- =========================================================

SELECT emp_name, department
FROM employees
WHERE department NOT IN (
    SELECT department
    FROM employees
    WHERE department = 'AI'
);



-- =========================================================
-- ANY OPERATOR EXAMPLE
-- =========================================================
-- ANY means:
-- condition must match at least one value.
--
-- Inner query:
-- Returns HR department salaries.
--
-- Outer query:
-- Returns employees earning more than
-- at least one HR employee.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);



-- =========================================================
-- ALL OPERATOR EXAMPLE
-- =========================================================
-- ALL means:
-- condition must satisfy all values.
--
-- Business Use Case:
-- Advanced comparison analysis.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);



-- =========================================================
-- EXISTS OPERATOR EXAMPLE
-- =========================================================
-- EXISTS checks whether rows exist.
--
-- IMPORTANT:
-- EXISTS checks row existence,
-- not returned values.
--
-- Business Use Case:
-- Validation logic.
-- =========================================================

SELECT emp_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees
    WHERE department = 'AI'
);



-- =========================================================
-- FIND EMPLOYEES WORKING IN AI OR IT
-- =========================================================
-- Multiple-row filtering using IN.
--
-- Business Use Case:
-- Employee segmentation.
-- =========================================================

SELECT emp_name, department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE department IN ('AI', 'IT')
);



-- =========================================================
-- FIND EMPLOYEES EARNING LESS THAN ALL AI EMPLOYEES
-- =========================================================
-- ALL compares with every returned value.
--
-- Advanced analytical filtering example.
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary < ALL (
    SELECT salary
    FROM employees
    WHERE department = 'AI'
);



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Multiple-row subqueries:
--
-- 1. Return multiple values
-- 2. Require IN, ANY, ALL, EXISTS
-- 3. Help create advanced filtering
-- 4. Used in analytics systems
-- 5. Common in interview questions
--
-- Skills Developed:
-- - advanced filtering
-- - segmentation logic
-- - comparison analysis
-- - analytical query building
-- =========================================================