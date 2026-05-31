-- =========================================================
-- DAY 13 MINI PROJECT
-- EMPLOYEE BONUS PROCESSING SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OBJECTIVE
-- =========================================================
--
-- Build a system that:
-- 1. Processes employees row by row
-- 2. Calculates bonus using cursor
-- 3. Identifies high salary employees
-- 4. Counts employees
-- 5. Calculates total salary
-- 6. Generates employee reports
--
-- =========================================================



-- =========================================================
-- CREATE EMPLOYEES TABLE
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
-- VIEW DATA
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- PROJECT 1
-- EMPLOYEE REPORT
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
        'ID: %, Name: %, Department: %, Salary: %',

        emp_record.emp_id,
        emp_record.emp_name,
        emp_record.department,
        emp_record.salary;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- PROJECT 2
-- BONUS CALCULATION
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR
    SELECT emp_name, salary
    FROM employees;

    emp_record RECORD;

    bonus NUMERIC;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_record;

        EXIT WHEN NOT FOUND;

        bonus := emp_record.salary * 0.10;

        RAISE NOTICE
        'Employee: %, Bonus: %',

        emp_record.emp_name,
        bonus;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- PROJECT 3
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
-- PROJECT 4
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
-- PROJECT 5
-- EMPLOYEE COUNT
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR
    SELECT emp_id
    FROM employees;

    employee_id INT;

    total_count INT := 0;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO employee_id;

        EXIT WHEN NOT FOUND;

        total_count := total_count + 1;

    END LOOP;

    CLOSE emp_cursor;

    RAISE NOTICE
    'Total Employees: %',
    total_count;

END $$;



-- =========================================================
-- PROJECT 6
-- SALARY INCREMENT
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

        UPDATE employees

        SET salary = salary + 5000

        WHERE emp_id = employee_id;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- FINAL REPORT
-- =========================================================

SELECT
    emp_id,
    emp_name,
    department,
    salary
FROM employees;



-- =========================================================
-- PROJECT FEATURES
-- =========================================================
--
-- Row-by-Row Processing
-- Bonus Calculation
-- Employee Reporting
-- Salary Increment
-- Total Salary Calculation
-- Employee Counting
--
-- =========================================================



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================
--
-- Q1. What is Cursor?
--
-- Q2. Why use Cursor?
--
-- Q3. What is FETCH?
--
-- Q4. What is RECORD?
--
-- Q5. What is NOT FOUND?
--
-- Q6. Cursor Workflow?
--
-- DECLARE
-- OPEN
-- FETCH
-- PROCESS
-- CLOSE
--
-- =========================================================



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================
--
-- Banking Systems
-- Payroll Systems
-- ERP Software
-- Data Migration
-- Reporting Systems
-- Enterprise Applications
--
-- =========================================================



-- =========================================================
-- PROJECT CONCLUSION
-- =========================================================
--
-- Skills Learned:
--
-- Cursor Programming
-- Row Processing
-- Record Variables
-- Loop Handling
-- Report Generation
-- Business Logic Processing
--
-- =========================================================