-- =========================================================
-- DAY 14 MINI PROJECT
-- BANK ACCOUNT MANAGEMENT SYSTEM
-- USING EXCEPTION HANDLING
-- =========================================================

-- =========================================================
-- PROJECT OBJECTIVE
-- =========================================================
--
-- Build a banking system that:
-- 1. Creates accounts
-- 2. Handles duplicate accounts
-- 3. Validates deposits
-- 4. Validates withdrawals
-- 5. Prevents invalid transactions
-- 6. Uses Exception Handling
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE bank_accounts (

    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50) NOT NULL,
    balance NUMERIC CHECK (balance >= 0)

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO bank_accounts
VALUES
(1,'Aman',50000),
(2,'Riya',30000),
(3,'Karan',45000);



-- =========================================================
-- VIEW DATA
-- =========================================================

SELECT *
FROM bank_accounts;



-- =========================================================
-- PROJECT 1
-- HANDLE DUPLICATE ACCOUNT
-- =========================================================

DO $$

BEGIN

    INSERT INTO bank_accounts
    VALUES
    (1,'Neha',25000);

EXCEPTION

    WHEN unique_violation THEN

        RAISE NOTICE
        'Duplicate Account ID Not Allowed';

END $$;



-- =========================================================
-- PROJECT 2
-- VALIDATE NEGATIVE DEPOSIT
-- =========================================================

DO $$

DECLARE

    deposit_amount NUMERIC := -500;

BEGIN

    IF deposit_amount <= 0 THEN

        RAISE EXCEPTION
        'Deposit Amount Must Be Greater Than Zero';

    END IF;

EXCEPTION

    WHEN OTHERS THEN

        RAISE NOTICE
        '%',
        SQLERRM;

END $$;



-- =========================================================
-- PROJECT 3
-- VALIDATE WITHDRAWAL
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
-- PROJECT 4
-- VALIDATE ACCOUNT HOLDER
-- =========================================================

DO $$

BEGIN

    INSERT INTO bank_accounts
    VALUES
    (4,NULL,10000);

EXCEPTION

    WHEN not_null_violation THEN

        RAISE NOTICE
        'Account Holder Name Required';

END $$;



-- =========================================================
-- PROJECT 5
-- CHECK BALANCE VALIDATION
-- =========================================================

DO $$

BEGIN

    INSERT INTO bank_accounts
    VALUES
    (5,'Rohit',-5000);

EXCEPTION

    WHEN check_violation THEN

        RAISE NOTICE
        'Balance Cannot Be Negative';

END $$;



-- =========================================================
-- PROJECT 6
-- DIVISION BY ZERO DEMO
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
-- PROJECT 7
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
-- PROJECT 8
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
-- PROJECT 9
-- NESTED EXCEPTION BLOCK
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
    'Program Continued Successfully';

END $$;



-- =========================================================
-- FINAL REPORT
-- =========================================================

SELECT *
FROM bank_accounts;



-- =========================================================
-- PROJECT FEATURES
-- =========================================================
--
-- Duplicate Account Protection
-- Deposit Validation
-- Withdrawal Validation
-- Custom Exceptions
-- SQLERRM Usage
-- SQLSTATE Usage
-- Nested Exception Handling
-- Banking Error Management
--
-- =========================================================



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================
--
-- Q1. What is Exception Handling?
--
-- Q2. What is SQLERRM?
--
-- Q3. What is SQLSTATE?
--
-- Q4. What is OTHERS?
--
-- Q5. What is Custom Exception?
--
-- Q6. What is Nested Exception Handling?
--
-- Q7. What is unique_violation?
--
-- Q8. What is check_violation?
--
-- =========================================================



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================
--
-- Banking Systems
-- ATM Software
-- ERP Systems
-- Payroll Applications
-- Financial Software
-- Inventory Management
-- Enterprise Applications
--
-- =========================================================



-- =========================================================
-- PROJECT CONCLUSION
-- =========================================================
--
-- Skills Learned:
--
-- Exception Handling
-- Error Management
-- Custom Exceptions
-- SQLERRM
-- SQLSTATE
-- Nested Exceptions
-- Safe Database Programming
--
-- =========================================================