-- =========================================================
-- DAY 11 MINI PROJECT
-- EMPLOYEE MANAGEMENT AUTOMATION SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
--
-- This project demonstrates:
--
-- 1. Stored Procedures
-- 2. Functions
-- 3. Database Automation
-- 4. Salary Analytics
-- 5. KPI Calculations
-- 6. Enterprise SQL Programming
-- 7. Reusable Business Logic
-- 8. Backend Database Operations
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employee_management (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employee_management
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
FROM employee_management;



-- =========================================================
-- PROCEDURE FOR INSERT
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

    INSERT INTO employee_management
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
FROM employee_management;



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

    UPDATE employee_management

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
FROM employee_management;



-- =========================================================
-- PROCEDURE FOR DELETE
-- =========================================================

CREATE OR REPLACE PROCEDURE remove_employee(

    p_id INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    DELETE FROM employee_management

    WHERE emp_id = p_id;

END;

$$;



-- =========================================================
-- EXECUTE PROCEDURE
-- =========================================================

CALL remove_employee(2);



-- =========================================================
-- VIEW UPDATED TABLE
-- =========================================================

SELECT *
FROM employee_management;



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
        FROM employee_management

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
        FROM employee_management

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
        FROM employee_management

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT average_salary();



-- =========================================================
-- BONUS FUNCTION
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

SELECT employee_bonus(70000);



-- =========================================================
-- SALARY CATEGORY FUNCTION
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
-- KPI FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION total_salary_expense()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT SUM(salary)
        FROM employee_management

    );

END;

$$;



-- =========================================================
-- EXECUTE FUNCTION
-- =========================================================

SELECT total_salary_expense();



-- =========================================================
-- FINAL ANALYTICS QUERY
-- =========================================================

SELECT
    department,

    COUNT(*) AS total_employees,

    MAX(salary) AS highest_salary,

    MIN(salary) AS lowest_salary,

    AVG(salary) AS average_salary,

    SUM(salary) AS total_salary

FROM employee_management

GROUP BY department;



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- Procedure:
-- saved SQL program
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
-- - Enterprise automation
--
-- =========================================================



-- =========================================================
-- PROJECT CONCLUSION
-- =========================================================
--
-- Skills Demonstrated:
--
-- - Stored Procedures
-- - Functions
-- - Database Automation
-- - Salary Analytics
-- - KPI Calculations
-- - Backend SQL Development
-- - Enterprise SQL Programming
--
-- =========================================================