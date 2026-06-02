-- =========================================================
-- DAY 15 - DYNAMIC SQL (BASICS - DETAILED)
-- =========================================================

-- =========================================================
-- 1. SIMPLE DYNAMIC SQL
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    -- Query stored as string
    query := 'SELECT 1';

    -- Execution at runtime
    EXECUTE query;

END $$;



-- =========================================================
-- 2. CURRENT DATE USING DYNAMIC SQL
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT current_date';

    EXECUTE query;

END $$;



-- =========================================================
-- 3. CREATE SAMPLE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    emp_name VARCHAR(50),
    salary INT

);



-- =========================================================
-- 4. INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(1,'Aman',60000),
(2,'Riya',45000),
(3,'Karan',75000);



-- =========================================================
-- 5. STATIC SELECT (FOR COMPARISON)
-- =========================================================

-- Normal SQL (fixed query)
SELECT * FROM employees;



-- =========================================================
-- 6. DYNAMIC SELECT QUERY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees';

    EXECUTE query;

END $$;



-- =========================================================
-- 7. WHY THIS WORKS
-- =========================================================
-- EXECUTE takes a TEXT string
-- and runs it as SQL query at runtime

-- =========================================================
-- IMPORTANT NOTES
-- =========================================================

-- TEXT variable = stores SQL query
-- EXECUTE = runs dynamic SQL
-- Useful when structure is not fixed

-- =========================================================
-- REAL WORLD USE CASES
-- =========================================================

-- Admin dashboards
-- Reporting systems
-- Dynamic filters
-- ORM tools
-- Data migration scripts

-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- Q1. What is Dynamic SQL?
-- SQL that is created and executed at runtime.

-- Q2. Why use Dynamic SQL?
-- For flexible and dynamic query execution.

-- Q3. What is EXECUTE?
-- Used to run dynamically generated SQL.

-- Q4. Risk of Dynamic SQL?
-- SQL Injection if not handled properly.

-- =========================================================
-- END OF FILE 1
-- =========================================================