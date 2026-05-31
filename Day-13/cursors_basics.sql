-- =========================================================
-- DAY 13
-- CURSORS BASICS
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. Cursor
-- 2. DECLARE
-- 3. OPEN
-- 4. FETCH
-- 5. CLOSE
-- 6. LOOP
-- 7. NOT FOUND
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
(4,'Neha',85000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- FIRST CURSOR EXAMPLE
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_name
    FROM employees;

    employee_name VARCHAR(50);

BEGIN

    OPEN emp_cursor;

    FETCH emp_cursor
    INTO employee_name;

    RAISE NOTICE
    'Employee: %',
    employee_name;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- FETCH MULTIPLE ROWS
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_name
    FROM employees;

    employee_name VARCHAR(50);

BEGIN

    OPEN emp_cursor;

    FETCH emp_cursor INTO employee_name;
    RAISE NOTICE '%', employee_name;

    FETCH emp_cursor INTO employee_name;
    RAISE NOTICE '%', employee_name;

    FETCH emp_cursor INTO employee_name;
    RAISE NOTICE '%', employee_name;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- CURSOR WITH LOOP
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_name
    FROM employees;

    employee_name VARCHAR(50);

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO employee_name;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE
        '%',
        employee_name;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- CURSOR FOR SALARYS
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT salary
    FROM employees;

    emp_salary INT;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_salary;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE
        'Salary: %',
        emp_salary;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- CURSOR FOR EMPLOYEE IDS
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_id
    FROM employees;

    employee_id INT;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO employee_id;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE
        'ID: %',
        employee_id;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- IMPORTANT NOTES
-- =========================================================

-- DECLARE:
-- Creates Cursor

-- OPEN:
-- Opens Cursor

-- FETCH:
-- Reads Next Row

-- CLOSE:
-- Closes Cursor

-- NOT FOUND:
-- No More Rows



-- =========================================================
-- CURSOR WORKFLOW
-- =========================================================

-- DECLARE
-- OPEN
-- FETCH
-- PROCESS
-- CLOSE



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- What is Cursor?

-- Why use Cursor?

-- What is FETCH?

-- What is OPEN?

-- What is CLOSE?

-- What is NOT FOUND?

-- Cursor vs Normal Query?



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================

-- Banking Systems

-- Payroll Systems

-- ERP Software

-- Reporting Systems

-- Data Migration

-- Batch Processing

-- Enterprise Applications

-- =========================================================