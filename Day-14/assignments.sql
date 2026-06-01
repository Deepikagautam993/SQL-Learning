-- =========================================================
-- DAY 14
-- ASSIGNMENTS WITH SOLUTIONS
-- EXCEPTION HANDLING IN POSTGRESQL
-- =========================================================

-- =========================================================
-- ASSIGNMENT 1
-- HANDLE DIVISION BY ZERO
-- =========================================================

DO $$

DECLARE

    result INT;

BEGIN

    result := 100 / 0;

EXCEPTION

    WHEN division_by_zero THEN

        RAISE NOTICE
        'Division By Zero Error Handled';

END $$;



-- =========================================================
-- ASSIGNMENT 2
-- HANDLE DUPLICATE PRIMARY KEY
-- =========================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);



INSERT INTO students
VALUES
(1,'Aman');



DO $$

BEGIN

    INSERT INTO students
    VALUES
    (1,'Riya');

EXCEPTION

    WHEN unique_violation THEN

        RAISE NOTICE
        'Duplicate Student ID';

END $$;



-- =========================================================
-- ASSIGNMENT 3
-- HANDLE NOT NULL VIOLATION
-- =========================================================

CREATE TABLE products (

    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL

);



DO $$

BEGIN

    INSERT INTO products
    VALUES
    (1,NULL);

EXCEPTION

    WHEN not_null_violation THEN

        RAISE NOTICE
        'Product Name Cannot Be NULL';

END $$;



-- =========================================================
-- ASSIGNMENT 4
-- HANDLE CHECK VIOLATION
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    salary INT CHECK (salary > 0)

);



DO $$

BEGIN

    INSERT INTO employees
    VALUES
    (1,-1000);

EXCEPTION

    WHEN check_violation THEN

        RAISE NOTICE
        'Salary Must Be Positive';

END $$;



-- =========================================================
-- ASSIGNMENT 5
-- USE OTHERS
-- =========================================================

DO $$

BEGIN

    PERFORM 10 / 0;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Unknown Error Handled';

END $$;



-- =========================================================
-- ASSIGNMENT 6
-- DISPLAY SQLERRM
-- =========================================================

DO $$

BEGIN

    PERFORM 10 / 0;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Error Message: %',
        SQLERRM;

END $$;



-- =========================================================
-- ASSIGNMENT 7
-- DISPLAY SQLSTATE
-- =========================================================

DO $$

BEGIN

    PERFORM 10 / 0;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Error Code: %',
        SQLSTATE;

END $$;



-- =========================================================
-- ASSIGNMENT 8
-- CUSTOM EXCEPTION
-- =========================================================

DO $$

DECLARE

    marks INT := -20;

BEGIN

    IF marks < 0 THEN

        RAISE EXCEPTION
        'Marks Cannot Be Negative';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        '%',
        SQLERRM;

END $$;



-- =========================================================
-- ASSIGNMENT 9
-- AGE VALIDATION
-- =========================================================

DO $$

DECLARE

    age INT := 16;

BEGIN

    IF age < 18 THEN

        RAISE EXCEPTION
        'Age Must Be 18 Or Above';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        '%',
        SQLERRM;

END $$;



-- =========================================================
-- ASSIGNMENT 10
-- NESTED EXCEPTION BLOCK
-- =========================================================

DO $$

BEGIN

    BEGIN

        PERFORM 10 / 0;

    EXCEPTION

        WHEN division_by_zero THEN

            RAISE NOTICE
            'Inner Block Handled Division Error';

    END;

    RAISE NOTICE
    'Program Continued Successfully';

END $$;



-- =========================================================
-- THEORY QUESTIONS WITH ANSWERS
-- =========================================================

-- Q1. What is Exception Handling?
-- A mechanism used to catch and handle runtime errors.

-- Q2. What is EXCEPTION Block?
-- A block that handles errors.

-- Q3. What is division_by_zero?
-- Error raised when dividing by zero.

-- Q4. What is unique_violation?
-- Error raised for duplicate keys.

-- Q5. What is not_null_violation?
-- Error raised when NULL is inserted into NOT NULL column.

-- Q6. What is check_violation?
-- Error raised when CHECK condition fails.

-- Q7. What is SQLERRM?
-- Returns the error message.

-- Q8. What is SQLSTATE?
-- Returns the error code.

-- Q9. What is OTHERS?
-- Handles all unhandled exceptions.

-- Q10. What is RAISE EXCEPTION?
-- Used to create custom exceptions.



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================

-- Banking Systems
-- ATM Software
-- Payroll Systems
-- ERP Applications
-- Financial Systems
-- Inventory Management
-- E-Commerce Applications

-- =========================================================