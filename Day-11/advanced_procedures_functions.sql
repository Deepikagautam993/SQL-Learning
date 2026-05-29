-- =========================================================
-- DAY 11
-- ADVANCED STORED PROCEDURES & FUNCTIONS
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
--
-- This file focuses on:
--
-- 1. Advanced Procedures
-- 2. Advanced Functions
-- 3. Parameter Handling
-- 4. Business Logic Automation
-- 5. Salary Analytics
-- 6. KPI Functions
-- 7. Enterprise SQL Development
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE company_employees (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO company_employees
VALUES
(1, 'Aman', 'IT', 65000),
(2, 'Riya', 'HR', 45000),
(3, 'Karan', 'IT', 85000),
(4, 'Simran', 'Finance', 55000),
(5, 'Neha', 'IT', 92000),
(6, 'Rohit', 'Finance', 60000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM company_employees;



-- =========================================================
-- PROCEDURE FOR INSERT
-- =========================================================

CREATE OR REPLACE PROCEDURE insert_employee(

    p_id INT,
    p_name VARCHAR,
    p_department VARCHAR,
    p_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO company_employees
    VALUES (p_id, p_name, p_department, p_salary);

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL insert_employee(7, 'Priya', 'HR', 50000);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM company_employees;



-- =========================================================
-- PROCEDURE FOR UPDATE
-- =========================================================

CREATE OR REPLACE PROCEDURE increase_salary(

    p_id INT,
    increment_amount INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE company_employees

    SET salary = salary + increment_amount

    WHERE emp_id = p_id;

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL increase_salary(1, 5000);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM company_employees;



-- =========================================================
-- PROCEDURE FOR DELETE
-- =========================================================

CREATE OR REPLACE PROCEDURE delete_employee(

    p_id INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    DELETE FROM company_employees

    WHERE emp_id = p_id;

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL delete_employee(2);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM company_employees;



-- =========================================================
-- FUNCTION FOR TOTAL EMPLOYEES
-- =========================================================

CREATE OR REPLACE FUNCTION total_employees()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT COUNT(*)
        FROM company_employees

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT total_employees();



-- =========================================================
-- FUNCTION FOR HIGHEST SALARY
-- =========================================================

CREATE OR REPLACE FUNCTION highest_salary()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT MAX(salary)
        FROM company_employees

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
        FROM company_employees

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT average_salary();



-- =========================================================
-- PARAMETER FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION employee_bonus(

    emp_salary INT

)

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN emp_salary + 10000;

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT employee_bonus(50000);



-- =========================================================
-- FUNCTION WITH CONDITIONS
-- =========================================================

CREATE OR REPLACE FUNCTION salary_category(

    emp_salary INT

)

RETURNS VARCHAR

LANGUAGE plpgsql

AS $$

BEGIN

    IF emp_salary > 80000 THEN

        RETURN 'High Salary';

    ELSIF emp_salary > 60000 THEN

        RETURN 'Medium Salary';

    ELSE

        RETURN 'Low Salary';

    END IF;

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT salary_category(85000);



-- =========================================================
-- KPI FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION total_salary_expense()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT SUM(salary)
        FROM company_employees

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT total_salary_expense();



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- Procedure:
-- executes task
--
-- Function:
-- returns value
--
-- CALL:
-- executes procedure
--
-- SELECT:
-- executes function
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
-- - Backend APIs
-- - Enterprise applications
-- - Financial analytics
--
-- =========================================================