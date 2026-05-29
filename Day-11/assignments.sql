-- =========================================================
-- DAY 11 ASSIGNMENTS WITH SOLUTIONS
-- STORED PROCEDURES & FUNCTIONS
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE company_staff (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO company_staff
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
FROM company_staff;



-- =========================================================
-- Q1. CREATE FIRST PROCEDURE
-- =========================================================

CREATE OR REPLACE PROCEDURE show_message()

LANGUAGE plpgsql

AS $$

BEGIN

    RAISE NOTICE 'Procedure Executed Successfully';

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL show_message();



-- =========================================================
-- Q2. CREATE INSERT PROCEDURE
-- =========================================================

CREATE OR REPLACE PROCEDURE add_employee(

    p_id INT,
    p_name VARCHAR,
    p_department VARCHAR,
    p_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO company_staff
    VALUES (p_id, p_name, p_department, p_salary);

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL add_employee(7, 'Priya', 'HR', 50000);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM company_staff;



-- =========================================================
-- Q3. CREATE UPDATE PROCEDURE
-- =========================================================

CREATE OR REPLACE PROCEDURE update_salary(

    p_id INT,
    new_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE company_staff

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
FROM company_staff;



-- =========================================================
-- Q4. CREATE DELETE PROCEDURE
-- =========================================================

CREATE OR REPLACE PROCEDURE delete_employee(

    p_id INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    DELETE FROM company_staff

    WHERE emp_id = p_id;

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL delete_employee(4);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM company_staff;



-- =========================================================
-- Q5. CREATE TOTAL EMPLOYEES FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION total_employees()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT COUNT(*)
        FROM company_staff

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT total_employees();



-- =========================================================
-- Q6. CREATE HIGHEST SALARY FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION highest_salary()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT MAX(salary)
        FROM company_staff

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT highest_salary();



-- =========================================================
-- Q7. CREATE AVERAGE SALARY FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION average_salary()

RETURNS NUMERIC

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT AVG(salary)
        FROM company_staff

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT average_salary();



-- =========================================================
-- Q8. CREATE BONUS FUNCTION
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

SELECT employee_bonus(60000);



-- =========================================================
-- Q9. CREATE SALARY CATEGORY FUNCTION
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

SELECT salary_category(92000);



-- =========================================================
-- Q10. CREATE TOTAL SALARY EXPENSE FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION total_salary_expense()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT SUM(salary)
        FROM company_staff

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT total_salary_expense();



-- =========================================================
-- THEORY QUESTIONS WITH ANSWERS
-- =========================================================

-- =========================================================
-- Q11. WHAT IS STORED PROCEDURE?
-- =========================================================
--
-- Stored Procedure:
-- saved SQL program inside database.
--
-- =========================================================



-- =========================================================
-- Q12. WHAT IS FUNCTION?
-- =========================================================
--
-- Function:
-- reusable SQL logic that returns value.
--
-- =========================================================



-- =========================================================
-- Q13. DIFFERENCE BETWEEN
-- PROCEDURE AND FUNCTION
-- =========================================================
--
-- PROCEDURE:
-- uses CALL statement.
--
-- FUNCTION:
-- uses SELECT statement.
--
-- Procedure may not return value.
--
-- Function must return value.
--
-- =========================================================



-- =========================================================
-- Q14. WHAT IS CALL STATEMENT?
-- =========================================================
--
-- CALL:
-- executes stored procedure.
--
-- =========================================================



-- =========================================================
-- Q15. WHAT IS RETURN STATEMENT?
-- =========================================================
--
-- RETURN:
-- sends output from function.
--
-- =========================================================



-- =========================================================
-- Q16. WHAT IS PARAMETER FUNCTION?
-- =========================================================
--
-- Function accepting input values
-- is called parameter function.
--
-- =========================================================



-- =========================================================
-- Q17. REAL-WORLD USES
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