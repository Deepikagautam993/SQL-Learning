-- =========================================================
-- DAY 19 - TRIGGERS ASSIGNMENTS WITH SOLUTIONS
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
-- Q1: Create a trigger to log INSERT operations
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

CREATE TRIGGER trg_insert
AFTER INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION log_insert();

-- =========================================================
-- Q2: Create a trigger to prevent negative salary
-- =========================================================

CREATE FUNCTION check_salary()
RETURNS TRIGGER
AS $$

BEGIN

    IF NEW.salary < 0 THEN
        RAISE EXCEPTION 'Salary cannot be negative';
    END IF;

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_salary
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION check_salary();

-- =========================================================
-- Q3: Create trigger to log UPDATE (old & new salary)
-- =========================================================

CREATE FUNCTION log_update()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(
        emp_id,
        action_type,
        old_salary,
        new_salary
    )
    VALUES (
        NEW.emp_id,
        'UPDATE',
        OLD.salary,
        NEW.salary
    );

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_update();

-- =========================================================
-- Q4: Create trigger to log DELETE operation
-- =========================================================

CREATE FUNCTION log_delete()
RETURNS TRIGGER
AS $$

BEGIN

    INSERT INTO employee_audit(
        emp_id,
        action_type,
        old_salary
    )
    VALUES (
        OLD.emp_id,
        'DELETE',
        OLD.salary
    );

    RETURN OLD;

END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_delete
AFTER DELETE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_delete();

-- =========================================================
-- Q5: Insert sample data
-- =========================================================

INSERT INTO employees VALUES (101, 'Aman', 'IT', 60000);
INSERT INTO employees VALUES (102, 'Riya', 'HR', 45000);
INSERT INTO employees VALUES (103, 'Neha', 'Finance', 80000);

-- =========================================================
-- Q6: Update salary
-- =========================================================

UPDATE employees
SET salary = 70000
WHERE emp_id = 101;

-- =========================================================
-- Q7: Delete employee
-- =========================================================

DELETE FROM employees
WHERE emp_id = 102;

-- =========================================================
-- Q8: View employee table
-- =========================================================

SELECT * FROM employees;

-- =========================================================
-- Q9: View audit table
-- =========================================================

SELECT * FROM employee_audit;

-- =========================================================
-- INTERVIEW QUESTIONS (IMPORTANT)
-- =========================================================

-- Q1: What is a trigger?
-- Answer:
-- A trigger is a database object that automatically executes
-- when INSERT, UPDATE or DELETE occurs.

-- ---------------------------------------------------------

-- Q2: Difference between BEFORE and AFTER trigger?
-- Answer:
-- BEFORE → validation
-- AFTER → logging/audit

-- ---------------------------------------------------------

-- Q3: What is NEW and OLD?
-- Answer:
-- NEW → new row data
-- OLD → old row data

-- ---------------------------------------------------------

-- Q4: Can trigger be called manually?
-- Answer:
-- No, it is automatic.

-- ---------------------------------------------------------

-- Q5: What is audit system?
-- Answer:
-- A system that stores history of database changes.

-- =========================================================
-- END OF ASSIGNMENT FILE
-- =========================================================