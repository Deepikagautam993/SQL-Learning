-- =========================================================
-- DAY 14
-- ADVANCED EXCEPTION HANDLING
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. Nested Exception Handling
-- 2. SQLERRM
-- 3. SQLSTATE
-- 4. Custom Exceptions
-- 5. RAISE EXCEPTION
-- 6. User Defined Errors
-- 7. Transaction Safety
-- =========================================================



-- =========================================================
-- CREATE SAMPLE TABLE
-- =========================================================

CREATE TABLE bank_accounts (

    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance NUMERIC

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO bank_accounts
VALUES
(1,'Aman',50000),
(2,'Riya',30000);



-- =========================================================
-- VIEW DATA
-- =========================================================

SELECT *
FROM bank_accounts;



-- =========================================================
-- SQLERRM EXAMPLE
-- =========================================================

DO $$

DECLARE

    result INT;

BEGIN

    result := 10 / 0;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Error Message: %',
        SQLERRM;

END $$;



-- =========================================================
-- SQLSTATE EXAMPLE
-- =========================================================

DO $$

DECLARE

    result INT;

BEGIN

    result := 10 / 0;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Error Code: %',
        SQLSTATE;

END $$;



-- =========================================================
-- CUSTOM EXCEPTION
-- =========================================================

DO $$

DECLARE

    salary INT := -5000;

BEGIN

    IF salary < 0 THEN

        RAISE EXCEPTION
        'Salary Cannot Be Negative';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Custom Error: %',
        SQLERRM;

END $$;



-- =========================================================
-- BANK WITHDRAWAL EXAMPLE
-- =========================================================

DO $$

DECLARE

    current_balance NUMERIC;

    withdraw_amount NUMERIC := 60000;

BEGIN

    SELECT balance
    INTO current_balance
    FROM bank_accounts
    WHERE account_id = 1;

    IF withdraw_amount > current_balance THEN

        RAISE EXCEPTION
        'Insufficient Balance';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        'Transaction Failed: %',
        SQLERRM;

END $$;



-- =========================================================
-- NESTED BLOCK EXAMPLE
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
-- DUPLICATE ACCOUNT EXAMPLE
-- =========================================================

DO $$

BEGIN

    INSERT INTO bank_accounts
    VALUES
    (1,'Rohit',20000);

EXCEPTION

    WHEN unique_violation THEN

        RAISE NOTICE
        'Duplicate Account ID';

END $$;



-- =========================================================
-- USER VALIDATION EXAMPLE
-- =========================================================

DO $$

DECLARE

    age INT := 15;

BEGIN

    IF age < 18 THEN

        RAISE EXCEPTION
        'User Must Be 18 Or Older';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        '%',
        SQLERRM;

END $$;



-- =========================================================
-- PRODUCT PRICE VALIDATION
-- =========================================================

DO $$

DECLARE

    price NUMERIC := -100;

BEGIN

    IF price <= 0 THEN

        RAISE EXCEPTION
        'Invalid Product Price';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        '%',
        SQLERRM;

END $$;



-- =========================================================
-- IMPORTANT NOTES
-- =========================================================

-- SQLERRM:
-- Error Message

-- SQLSTATE:
-- Error Code

-- RAISE EXCEPTION:
-- Generates Custom Error

-- Nested Exception:
-- Exception Inside Exception Block

-- OTHERS:
-- Handles Unhandled Errors



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- What is SQLERRM?

-- What is SQLSTATE?

-- What is RAISE EXCEPTION?

-- What is Custom Exception?

-- What is Nested Exception Handling?

-- Why use Exception Handling?



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