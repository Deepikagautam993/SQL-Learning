-- =========================================================
-- DAY 13
-- ADVANCED CURSORS
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. Cursor with Multiple Columns
-- 2. Salary Processing
-- 3. Conditional Logic
-- 4. Bonus Calculation
-- 5. Row-by-Row Updates
-- 6. Record Variables
-- 7. Business Logic Processing
-- =========================================================



-- =========================================================
-- CREATE TABLE
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
(3,'Karan','Finance',75000),
(4,'Neha','IT',85000),
(5,'Rohit','HR',50000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- CURSOR WITH RECORD VARIABLE
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT *
    FROM employees;

    emp_record RECORD;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_record;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE
        'Employee: %, Salary: %',

        emp_record.emp_name,
        emp_record.salary;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- BONUS CALCULATION
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_name, salary
    FROM employees;

    emp_record RECORD;

    bonus INT;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_record;

        EXIT WHEN NOT FOUND;

        bonus := emp_record.salary * 10 / 100;

        RAISE NOTICE
        'Employee: %, Bonus: %',

        emp_record.emp_name,
        bonus;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- HIGH SALARY EMPLOYEES
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT *
    FROM employees;

    emp_record RECORD;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_record;

        EXIT WHEN NOT FOUND;

        IF emp_record.salary > 70000 THEN

            RAISE NOTICE
            'High Salary Employee: %',

            emp_record.emp_name;

        END IF;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- UPDATE SALARY USING CURSOR LOGIC
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_id, salary
    FROM employees;

    emp_record RECORD;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_record;

        EXIT WHEN NOT FOUND;

        UPDATE employees

        SET salary = salary + 5000

        WHERE emp_id = emp_record.emp_id;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- DEPARTMENT-WISE PROCESSING
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_name, department
    FROM employees;

    emp_record RECORD;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_record;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE
        'Employee: %, Department: %',

        emp_record.emp_name,
        emp_record.department;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- TOTAL SALARY CALCULATION
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT salary
    FROM employees;

    emp_salary INT;

    total_salary INT := 0;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_salary;

        EXIT WHEN NOT FOUND;

        total_salary := total_salary + emp_salary;

    END LOOP;

    CLOSE emp_cursor;

    RAISE NOTICE
    'Total Salary: %',
    total_salary;

END $$;



-- =========================================================
-- IMPORTANT NOTES
-- =========================================================

-- RECORD:
-- Stores complete row

-- Cursor:
-- Processes one row at a time

-- LOOP:
-- Repeats processing

-- EXIT WHEN NOT FOUND:
-- Stops when rows end



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- What is RECORD?

-- Why use Cursor?

-- How to process multiple columns?

-- How to stop Cursor Loop?

-- What is NOT FOUND?

-- Difference between
-- Cursor and FOR Loop?



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================

-- Payroll Systems

-- Employee Management

-- Banking Software

-- ERP Applications

-- Report Generation

-- Batch Processing

-- Data Migration

-- =========================================================