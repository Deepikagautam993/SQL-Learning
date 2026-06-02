-- =========================================================
-- DAY 15 - DYNAMIC SQL ASSIGNMENTS (WITH SOLUTIONS)
-- =========================================================

-- =========================================================
-- CREATE SAMPLE TABLE
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
-- ASSIGNMENT 1: DYNAMIC SELECT ALL RECORDS
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees';

    EXECUTE query;

END $$;



-- =========================================================
-- ASSIGNMENT 2: SELECT CURRENT DATE DYNAMICALLY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT current_date';

    EXECUTE query;

END $$;



-- =========================================================
-- ASSIGNMENT 3: INSERT NEW EMPLOYEE
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'INSERT INTO employees VALUES (4, ''Neha'', 80000)';

    EXECUTE query;

END $$;



-- =========================================================
-- ASSIGNMENT 4: UPDATE SALARY
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'UPDATE employees SET salary = salary + 5000 WHERE emp_id = 1';

    EXECUTE query;

END $$;



-- =========================================================
-- ASSIGNMENT 5: DELETE EMPLOYEE
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'DELETE FROM employees WHERE emp_id = 3';

    EXECUTE query;

END $$;



-- =========================================================
-- ASSIGNMENT 6: FILTER BY EMP_ID
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
-- ASSIGNMENT 7: FILTER BY SALARY
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
-- ASSIGNMENT 8: DYNAMIC TABLE SELECT
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
-- THEORY QUESTIONS (IMPORTANT)
-- =========================================================

-- Q1. What is Dynamic SQL?
-- SQL queries created and executed at runtime.

-- Q2. What is EXECUTE?
-- Used to run dynamic SQL query.

-- Q3. Why use Dynamic SQL?
-- For flexible and runtime-based queries.

-- Q4. Risk of Dynamic SQL?
-- SQL Injection.

-- Q5. What is || operator?
-- Used for string concatenation.

-- =========================================================
-- END OF ASSIGNMENTS FILE
-- =========================================================