-- =========================================================
-- DAY 19 - TRIGGER BASICS
-- =========================================================

-- =========================================================
-- 1. CREATE EMPLOYEE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

-- =========================================================
-- 2. CREATE AUDIT TABLE
-- =========================================================

CREATE TABLE employee_audit (

    audit_id SERIAL PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(20),
    old_salary INT,
    new_salary INT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- =========================================================
-- 3. TRIGGER FUNCTION FOR INSERT
-- =========================================================

CREATE FUNCTION log_insert()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(emp_id, action_type)
    VALUES (NEW.emp_id, 'INSERT');

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 4. INSERT TRIGGER
-- =========================================================

CREATE TRIGGER trg_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION log_insert();

-- =========================================================
-- 5. TRIGGER FUNCTION FOR UPDATE
-- =========================================================

CREATE FUNCTION log_update()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(emp_id, action_type, old_salary, new_salary)
    VALUES (NEW.emp_id, 'UPDATE', OLD.salary, NEW.salary);

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 6. UPDATE TRIGGER
-- =========================================================

CREATE TRIGGER trg_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_update();

-- =========================================================
-- 7. TRIGGER FUNCTION FOR DELETE
-- =========================================================

CREATE FUNCTION log_delete()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(emp_id, action_type, old_salary)
    VALUES (OLD.emp_id, 'DELETE', OLD.salary);

    RETURN OLD;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 8. DELETE TRIGGER
-- =========================================================

CREATE TRIGGER trg_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_delete();

-- =========================================================
-- 9. TEST INSERT
-- =========================================================

INSERT INTO employees VALUES (101, 'Aman', 'IT', 60000);
INSERT INTO employees VALUES (102, 'Riya', 'HR', 45000);

-- =========================================================
-- 10. TEST UPDATE
-- =========================================================

UPDATE employees
SET salary = 70000
WHERE emp_id = 101;

-- =========================================================
-- 11. TEST DELETE
-- =========================================================

DELETE FROM employees
WHERE emp_id = 102;

-- =========================================================
-- 12. CHECK AUDIT LOG
-- =========================================================

SELECT * FROM employee_audit;

-- =========================================================
-- END OF FILE
-- =========================================================