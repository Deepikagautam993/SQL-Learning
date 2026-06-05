-- =========================================================
-- DAY 18 MINI PROJECT
-- EMPLOYEE PAYROLL & MANAGEMENT SYSTEM
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    joining_date DATE

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000,'2022-01-15'),
(102,'Riya Gupta','HR',45000,'2021-08-10'),
(103,'Karan Singh','IT',75000,'2023-02-20'),
(104,'Neha Verma','Finance',85000,'2020-05-12'),
(105,'Priya Jain','HR',55000,'2022-11-18');

-- =========================================================
-- FUNCTION : BONUS CALCULATION
-- =========================================================

CREATE FUNCTION calculate_bonus(

    salary NUMERIC

)

RETURNS NUMERIC

AS $$

BEGIN

    RETURN salary * 0.10;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- FUNCTION : TAX CALCULATION
-- =========================================================

CREATE FUNCTION calculate_tax(

    salary NUMERIC

)

RETURNS NUMERIC

AS $$

BEGIN

    RETURN salary * 0.05;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- FUNCTION : NET SALARY
-- =========================================================

CREATE FUNCTION net_salary(

    salary NUMERIC

)

RETURNS NUMERIC

AS $$

BEGIN

    RETURN salary +
           calculate_bonus(salary) -
           calculate_tax(salary);

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- PROCEDURE : ADD EMPLOYEE
-- =========================================================

CREATE PROCEDURE add_employee(

    p_emp_id INT,
    p_emp_name VARCHAR(100),
    p_department VARCHAR(50),
    p_salary NUMERIC,
    p_joining_date DATE

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
        p_salary,
        p_joining_date
    );

END;

$$;

-- =========================================================
-- PROCEDURE : UPDATE SALARY
-- =========================================================

CREATE PROCEDURE update_salary(

    p_emp_id INT,
    p_new_salary NUMERIC

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
-- PROCEDURE : TRANSFER DEPARTMENT
-- =========================================================

CREATE PROCEDURE transfer_department(

    p_emp_id INT,
    p_department VARCHAR(50)

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET department = p_department

    WHERE emp_id = p_emp_id;

END;

$$;

-- =========================================================
-- PROCEDURE : INCREASE ALL SALARIES
-- =========================================================

CREATE PROCEDURE increase_all_salaries(

    p_percent NUMERIC

)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET salary =
        salary +
        (salary * p_percent / 100);

END;

$$;

-- =========================================================
-- CALL PROCEDURES
-- =========================================================

CALL add_employee(
    106,
    'Deepika Gautam',
    'IT',
    80000,
    '2024-01-15'
);

CALL update_salary(
    101,
    70000
);

CALL transfer_department(
    102,
    'Finance'
);

CALL increase_all_salaries(5);

-- =========================================================
-- BONUS REPORT
-- =========================================================

SELECT
    emp_id,
    emp_name,
    salary,
    calculate_bonus(salary) AS bonus
FROM employees;

-- =========================================================
-- TAX REPORT
-- =========================================================

SELECT
    emp_id,
    emp_name,
    salary,
    calculate_tax(salary) AS tax
FROM employees;

-- =========================================================
-- NET SALARY REPORT
-- =========================================================

SELECT
    emp_id,
    emp_name,
    salary,
    net_salary(salary) AS final_salary
FROM employees;

-- =========================================================
-- DEPARTMENT REPORT
-- =========================================================

SELECT
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- =========================================================
-- COMPANY PAYROLL SUMMARY
-- =========================================================

SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary_expense,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;

-- =========================================================
-- END OF PROJECT
-- =========================================================