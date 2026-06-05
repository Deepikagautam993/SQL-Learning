-- =========================================================
-- DAY 18
-- FILE 2 : PROCEDURE BASICS
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000),
(102,'Riya Gupta','HR',45000),
(103,'Karan Singh','IT',75000);

-- =========================================================
-- PROCEDURE 1 : ADD EMPLOYEE
-- =========================================================

CREATE PROCEDURE add_employee(

    p_emp_id INT,
    p_emp_name VARCHAR(100),
    p_department VARCHAR(50),
    p_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employees
    VALUES
    (
        p_emp_id,
        p_emp_name,
        p_department,
        p_salary
    );

END;

$$;

-- =========================================================
-- CALL PROCEDURE
-- =========================================================

CALL add_employee(
    104,
    'Neha Verma',
    'Finance',
    85000
);

-- =========================================================
-- VERIFY DATA
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- PROCEDURE 2 : UPDATE SALARY
-- =========================================================

CREATE PROCEDURE update_salary(

    p_emp_id INT,
    p_new_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET salary = p_new_salary

    WHERE emp_id = p_emp_id;

END;

$$;

-- =========================================================
-- CALL PROCEDURE
-- =========================================================

CALL update_salary(
    101,
    70000
);

-- =========================================================
-- VERIFY UPDATE
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- PROCEDURE 3 : DELETE EMPLOYEE
-- =========================================================

CREATE PROCEDURE delete_employee(

    p_emp_id INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    DELETE FROM employees

    WHERE emp_id = p_emp_id;

END;

$$;

-- =========================================================
-- CALL PROCEDURE
-- =========================================================

CALL delete_employee(102);

-- =========================================================
-- VERIFY DELETE
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- PROCEDURE 4 : BONUS UPDATE
-- =========================================================

CREATE PROCEDURE increase_salary_by_bonus(

    p_bonus_percent INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET salary =
        salary +
        (salary * p_bonus_percent / 100);

END;

$$;

-- =========================================================
-- CALL PROCEDURE
-- =========================================================

CALL increase_salary_by_bonus(10);

-- =========================================================
-- VERIFY RESULT
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- PROCEDURE 5 : TRANSFER DEPARTMENT
-- =========================================================

CREATE PROCEDURE transfer_department(

    p_emp_id INT,
    p_new_department VARCHAR(50)

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET department = p_new_department

    WHERE emp_id = p_emp_id;

END;

$$;

-- =========================================================
-- CALL PROCEDURE
-- =========================================================

CALL transfer_department(
    103,
    'Finance'
);

-- =========================================================
-- VERIFY RESULT
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- PROCEDURE 6 : DELETE ALL HR EMPLOYEES
-- =========================================================

CREATE PROCEDURE remove_hr_employees()

LANGUAGE plpgsql

AS $$

BEGIN

    DELETE FROM employees

    WHERE department = 'HR';

END;

$$;

-- =========================================================
-- CALL PROCEDURE
-- =========================================================

CALL remove_hr_employees();

-- =========================================================
-- VERIFY RESULT
-- =========================================================

SELECT *
FROM employees;

-- =========================================================
-- END OF FILE
-- =========================================================