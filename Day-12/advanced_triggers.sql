-- =========================================================
-- DAY 12
-- ADVANCED TRIGGERS
-- =========================================================

-- =========================================================
-- PROJECT OVERVIEW
-- =========================================================
--
-- Topics:
-- 1. BEFORE Trigger
-- 2. AFTER Trigger
-- 3. Validation Trigger
-- 4. Audit Trigger
-- 5. Salary Tracking
-- 6. OLD and NEW Usage
-- 7. Business Rules
--
-- =========================================================



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employee_details (

    emp_id INT,
    emp_name VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employee_details
VALUES
(1,'Aman',60000),
(2,'Riya',45000),
(3,'Karan',75000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employee_details;



-- =========================================================
-- CREATE AUDIT TABLE
-- =========================================================

CREATE TABLE salary_audit (

    emp_id INT,
    old_salary INT,
    new_salary INT,
    updated_at TIMESTAMP

);



-- =========================================================
-- BEFORE INSERT TRIGGER
-- =========================================================
-- Prevent negative salary
-- =========================================================

CREATE OR REPLACE FUNCTION validate_salary()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    IF NEW.salary < 0 THEN

        RAISE EXCEPTION
        'Salary cannot be negative';

    END IF;

    RETURN NEW;

END;

$$;



-- =========================================================
-- CREATE BEFORE INSERT TRIGGER
-- =========================================================

CREATE TRIGGER validate_salary_trigger

BEFORE INSERT

ON employee_details

FOR EACH ROW

EXECUTE FUNCTION validate_salary();



-- =========================================================
-- TEST VALID INSERT
-- =========================================================

INSERT INTO employee_details
VALUES
(4,'Neha',85000);



-- =========================================================
-- TEST INVALID INSERT
-- =========================================================

-- INSERT INTO employee_details
-- VALUES
-- (5,'Rohit',-1000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employee_details;



-- =========================================================
-- SALARY UPDATE AUDIT FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION salary_update_audit()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO salary_audit

    VALUES (

        OLD.emp_id,
        OLD.salary,
        NEW.salary,
        CURRENT_TIMESTAMP

    );

    RETURN NEW;

END;

$$;



-- =========================================================
-- CREATE UPDATE TRIGGER
-- =========================================================

CREATE TRIGGER salary_update_trigger

AFTER UPDATE

ON employee_details

FOR EACH ROW

EXECUTE FUNCTION salary_update_audit();



-- =========================================================
-- TEST UPDATE
-- =========================================================

UPDATE employee_details

SET salary = 80000

WHERE emp_id = 1;



-- =========================================================
-- VIEW AUDIT TABLE
-- =========================================================

SELECT *
FROM salary_audit;



-- =========================================================
-- DELETE AUDIT TABLE
-- =========================================================

CREATE TABLE deleted_employees (

    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    deleted_at TIMESTAMP

);



-- =========================================================
-- DELETE AUDIT FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION delete_audit()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO deleted_employees

    VALUES (

        OLD.emp_id,
        OLD.emp_name,
        OLD.salary,
        CURRENT_TIMESTAMP

    );

    RETURN OLD;

END;

$$;



-- =========================================================
-- CREATE DELETE TRIGGER
-- =========================================================

CREATE TRIGGER employee_delete_trigger

AFTER DELETE

ON employee_details

FOR EACH ROW

EXECUTE FUNCTION delete_audit();



-- =========================================================
-- TEST DELETE
-- =========================================================

DELETE FROM employee_details

WHERE emp_id = 2;



-- =========================================================
-- VIEW DELETED EMPLOYEES
-- =========================================================

SELECT *
FROM deleted_employees;



-- =========================================================
-- MULTIPLE UPDATE TESTS
-- =========================================================

UPDATE employee_details
SET salary = 90000
WHERE emp_id = 3;

UPDATE employee_details
SET salary = 95000
WHERE emp_id = 4;



-- =========================================================
-- VIEW SALARY AUDIT
-- =========================================================

SELECT *
FROM salary_audit;



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================
--
-- BEFORE Trigger:
-- Executes before event
--
-- AFTER Trigger:
-- Executes after event
--
-- OLD:
-- Previous row values
--
-- NEW:
-- Updated row values
--
-- Validation:
-- Usually BEFORE Trigger
--
-- Logging:
-- Usually AFTER Trigger
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Banking Systems
-- Employee Tracking
-- Security Monitoring
-- Payroll Systems
-- ERP Software
-- Inventory Systems
-- Audit Management
--
-- =========================================================