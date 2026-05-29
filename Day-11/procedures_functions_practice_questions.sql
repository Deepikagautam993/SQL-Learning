-- =========================================================
-- DAY 11 PRACTICE QUESTIONS
-- STORED PROCEDURES & FUNCTIONS
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employee_data (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employee_data
VALUES
(1, 'Aman', 'IT', 65000),
(2, 'Riya', 'HR', 45000),
(3, 'Karan', 'IT', 85000),
(4, 'Simran', 'Finance', 55000),
(5, 'Neha', 'IT', 92000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employee_data;



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

    INSERT INTO employee_data
    VALUES (p_id, p_name, p_department, p_salary);

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL add_employee(6, 'Rohit', 'Finance', 60000);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM employee_data;



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

    UPDATE employee_data

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
FROM employee_data;



-- =========================================================
-- Q4. CREATE DELETE PROCEDURE
-- =========================================================

CREATE OR REPLACE PROCEDURE delete_employee(

    p_id INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    DELETE FROM employee_data

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
FROM employee_data;



-- =========================================================
-- Q5. CREATE FIRST FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION total_employees()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT COUNT(*)
        FROM employee_data

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
        FROM employee_data

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
        FROM employee_data

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

    RETURN emp_salary + 5000;

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
-- Q10. CREATE TOTAL SALARY FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION total_salary_expense()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT SUM(salary)
        FROM employee_data

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT total_salary_expense();



-- =========================================================
-- IMPORTANT INTERVIEW QUESTIONS
-- =========================================================
--
-- Q1. What is Stored Procedure?
--
-- Q2. What is Function?
--
-- Q3. Difference between:
-- Procedure and Function
--
-- Q4. What is CALL statement?
--
-- Q5. Why functions return values?
--
-- Q6. What is parameter function?
--
-- Q7. Difference between:
-- CALL and SELECT
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
-- - Financial analytics
--
-- =========================================================