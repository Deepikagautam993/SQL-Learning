-- =========================================================
-- DAY 19 MINI PROJECT
-- EMPLOYEE MANAGEMENT + AUDIT SYSTEM
-- =========================================================

-- =========================================================
-- 1. MAIN TABLE (CURRENT DATA)
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

-- =========================================================
-- 2. AUDIT TABLE (HISTORY STORAGE)
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
-- 🧠 WHY AUDIT TABLE?
-- This table stores FULL HISTORY of changes:
-- INSERT → UPDATE → DELETE tracking
-- =========================================================

-- =========================================================
-- 3. VALIDATION FUNCTION (BEFORE INSERT)
-- =========================================================

CREATE FUNCTION validate_employee()
RETURNS TRIGGER
AS $$

BEGIN

    -- ❌ Salary validation
    IF NEW.salary < 10000 THEN
        RAISE EXCEPTION 'Salary must be at least 10000';
    END IF;

    -- ❌ Name validation
    IF NEW.emp_name IS NULL OR NEW.emp_name = '' THEN
        RAISE EXCEPTION 'Employee name cannot be empty';
    END IF;

    -- ❌ Department validation
    IF NEW.department NOT IN ('IT', 'HR', 'Finance', 'Admin') THEN
        RAISE EXCEPTION 'Invalid department';
    END IF;

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 4. BEFORE INSERT TRIGGER (VALIDATION)
-- =========================================================

CREATE TRIGGER trg_validate_employee
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION validate_employee();

-- =========================================================
-- 🧠 WHY BEFORE TRIGGER?
-- Data ko insert hone se pehle check karte hain
-- =========================================================

-- =========================================================
-- 5. INSERT AUDIT FUNCTION
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
-- 6. AFTER INSERT TRIGGER
-- =========================================================

CREATE TRIGGER trg_audit_insert
AFTER INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION audit_insert();

-- =========================================================
-- 7. UPDATE AUDIT FUNCTION
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
-- 8. AFTER UPDATE TRIGGER
-- =========================================================

CREATE TRIGGER trg_audit_update
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION audit_update();

-- =========================================================
-- 9. DELETE AUDIT FUNCTION
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
-- 10. AFTER DELETE TRIGGER
-- =========================================================

CREATE TRIGGER trg_audit_delete
AFTER DELETE ON employees
FOR EACH ROW
EXECUTE FUNCTION audit_delete();

-- =========================================================
-- 🧪 TESTING SECTION
-- =========================================================

-- =========================================================
-- INSERT TEST (VALID DATA)
-- =========================================================

INSERT INTO employees VALUES (101, 'Aman', 'IT', 60000);
INSERT INTO employees VALUES (102, 'Riya', 'HR', 45000);

-- =========================================================
-- UPDATE TEST
-- =========================================================

UPDATE employees
SET salary = 70000
WHERE emp_id = 101;

-- =========================================================
-- DELETE TEST
-- =========================================================

DELETE FROM employees
WHERE emp_id = 102;

-- =========================================================
-- CHECK EMPLOYEE DATA
-- =========================================================

SELECT * FROM employees;

-- =========================================================
-- CHECK AUDIT HISTORY
-- =========================================================

SELECT * FROM employee_audit;

-- =========================================================
-- 🧠 FINAL SUMMARY (IMPORTANT)
-- =========================================================

-- ✔ BEFORE TRIGGER → Validation (data check)
-- ✔ AFTER INSERT → Log entry
-- ✔ AFTER UPDATE → Track changes (OLD + NEW)
-- ✔ AFTER DELETE → Store deleted record
-- ✔ AUDIT TABLE → Full history storage

-- =========================================================
-- END OF PROJECT
-- =========================================================