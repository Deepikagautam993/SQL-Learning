-- =========================================================
-- DAY 14
-- EXCEPTION HANDLING BASICS
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. Exception Handling
-- 2. EXCEPTION Block
-- 3. WHEN Clause
-- 4. division_by_zero
-- 5. unique_violation
-- 6. OTHERS
-- =========================================================



-- =========================================================
-- FIRST EXCEPTION EXAMPLE
-- =========================================================

DO $$

BEGIN

    RAISE NOTICE
    'Program Started';

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Error Occurred';

END $$;



-- =========================================================
-- DIVISION BY ZERO
-- =========================================================

DO $$

DECLARE

    result INT;

BEGIN

    result := 10 / 0;

EXCEPTION

    WHEN division_by_zero THEN

        RAISE NOTICE
        'Cannot divide by zero';

END $$;



-- =========================================================
-- USING OTHERS
-- =========================================================

DO $$

BEGIN

    PERFORM 10 / 0;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Some Error Occurred';

END $$;



-- =========================================================
-- MULTIPLE EXCEPTIONS
-- =========================================================

DO $$

DECLARE

    result INT;

BEGIN

    result := 10 / 0;

EXCEPTION

    WHEN division_by_zero THEN

        RAISE NOTICE
        'Division Error';

    WHEN OTHERS THEN

        RAISE NOTICE
        'Unknown Error';

END $$;



-- =========================================================
-- CREATE STUDENTS TABLE
-- =========================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);



-- =========================================================
-- INSERT DATA
-- =========================================================

INSERT INTO students
VALUES
(1,'Aman');



-- =========================================================
-- UNIQUE VIOLATION
-- =========================================================

DO $$

BEGIN

    INSERT INTO students
    VALUES
    (1,'Riya');

EXCEPTION

    WHEN unique_violation THEN

        RAISE NOTICE
        'Duplicate ID Not Allowed';

END $$;



-- =========================================================
-- CREATE PRODUCTS TABLE
-- =========================================================

CREATE TABLE products (

    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL

);



-- =========================================================
-- NOT NULL VIOLATION
-- =========================================================

DO $$

BEGIN

    INSERT INTO products
    VALUES
    (1,NULL);

EXCEPTION

    WHEN not_null_violation THEN

        RAISE NOTICE
        'NULL Value Not Allowed';

END $$;



-- =========================================================
-- CHECK VIOLATION
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    salary INT CHECK (salary > 0)

);



DO $$

BEGIN

    INSERT INTO employees
    VALUES
    (1,-5000);

EXCEPTION

    WHEN check_violation THEN

        RAISE NOTICE
        'Salary Must Be Greater Than Zero';

END $$;



-- =========================================================
-- FOREIGN KEY EXAMPLE
-- =========================================================

CREATE TABLE departments (

    dept_id INT PRIMARY KEY

);



CREATE TABLE staff (

    emp_id INT,
    dept_id INT REFERENCES departments(dept_id)

);



DO $$

BEGIN

    INSERT INTO staff
    VALUES
    (1,100);

EXCEPTION

    WHEN foreign_key_violation THEN

        RAISE NOTICE
        'Department Does Not Exist';

END $$;



-- =========================================================
-- IMPORTANT NOTES
-- =========================================================

-- EXCEPTION:
-- Error Handling Block

-- WHEN:
-- Handles Specific Error

-- OTHERS:
-- Handles All Remaining Errors

-- division_by_zero:
-- Division Error

-- unique_violation:
-- Duplicate Key Error

-- not_null_violation:
-- NULL Error

-- foreign_key_violation:
-- Foreign Key Error

-- check_violation:
-- CHECK Constraint Error



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- What is Exception Handling?

-- What is EXCEPTION Block?

-- What is OTHERS?

-- What is division_by_zero?

-- What is unique_violation?

-- What is not_null_violation?

-- What is check_violation?

-- What is foreign_key_violation?



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================

-- Banking Systems

-- Payroll Systems

-- ERP Software

-- Inventory Systems

-- Enterprise Applications

-- Financial Applications

-- =========================================================