-- =========================================================
-- DAY 12
-- TRIGGERS BASICS
-- =========================================================

-- =========================================================
-- TOPICS COVERED
-- =========================================================
-- 1. Trigger
-- 2. Trigger Function
-- 3. INSERT Trigger
-- 4. UPDATE Trigger
-- 5. DELETE Trigger
-- 6. OLD Keyword
-- 7. NEW Keyword
-- 8. Audit Logging
-- =========================================================



-- =========================================================
-- CREATE EMPLOYEES TABLE
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
-- INSERT TRIGGER FUNCTION
-- =========================================================

CREATE OR REPLACE FUNCTION audit_insert()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employee_audit

    VALUES (

        'New Employee Added',

        CURRENT_TIMESTAMP

    );

    RETURN NEW;

END;

$$;



-- =========================================================
-- CREATE INSERT TRIGGER
-- =========================================================

CREATE TRIGGER employee_insert_trigger

AFTER INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_insert();



-- =========================================================
-- TEST INSERT TRIGGER
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
-- UPDATE TRIGGER FUNCTION
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
-- CREATE UPDATE TRIGGER
-- =========================================================

CREATE TRIGGER employee_update_trigger

AFTER UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_update();



-- =========================================================
-- TEST UPDATE TRIGGER
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
-- DELETE TRIGGER FUNCTION
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
-- CREATE DELETE TRIGGER
-- =========================================================

CREATE TRIGGER employee_delete_trigger

AFTER DELETE

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_delete();



-- =========================================================
-- TEST DELETE TRIGGER
-- =========================================================

DELETE FROM employees

WHERE emp_id = 2;



-- =========================================================
-- VIEW AUDIT LOG
-- =========================================================

SELECT *
FROM employee_audit;



-- =========================================================
-- OLD VS NEW EXAMPLES
-- =========================================================

-- NEW:
-- contains new row values

-- OLD:
-- contains previous row values



-- =========================================================
-- IMPORTANT INTERVIEW NOTES
-- =========================================================

-- Trigger:
-- automatic action

-- Trigger Function:
-- function executed by trigger

-- INSERT:
-- RETURN NEW

-- UPDATE:
-- RETURN NEW

-- DELETE:
-- RETURN OLD



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================

-- Banking Systems
-- ERP Software
-- Payroll Systems
-- Security Systems
-- Audit Logging
-- Inventory Management

-- =========================================================