-- =========================================================
-- DAY 18
-- FILE 4 : ASSIGNMENTS WITH SOLUTIONS
-- =========================================================

-- =========================================================
-- CREATE SAMPLE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000),
(102,'Riya Gupta','HR',45000),
(103,'Karan Singh','IT',75000),
(104,'Neha Verma','Finance',85000);

-- =========================================================
-- ASSIGNMENT 1
-- CREATE ADDITION FUNCTION
-- =========================================================

-- Question:
-- Create a function that adds two numbers.

CREATE FUNCTION add_numbers(

    a INT,
    b INT

)

RETURNS INT

AS $$

BEGIN

    RETURN a + b;

END;

$$ LANGUAGE plpgsql;

SELECT add_numbers(10,20);

-- =========================================================
-- ASSIGNMENT 2
-- CREATE SQUARE FUNCTION
-- =========================================================

CREATE FUNCTION square_number(

    n INT

)

RETURNS INT

AS $$

BEGIN

    RETURN n * n;

END;

$$ LANGUAGE plpgsql;

SELECT square_number(5);

-- =========================================================
-- ASSIGNMENT 3
-- CREATE BONUS FUNCTION
-- =========================================================

CREATE FUNCTION calculate_bonus(

    salary INT

)

RETURNS INT

AS $$

BEGIN

    RETURN salary * 10 / 100;

END;

$$ LANGUAGE plpgsql;

SELECT calculate_bonus(50000);

-- =========================================================
-- ASSIGNMENT 4
-- DEFAULT PARAMETER
-- =========================================================

CREATE FUNCTION welcome_message(

    user_name TEXT DEFAULT 'Guest'

)

RETURNS TEXT

AS $$

BEGIN

    RETURN 'Welcome ' || user_name;

END;

$$ LANGUAGE plpgsql;

SELECT welcome_message();

SELECT welcome_message('Deepika');

-- =========================================================
-- ASSIGNMENT 5
-- OUT PARAMETER
-- =========================================================

CREATE FUNCTION employee_bonus(

    salary INT,
    OUT bonus INT

)

AS $$

BEGIN

    bonus := salary * 15 / 100;

END;

$$ LANGUAGE plpgsql;

SELECT *
FROM employee_bonus(60000);

-- =========================================================
-- ASSIGNMENT 6
-- INOUT PARAMETER
-- =========================================================

CREATE FUNCTION increase_salary(

    INOUT salary INT

)

AS $$

BEGIN

    salary := salary + 5000;

END;

$$ LANGUAGE plpgsql;

SELECT *
FROM increase_salary(50000);

-- =========================================================
-- ASSIGNMENT 7
-- PROCEDURE TO INSERT EMPLOYEE
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

CALL add_employee(
    105,
    'Priya Jain',
    'HR',
    55000
);

SELECT *
FROM employees;

-- =========================================================
-- ASSIGNMENT 8
-- PROCEDURE TO UPDATE SALARY
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

CALL update_salary(
    101,
    70000
);

SELECT *
FROM employees;

-- =========================================================
-- ASSIGNMENT 9
-- PROCEDURE TO DELETE EMPLOYEE
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

CALL delete_employee(102);

SELECT *
FROM employees;

-- =========================================================
-- ASSIGNMENT 10
-- FUNCTION RETURNING TABLE
-- =========================================================

CREATE FUNCTION get_it_employees()

RETURNS TABLE (

    emp_id INT,
    emp_name VARCHAR,
    department VARCHAR,
    salary INT

)

AS $$

BEGIN

    RETURN QUERY

    SELECT *
    FROM employees
    WHERE department = 'IT';

END;

$$ LANGUAGE plpgsql;

SELECT *
FROM get_it_employees();

-- =========================================================
-- THEORY QUESTIONS
-- =========================================================

-- Q1. What is a Function?
-- Answer:
-- A reusable block of code that
-- performs a task and returns a value.

-- ---------------------------------------------------------

-- Q2. What is a Procedure?
-- Answer:
-- A reusable block of code used
-- to perform actions.

-- ---------------------------------------------------------

-- Q3. Which command executes a Function?
-- Answer:
-- SELECT

-- ---------------------------------------------------------

-- Q4. Which command executes a Procedure?
-- Answer:
-- CALL

-- ---------------------------------------------------------

-- Q5. Which parameter is input only?
-- Answer:
-- IN

-- ---------------------------------------------------------

-- Q6. Which parameter is output only?
-- Answer:
-- OUT

-- ---------------------------------------------------------

-- Q7. Which parameter is input and output?
-- Answer:
-- INOUT

-- ---------------------------------------------------------

-- Q8. Which parameter provides a default value?
-- Answer:
-- DEFAULT

-- =========================================================
-- INTERVIEW QUESTIONS
-- =========================================================

-- Q1. Difference between Function and Procedure?

-- Function:
-- Returns value
-- Uses SELECT

-- Procedure:
-- Performs action
-- Uses CALL

-- ---------------------------------------------------------

-- Q2. Can a Function return a table?

-- Answer:
-- Yes

-- Using:
-- RETURNS TABLE(...)

-- ---------------------------------------------------------

-- Q3. Is RETURNS mandatory in Function?

-- Answer:
-- Yes

-- ---------------------------------------------------------

-- Q4. Is RETURNS mandatory in Procedure?

-- Answer:
-- No

-- ---------------------------------------------------------

-- Q5. Which is preferred for INSERT operations?

-- Answer:
-- Procedure

-- =========================================================
-- PRACTICE TASKS
-- =========================================================

-- TASK 1
-- Create a cube function

CREATE FUNCTION cube_number(
    n INT
)
RETURNS INT
AS $$
BEGIN
    RETURN n*n*n;
END;
$$ LANGUAGE plpgsql;

-- ---------------------------------------------------------

-- TASK 2
-- Create tax calculation function

CREATE FUNCTION calculate_tax(
    income INT
)
RETURNS NUMERIC
AS $$
BEGIN
    RETURN income * 0.10;
END;
$$ LANGUAGE plpgsql;

-- ---------------------------------------------------------

-- TASK 3
-- Create procedure to transfer department

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

-- ---------------------------------------------------------

-- TASK 4
-- Create procedure to increase salary
-- of all employees by 5%

CREATE PROCEDURE increase_all_salaries()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET salary = salary + (salary*5/100);
END;
$$;

-- =========================================================
-- END OF FILE
-- =========================================================