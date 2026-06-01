-- =========================================================
-- DAY 14
-- EXCEPTION HANDLING PRACTICE QUESTIONS
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT CHECK (age > 0)

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO students
VALUES
(1,'Aman',20),
(2,'Riya',21);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM students;



-- =========================================================
-- Q1. HANDLE DIVISION BY ZERO
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
-- Q2. HANDLE DUPLICATE PRIMARY KEY
-- =========================================================

DO $$

BEGIN

    INSERT INTO students
    VALUES
    (1,'Karan',22);

EXCEPTION

    WHEN unique_violation THEN

        RAISE NOTICE
        'Duplicate Student ID';

END $$;



-- =========================================================
-- Q3. HANDLE CHECK VIOLATION
-- =========================================================

DO $$

BEGIN

    INSERT INTO students
    VALUES
    (3,'Neha',-5);

EXCEPTION

    WHEN check_violation THEN

        RAISE NOTICE
        'Age Must Be Greater Than Zero';

END $$;



-- =========================================================
-- Q4. HANDLE NOT NULL VIOLATION
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
-- Q5. USE OTHERS
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
-- Q6. DISPLAY SQLERRM
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
-- Q7. DISPLAY SQLSTATE
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
-- Q8. CUSTOM EXCEPTION
-- =========================================================

DO $$

DECLARE

    marks INT := -10;

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
-- Q9. AGE VALIDATION
-- =========================================================

DO $$

DECLARE

    age INT := 15;

BEGIN

    IF age < 18 THEN

        RAISE EXCEPTION
        'Age Must Be 18 Or Older';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        '%',
        SQLERRM;

END $$;



-- =========================================================
-- Q10. NESTED EXCEPTION BLOCK
-- =========================================================

DO $$

BEGIN

    BEGIN

        PERFORM 10 / 0;

    EXCEPTION

        WHEN division_by_zero THEN

            RAISE NOTICE
            'Inner Block Handled Error';

    END;

    RAISE NOTICE
    'Program Continued';

END $$;



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- 1. What is Exception Handling?

-- 2. What is SQLERRM?

-- 3. What is SQLSTATE?

-- 4. What is OTHERS?

-- 5. What is RAISE EXCEPTION?

-- 6. What is Custom Exception?

-- 7. What is Nested Exception?

-- 8. What is division_by_zero?

-- 9. What is unique_violation?

-- 10. Why use Exception Handling?



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================

-- Banking Systems

-- ATM Transactions

-- Payroll Systems

-- ERP Software

-- E-Commerce Systems

-- Financial Applications

-- Enterprise Applications

-- =========================================================