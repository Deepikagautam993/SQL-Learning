-- =========================================================
-- DAY 15 MINI PROJECT
-- DYNAMIC EMPLOYEE MANAGEMENT SYSTEM
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
(3,'Karan',75000);



-- =========================================================
-- 1. DYNAMIC SELECT ALL EMPLOYEES
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees';

    EXECUTE query;

END $$;



-- =========================================================
-- 2. ADD NEW EMPLOYEE DYNAMICALLY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'INSERT INTO employees VALUES (4, ''Neha'', 80000)';

    EXECUTE query;

END $$;



-- =========================================================
-- 3. UPDATE SALARY DYNAMICALLY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'UPDATE employees SET salary = salary + 5000 WHERE emp_id = 1';

    EXECUTE query;

END $$;



-- =========================================================
-- 4. DELETE EMPLOYEE DYNAMICALLY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'DELETE FROM employees WHERE emp_id = 3';

    EXECUTE query;

END $$;



-- =========================================================
-- 5. FILTER EMPLOYEE BY ID (DYNAMIC)
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
-- 6. FILTER BY SALARY (DYNAMIC)
-- =========================================================

DO $$

DECLARE
    sal INT := 60000;
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees WHERE salary >= ' || sal;

    EXECUTE query;

END $$;



-- =========================================================
-- 7. DYNAMIC TABLE NAME EXAMPLE
-- =========================================================

DO $$

DECLARE
    table_name TEXT := 'employees';
    query TEXT;
BEGIN

    query := 'SELECT * FROM ' || table_name;

    EXECUTE query;

END $$;



-- =========================================================
-- FINAL CHECK
-- =========================================================

SELECT * FROM employees;



-- =========================================================
-- PROJECT SUMMARY
-- =========================================================
-- Features Implemented:
-- 1. Dynamic SELECT
-- 2. Dynamic INSERT
-- 3. Dynamic UPDATE
-- 4. Dynamic DELETE
-- 5. Dynamic WHERE clause
-- 6. Dynamic table handling

-- =========================================================
-- REAL WORLD USE CASES
-- =========================================================
-- Admin dashboards
-- ERP systems
-- Reporting tools
-- Search engines
-- Multi-tenant applications

-- =========================================================
-- END OF MINI PROJECT
-- =========================================================