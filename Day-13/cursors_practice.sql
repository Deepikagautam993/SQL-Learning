-- =========================================================
-- DAY 13
-- CURSORS PRACTICE QUESTIONS
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
-- Q1. CREATE A CURSOR TO DISPLAY
-- ALL EMPLOYEE NAMES
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
-- Q2. DISPLAY ALL SALARIES
-- USING CURSOR
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
-- Q3. DISPLAY EMPLOYEE ID
-- AND NAME
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR

    SELECT emp_id, emp_name
    FROM employees;

    emp_record RECORD;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO emp_record;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE
        'ID: %, Name: %',

        emp_record.emp_id,
        emp_record.emp_name;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- Q4. DISPLAY ONLY HIGH SALARY
-- EMPLOYEES (>70000)
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
-- Q5. CALCULATE BONUS (10%)
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
-- Q6. DISPLAY EMPLOYEE NAME
-- AND DEPARTMENT
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
-- Q7. CALCULATE TOTAL SALARY
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
-- Q8. UPDATE SALARY BY 5000
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
-- Q9. COUNT EMPLOYEES
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
    'Employee Count: %',
    total_count;

END $$;



-- =========================================================
-- Q10. DISPLAY COMPLETE RECORD
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
        'ID: %, Name: %, Dept: %, Salary: %',

        emp_record.emp_id,
        emp_record.emp_name,
        emp_record.department,
        emp_record.salary;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- 1. What is Cursor?

-- 2. Why use Cursor?

-- 3. What is FETCH?

-- 4. What is OPEN?

-- 5. What is CLOSE?

-- 6. What is NOT FOUND?

-- 7. What is RECORD?

-- 8. Cursor Workflow?

-- 9. Cursor vs Normal Query?

-- 10. Real-world use of Cursor?



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================

-- Banking Systems
-- Payroll Systems
-- ERP Software
-- Reporting Systems
-- Data Migration
-- Batch Processing
-- Enterprise Applications

-- =========================================================