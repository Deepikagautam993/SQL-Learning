-- =========================================================
-- DAY 12 MINI PROJECT
-- EMPLOYEE AUDIT & TRACKING SYSTEM
-- =========================================================

-- =========================================================
-- PROJECT OBJECTIVE
-- =========================================================
--
-- Build a system that:
-- 1. Tracks employee inserts
-- 2. Tracks salary updates
-- 3. Tracks deleted employees
-- 4. Validates salary before insert
-- 5. Maintains audit logs automatically
--
-- =========================================================



-- =========================================================
-- CREATE MAIN TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(1,'Aman','IT',60000),
(2,'Riya','HR',45000),
(3,'Karan','Finance',75000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- CREATE AUDIT LOG TABLE
-- =========================================================

CREATE TABLE audit_log (

    audit_message TEXT,
    audit_time TIMESTAMP

);



-- =========================================================
-- CREATE SALARY AUDIT TABLE
-- =========================================================

CREATE TABLE salary_audit (

    emp_id INT,
    old_salary INT,
    new_salary INT,
    updated_at TIMESTAMP

);



-- =========================================================
-- CREATE DELETED EMPLOYEE TABLE
-- =========================================================

CREATE TABLE deleted_employees (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    deleted_at TIMESTAMP

);



-- =========================================================
-- TRIGGER 1
-- VALIDATE SALARY BEFORE INSERT
-- =========================================================

CREATE OR REPLACE FUNCTION validate_salary()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    IF NEW.salary < 0 THEN

        RAISE EXCEPTION
        'Salary Cannot Be Negative';

    END IF;

    RETURN NEW;

END;

$$;



CREATE TRIGGER validate_salary_trigger

BEFORE INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION validate_salary();



-- =========================================================
-- TEST VALID INSERT
-- =========================================================

INSERT INTO employees
VALUES
(4,'Neha','IT',85000);



-- =========================================================
-- INVALID TEST
-- =========================================================

-- INSERT INTO employees
-- VALUES
-- (5,'Rohit','HR',-1000);



-- =========================================================
-- TRIGGER 2
-- INSERT AUDIT LOG
-- =========================================================

CREATE OR REPLACE FUNCTION audit_insert()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO audit_log

    VALUES (

        'New Employee Added',
        CURRENT_TIMESTAMP

    );

    RETURN NEW;

END;

$$;



CREATE TRIGGER insert_audit_trigger

AFTER INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_insert();



-- =========================================================
-- TEST INSERT
-- =========================================================

INSERT INTO employees
VALUES
(6,'Priya','Finance',70000);



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM audit_log;



-- =========================================================
-- TRIGGER 3
-- SALARY UPDATE TRACKING
-- =========================================================

CREATE OR REPLACE FUNCTION salary_tracking()

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



CREATE TRIGGER salary_update_trigger

AFTER UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION salary_tracking();



-- =========================================================
-- TEST UPDATE
-- =========================================================

UPDATE employees

SET salary = 90000

WHERE emp_id = 1;



-- =========================================================
-- VIEW SALARY AUDIT
-- =========================================================

SELECT *
FROM salary_audit;



-- =========================================================
-- TRIGGER 4
-- DELETE HISTORY
-- =========================================================

CREATE OR REPLACE FUNCTION delete_history()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO deleted_employees

    VALUES (

        OLD.emp_id,
        OLD.emp_name,
        OLD.department,
        OLD.salary,
        CURRENT_TIMESTAMP

    );

    RETURN OLD;

END;

$$;



CREATE TRIGGER delete_history_trigger

AFTER DELETE

ON employees

FOR EACH ROW

EXECUTE FUNCTION delete_history();



-- =========================================================
-- TEST DELETE
-- =========================================================

DELETE FROM employees

WHERE emp_id = 2;



-- =========================================================
-- VIEW DELETED EMPLOYEES
-- =========================================================

SELECT *
FROM deleted_employees;



-- =========================================================
-- FINAL REPORT
-- =========================================================

SELECT *
FROM employees;

SELECT *
FROM audit_log;

SELECT *
FROM salary_audit;

SELECT *
FROM deleted_employees;



-- =========================================================
-- PROJECT FEATURES
-- =========================================================
--
-- Automatic Validation
-- Automatic Insert Logging
-- Salary Change Tracking
-- Delete History Tracking
-- Audit Management
-- Employee Monitoring
--
-- =========================================================



-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================
--
-- Q1. What is Trigger?
--
-- Q2. What is Trigger Function?
--
-- Q3. Difference between OLD and NEW?
--
-- Q4. Difference between BEFORE and AFTER?
--
-- Q5. Why use Triggers?
--
-- Q6. What events fire Trigger?
--
-- INSERT
-- UPDATE
-- DELETE
--
-- =========================================================



-- =========================================================
-- REAL-WORLD APPLICATIONS
-- =========================================================
--
-- Banking Systems
-- ERP Software
-- Payroll Systems
-- Security Monitoring
-- Employee Tracking
-- Inventory Systems
-- Audit Logging
--
-- =========================================================



-- =========================================================
-- PROJECT CONCLUSION
-- =========================================================
--
-- Skills Learned:
--
-- Trigger Programming
-- Audit Logging
-- Event Handling
-- Database Automation
-- Validation Rules
-- Employee Tracking
-- PostgreSQL Advanced Concepts
--
-- =========================================================