-- =========================================================
-- DAY 19 - TRIGGER VALIDATION SYSTEM
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
-- 2. VALIDATION TRIGGER FUNCTION (SALARY CHECK)
-- =========================================================

CREATE FUNCTION validate_salary()
RETURNS TRIGGER
AS $$

BEGIN

    -- Salary must not be negative
    IF NEW.salary < 0 THEN
        RAISE EXCEPTION 'Salary cannot be negative';
    END IF;

    -- Minimum salary rule
    IF NEW.salary < 10000 THEN
        RAISE EXCEPTION 'Salary must be at least 10000';
    END IF;

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 3. BEFORE INSERT TRIGGER FOR SALARY
-- =========================================================

CREATE TRIGGER trg_validate_salary
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION validate_salary();

-- =========================================================
-- 4. VALIDATION TRIGGER FUNCTION (NAME CHECK)
-- =========================================================

CREATE FUNCTION validate_name()
RETURNS TRIGGER
AS $$

BEGIN

    -- Name should not be empty
    IF NEW.emp_name IS NULL OR NEW.emp_name = '' THEN
        RAISE EXCEPTION 'Employee name cannot be empty';
    END IF;

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 5. BEFORE INSERT TRIGGER FOR NAME
-- =========================================================

CREATE TRIGGER trg_validate_name
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION validate_name();

-- =========================================================
-- 6. VALIDATION TRIGGER FUNCTION (DEPARTMENT CHECK)
-- =========================================================

CREATE FUNCTION validate_department()
RETURNS TRIGGER
AS $$

BEGIN

    -- Only allowed departments
    IF NEW.department NOT IN ('IT', 'HR', 'Finance', 'Admin') THEN
        RAISE EXCEPTION 'Invalid department value';
    END IF;

    RETURN NEW;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- 7. BEFORE INSERT TRIGGER FOR DEPARTMENT
-- =========================================================

CREATE TRIGGER trg_validate_department
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION validate_department();

-- =========================================================
-- 8. TEST CASES
-- =========================================================

-- ✅ VALID INSERT
INSERT INTO employees VALUES (101, 'Aman', 'IT', 60000);

INSERT INTO employees VALUES (102, 'Riya', 'HR', 45000);

-- ❌ INVALID SALARY (ERROR)
-- INSERT INTO employees VALUES (103, 'Karan', 'IT', -5000);

-- ❌ INVALID NAME (ERROR)
-- INSERT INTO employees VALUES (104, '', 'IT', 50000);

-- ❌ INVALID DEPARTMENT (ERROR)
-- INSERT INTO employees VALUES (105, 'Neha', 'Sales', 50000);

-- =========================================================
-- 9. CHECK DATA
-- =========================================================

SELECT * FROM employees;

-- =========================================================
-- END OF FILE
-- =========================================================