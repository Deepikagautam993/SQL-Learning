-- =========================================================
-- DAY 12
-- TRIGGERS PRACTICE QUESTIONS
-- =========================================================

-- =========================================================
-- CREATE EMPLOYEE TABLE
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
(1,'Aman',60000),
(2,'Riya',45000),
(3,'Karan',75000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- CREATE AUDIT TABLE
-- =========================================================

CREATE TABLE employee_audit (

    audit_message TEXT,
    audit_time TIMESTAMP

);



-- =========================================================
-- Q1. CREATE INSERT TRIGGER FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION audit_insert()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employee_audit

    VALUES (

        'Employee Added',

        CURRENT_TIMESTAMP

    );

    RETURN NEW;

END;

$$;



-- =========================================================
-- Q2. CREATE INSERT TRIGGER
-- =========================================================

CREATE TRIGGER insert_trigger

AFTER INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_insert();



-- =========================================================
-- TEST
-- =========================================================

INSERT INTO employees
VALUES
(4,'Neha',85000);



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM employee_audit;



-- =========================================================
-- Q3. CREATE UPDATE TRIGGER FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION audit_update()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employee_audit

    VALUES (

        'Employee Updated',

        CURRENT_TIMESTAMP

    );

    RETURN NEW;

END;

$$;



-- =========================================================
-- Q4. CREATE UPDATE TRIGGER
-- =========================================================

CREATE TRIGGER update_trigger

AFTER UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_update();



-- =========================================================
-- TEST
-- =========================================================

UPDATE employees

SET salary = 70000

WHERE emp_id = 1;



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM employee_audit;



-- =========================================================
-- Q5. CREATE DELETE TRIGGER FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION audit_delete()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employee_audit

    VALUES (

        'Employee Deleted',

        CURRENT_TIMESTAMP

    );

    RETURN OLD;

END;

$$;



-- =========================================================
-- Q6. CREATE DELETE TRIGGER
-- =========================================================

CREATE TRIGGER delete_trigger

AFTER DELETE

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_delete();



-- =========================================================
-- TEST
-- =========================================================

DELETE FROM employees

WHERE emp_id = 2;



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM employee_audit;



-- =========================================================
-- Q7. CREATE VALIDATION FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION validate_salary()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    IF NEW.salary < 0 THEN

        RAISE EXCEPTION
        'Negative Salary Not Allowed';

    END IF;

    RETURN NEW;

END;

$$;



-- =========================================================
-- Q8. CREATE BEFORE INSERT TRIGGER
-- =========================================================

CREATE TRIGGER validate_salary_trigger

BEFORE INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION validate_salary();



-- =========================================================
-- VALID TEST
-- =========================================================

INSERT INTO employees
VALUES
(5,'Rohit',65000);



-- =========================================================
-- INVALID TEST
-- =========================================================

-- INSERT INTO employees
-- VALUES
-- (6,'Priya',-5000);



-- =========================================================
-- Q9. OLD AND NEW PRACTICE
-- =========================================================

-- NEW:
-- New row values

-- OLD:
-- Previous row values



-- =========================================================
-- Q10. BEFORE VS AFTER PRACTICE
-- =========================================================

-- BEFORE:
-- Validation

-- AFTER:
-- Logging



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- 1. What is Trigger?

-- 2. Why use Trigger?

-- 3. Difference between
-- BEFORE and AFTER Trigger?

-- 4. Difference between
-- OLD and NEW?

-- 5. What is Trigger Function?

-- 6. Which events fire trigger?

-- INSERT
-- UPDATE
-- DELETE



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================

-- Banking Systems
-- ERP Software
-- Payroll Systems
-- Security Monitoring
-- Inventory Systems
-- Audit Logging

-- =========================================================