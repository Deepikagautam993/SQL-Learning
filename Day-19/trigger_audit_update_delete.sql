-- =========================================================
-- DAY 19 - ADVANCED AUDIT SYSTEM (UPDATE + DELETE)
-- =========================================================

-- =========================================================
-- 1. MAIN EMPLOYEE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

-- =========================================================
-- 🧠 This table stores CURRENT data only
-- =========================================================

-- =========================================================
-- 2. AUDIT TABLE (FULL HISTORY STORAGE)
-- =========================================================

CREATE TABLE employee_audit (

    audit_id SERIAL PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    old_salary INT,
    new_salary INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- =========================================================
-- 🧠 WHY THIS TABLE?
-- It stores HISTORY of every change:
-- INSERT, UPDATE, DELETE
-- =========================================================

-- =========================================================
-- 3. INSERT AUDIT FUNCTION
-- =========================================================

CREATE FUNCTION audit_insert()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(
        emp_id,
        emp_name,
        department,
        action_type
    )
    VALUES (
        NEW.emp_id,
        NEW.emp_name,
        NEW.department,
        'INSERT'
    );

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 4. INSERT TRIGGER
-- =========================================================

CREATE TRIGGER trg_insert_audit
AFTER INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION audit_insert();

-- =========================================================
-- 🧠 INSERT FLOW:
-- NEW data → audit table
-- OLD not available here
-- =========================================================

-- =========================================================
-- 5. UPDATE AUDIT FUNCTION
-- =========================================================

CREATE FUNCTION audit_update()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(
        emp_id,
        emp_name,
        department,
        old_salary,
        new_salary,
        action_type
    )
    VALUES (
        NEW.emp_id,
        NEW.emp_name,
        NEW.department,
        OLD.salary,
        NEW.salary,
        'UPDATE'
    );

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 6. UPDATE TRIGGER
-- =========================================================

CREATE TRIGGER trg_update_audit
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION audit_update();

-- =========================================================
-- 🧠 UPDATE FLOW:
-- OLD → previous salary
-- NEW → updated salary
-- =========================================================

-- =========================================================
-- 7. DELETE AUDIT FUNCTION
-- =========================================================

CREATE FUNCTION audit_delete()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(
        emp_id,
        emp_name,
        department,
        old_salary,
        action_type
    )
    VALUES (
        OLD.emp_id,
        OLD.emp_name,
        OLD.department,
        OLD.salary,
        'DELETE'
    );

    RETURN OLD;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 8. DELETE TRIGGER
-- =========================================================

CREATE TRIGGER trg_delete_audit
AFTER DELETE ON employees
FOR EACH ROW
EXECUTE FUNCTION audit_delete();

-- =========================================================
-- 🧠 DELETE FLOW:
-- Only OLD data is available
-- NEW does not exist
-- =========================================================

-- =========================================================
-- 9. TEST DATA INSERT
-- =========================================================

INSERT INTO employees VALUES (101, 'Aman', 'IT', 60000);
INSERT INTO employees VALUES (102, 'Riya', 'HR', 45000);

-- =========================================================
-- 10. UPDATE TEST
-- =========================================================

UPDATE employees
SET salary = 70000
WHERE emp_id = 101;

-- =========================================================
-- 11. DELETE TEST
-- =========================================================

DELETE FROM employees
WHERE emp_id = 102;

-- =========================================================
-- 12. CHECK EMPLOYEE TABLE
-- =========================================================

SELECT * FROM employees;

-- =========================================================
-- 13. CHECK AUDIT HISTORY
-- =========================================================

SELECT * FROM employee_audit;

-- =========================================================
-- 🧠 FINAL SUMMARY
-- =========================================================

-- ✔ INSERT → NEW data logged
-- ✔ UPDATE → OLD + NEW comparison
-- ✔ DELETE → OLD data backup
-- ✔ AFTER triggers used for logging
-- ✔ Audit table stores full history

-- =========================================================
-- END OF FILE
-- =========================================================