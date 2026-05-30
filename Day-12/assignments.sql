-- =========================================================
-- DAY 12 ASSIGNMENTS WITH SOLUTIONS
-- TRIGGERS IN POSTGRESQL
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE staff (

    emp_id INT,
    emp_name VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO staff
VALUES
(1,'Aman',60000),
(2,'Riya',45000),
(3,'Karan',75000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM staff;



-- =========================================================
-- CREATE AUDIT TABLE
-- =========================================================

CREATE TABLE staff_audit (

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

    INSERT INTO staff_audit

    VALUES (
        'New Employee Added',
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

ON staff

FOR EACH ROW

EXECUTE FUNCTION audit_insert();



-- =========================================================
-- TEST
-- =========================================================

INSERT INTO staff
VALUES
(4,'Neha',85000);



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM staff_audit;



-- =========================================================
-- Q3. CREATE UPDATE TRIGGER FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION audit_update()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO staff_audit

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

ON staff

FOR EACH ROW

EXECUTE FUNCTION audit_update();



-- =========================================================
-- TEST
-- =========================================================

UPDATE staff

SET salary = 70000

WHERE emp_id = 1;



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM staff_audit;



-- =========================================================
-- Q5. CREATE DELETE TRIGGER FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION audit_delete()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO staff_audit

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

ON staff

FOR EACH ROW

EXECUTE FUNCTION audit_delete();



-- =========================================================
-- TEST
-- =========================================================

DELETE FROM staff

WHERE emp_id = 2;



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM staff_audit;



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

ON staff

FOR EACH ROW

EXECUTE FUNCTION validate_salary();



-- =========================================================
-- VALID TEST
-- =========================================================

INSERT INTO staff
VALUES
(5,'Rohit',65000);



-- =========================================================
-- INVALID TEST
-- =========================================================

-- INSERT INTO staff
-- VALUES
-- (6,'Priya',-5000);



-- =========================================================
-- Q9. SALARY CHANGE TRACKING
-- =========================================================

CREATE TABLE salary_audit (

    emp_id INT,
    old_salary INT,
    new_salary INT,
    updated_at TIMESTAMP

);



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

ON staff

FOR EACH ROW

EXECUTE FUNCTION salary_tracking();



UPDATE staff

SET salary = 90000

WHERE emp_id = 3;



SELECT *
FROM salary_audit;



-- =========================================================
-- Q10. DELETE HISTORY TRACKING
-- =========================================================

CREATE TABLE deleted_staff (

    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    deleted_at TIMESTAMP

);



CREATE OR REPLACE FUNCTION delete_history()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO deleted_staff

    VALUES (

        OLD.emp_id,
        OLD.emp_name,
        OLD.salary,
        CURRENT_TIMESTAMP

    );

    RETURN OLD;

END;

$$;



CREATE TRIGGER delete_history_trigger

AFTER DELETE

ON staff

FOR EACH ROW

EXECUTE FUNCTION delete_history();



DELETE FROM staff

WHERE emp_id = 1;



SELECT *
FROM deleted_staff;



-- =========================================================
-- THEORY QUESTIONS WITH ANSWERS
-- =========================================================

-- Q1. What is Trigger?
--
-- Trigger is automatic action
-- executed when event occurs.

--
-- Q2. What events fire Trigger?
--
-- INSERT
-- UPDATE
-- DELETE

--
-- Q3. What is Trigger Function?
--
-- Function executed by Trigger.

--
-- Q4. Difference between OLD and NEW?
--
-- OLD = previous values
--
-- NEW = updated values

--
-- Q5. Difference between
-- BEFORE and AFTER Trigger?
--
-- BEFORE = validation
--
-- AFTER = logging

--
-- Q6. Why use Triggers?
--
-- Automation
-- Auditing
-- Logging
-- Security

--
-- Q7. RETURN NEW vs RETURN OLD?
--
-- INSERT = RETURN NEW
--
-- UPDATE = RETURN NEW
--
-- DELETE = RETURN OLD



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================

-- Banking Systems
-- ERP Software
-- Payroll Systems
-- Security Monitoring
-- Audit Logging
-- Inventory Systems
-- Employee Tracking

-- =========================================================