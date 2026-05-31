-- =========================================================
-- DAY 13 ASSIGNMENTS WITH SOLUTIONS
-- CURSORS IN POSTGRESQL
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
-- ASSIGNMENT 1
-- DISPLAY ALL EMPLOYEE NAMES
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
        'Employee: %',
        employee_name;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- ASSIGNMENT 2
-- DISPLAY EMPLOYEE NAME
-- AND SALARY
-- =========================================================

DO $$

DECLARE

    emp_cursor CURSOR FOR
    SELECT emp_name, salary
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
-- ASSIGNMENT 3
-- DISPLAY HIGH SALARY EMPLOYEES
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
-- ASSIGNMENT 4
-- CALCULATE BONUS
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
-- ASSIGNMENT 5
-- CALCULATE TOTAL SALARY
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
-- ASSIGNMENT 6
-- COUNT EMPLOYEES
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
-- ASSIGNMENT 7
-- UPDATE SALARY
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
-- ASSIGNMENT 8
-- DISPLAY DEPARTMENT DETAILS
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
-- ASSIGNMENT 9
-- DISPLAY COMPLETE RECORD
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
-- ASSIGNMENT 10
-- DISPLAY EMPLOYEES
-- WITH SALARY > 50000
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

        IF emp_record.salary > 50000 THEN

            RAISE NOTICE
            'Employee: %, Salary: %',

            emp_record.emp_name,
            emp_record.salary;

        END IF;

    END LOOP;

    CLOSE emp_cursor;

END $$;



-- =========================================================
-- THEORY QUESTIONS WITH ANSWERS
-- =========================================================

-- Q1. What is Cursor?
-- Cursor is a pointer to rows returned by a query.

-- Q2. Why use Cursor?
-- For row-by-row processing.

-- Q3. What is FETCH?
-- Retrieves next row from cursor.

-- Q4. What is OPEN?
-- Opens cursor for processing.

-- Q5. What is CLOSE?
-- Releases cursor resources.

-- Q6. What is NOT FOUND?
-- Indicates no more rows exist.

-- Q7. What is RECORD?
-- Variable that stores a complete row.

-- Q8. Cursor Workflow?
-- DECLARE → OPEN → FETCH → PROCESS → CLOSE

-- Q9. Cursor vs Normal Query?
-- Cursor processes one row at a time.

-- Q10. Real-world use?
-- Banking, Payroll, ERP, Reporting.

-- =========================================================
-- END OF FILE
-- =========================================================