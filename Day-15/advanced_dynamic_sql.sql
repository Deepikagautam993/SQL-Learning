-- =========================================================
-- DAY 15 - ADVANCED DYNAMIC SQL
-- =========================================================

-- =========================================================
-- 1. TABLE NAME DYNAMIC
-- =========================================================

DO $$

DECLARE
    table_name TEXT := 'employees';
    query TEXT;
BEGIN

    -- table name dynamically added
    query := 'SELECT * FROM ' || table_name;

    EXECUTE query;

END $$;



-- =========================================================
-- 2. DYNAMIC WHERE CLAUSE
-- =========================================================

DO $$

DECLARE
    emp_id INT := 2;
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees WHERE emp_id = ' || emp_id;

    EXECUTE query;

END $$;



-- =========================================================
-- 3. DYNAMIC INSERT QUERY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'INSERT INTO employees VALUES (4, ''Neha'', 80000)';

    EXECUTE query;

END $$;



-- =========================================================
-- 4. DYNAMIC UPDATE QUERY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'UPDATE employees SET salary = salary + 5000 WHERE emp_id = 1';

    EXECUTE query;

END $$;



-- =========================================================
-- 5. DYNAMIC DELETE QUERY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'DELETE FROM employees WHERE emp_id = 3';

    EXECUTE query;

END $$;



-- =========================================================
-- 6. STRING CONCATENATION RULE
-- =========================================================
-- PostgreSQL uses || for joining strings

-- Example:
-- 'SELECT * FROM ' || table_name

-- =========================================================
-- REAL WORLD USE CASES
-- =========================================================

-- Admin panels (dynamic filters)
-- Reporting systems
-- Multi-table queries
-- Search engines
-- ORM frameworks

-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- Q1. Why use || in Dynamic SQL?
-- To combine strings at runtime.

-- Q2. What is risk of Dynamic SQL?
-- SQL Injection attacks.

-- Q3. Where is Dynamic SQL used?
-- Admin tools, dashboards, reporting systems.

-- =========================================================
-- END OF FILE 2
-- =========================================================