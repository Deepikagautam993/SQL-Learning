-- =========================================================
-- DAY 11
-- STORED PROCEDURES & FUNCTIONS
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. Stored Procedures
-- 2. CREATE PROCEDURE
-- 3. CALL Statement
-- 4. Functions
-- 5. CREATE FUNCTION
-- 6. RETURN Statement
-- 7. Parameter Functions
-- 8. Procedure vs Function
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
(1, 'Aman', 60000),
(2, 'Riya', 45000),
(3, 'Karan', 75000),
(4, 'Simran', 50000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- CREATE FIRST PROCEDURE
-- =========================================================
-- Procedure = saved SQL program
-- =========================================================

CREATE OR REPLACE PROCEDURE show_message()

LANGUAGE plpgsql

AS $$

BEGIN

    RAISE NOTICE 'Stored Procedure Executed';

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL show_message();



-- =========================================================
-- PROCEDURE WITH INSERT
-- =========================================================

CREATE OR REPLACE PROCEDURE add_employee(

    p_id INT,
    p_name VARCHAR,
    p_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employees
    VALUES (p_id, p_name, p_salary);

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL add_employee(5, 'Neha', 85000);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- PROCEDURE WITH UPDATE
-- =========================================================

CREATE OR REPLACE PROCEDURE update_salary(

    p_id INT,
    new_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET salary = new_salary

    WHERE emp_id = p_id;

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL update_salary(2, 55000);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- CREATE FIRST FUNCTION
-- =========================================================
-- Function returns value
-- =========================================================

CREATE OR REPLACE FUNCTION total_employees()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT COUNT(*)
        FROM employees

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT total_employees();



-- =========================================================
-- FUNCTION WITH PARAMETERS
-- =========================================================

CREATE OR REPLACE FUNCTION employee_bonus(

    salary INT

)

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN salary + 5000;

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT employee_bonus(60000);



-- =========================================================
-- FUNCTION WITH QUERY
-- =========================================================

CREATE OR REPLACE FUNCTION highest_salary()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT MAX(salary)
        FROM employees

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT highest_salary();



-- =========================================================
-- FUNCTION FOR AVERAGE SALARY
-- =========================================================

CREATE OR REPLACE FUNCTION average_salary()

RETURNS NUMERIC

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT AVG(salary)
        FROM employees

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT average_salary();



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- Procedure:
-- uses CALL
--
-- Function:
-- uses SELECT
--
-- Procedure:
-- may not return value
--
-- Function:
-- must return value
--
-- =========================================================



-- =========================================================
-- PROCEDURE VS FUNCTION
-- =========================================================
--
-- PROCEDURE:
-- automation tasks
--
-- FUNCTION:
-- calculations and reusable logic
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Banking systems
-- - ERP software
-- - Payroll systems
-- - Enterprise applications
-- - Backend APIs
-- - Automation systems
--
-- =========================================================