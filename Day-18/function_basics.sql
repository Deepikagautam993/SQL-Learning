-- =========================================================
-- DAY 18
-- FILE 1 : FUNCTION BASICS
-- =========================================================

-- =========================================================
-- FUNCTION 1 : ADDITION
-- =========================================================

CREATE FUNCTION add_numbers(

    num1 INT,
    num2 INT

)

RETURNS INT

AS $$

BEGIN

    RETURN num1 + num2;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT add_numbers(10,20);

SELECT add_numbers(50,100);

-- =========================================================
-- FUNCTION 2 : MULTIPLICATION
-- =========================================================

CREATE FUNCTION multiply_numbers(

    num1 INT,
    num2 INT

)

RETURNS INT

AS $$

BEGIN

    RETURN num1 * num2;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT multiply_numbers(5,4);

SELECT multiply_numbers(12,3);

-- =========================================================
-- FUNCTION 3 : SQUARE NUMBER
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

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT square_number(5);

SELECT square_number(10);

-- =========================================================
-- FUNCTION 4 : CUBE NUMBER
-- =========================================================

CREATE FUNCTION cube_number(

    n INT

)

RETURNS INT

AS $$

BEGIN

    RETURN n * n * n;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT cube_number(3);

SELECT cube_number(4);

-- =========================================================
-- FUNCTION 5 : BONUS CALCULATOR
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

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT calculate_bonus(50000);

SELECT calculate_bonus(80000);

-- =========================================================
-- FUNCTION 6 : TEXT FUNCTION
-- =========================================================

CREATE FUNCTION welcome_message()

RETURNS TEXT

AS $$

BEGIN

    RETURN 'Welcome to PostgreSQL';

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT welcome_message();

-- =========================================================
-- CREATE EMPLOYEE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50)

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(1,'Aman','IT'),
(2,'Riya','HR'),
(3,'Karan','IT'),
(4,'Neha','Finance');

-- =========================================================
-- FUNCTION RETURNING TABLE
-- =========================================================

CREATE FUNCTION get_it_employees()

RETURNS TABLE (

    emp_id INT,
    emp_name VARCHAR,
    department VARCHAR

)

AS $$

BEGIN

    RETURN QUERY

    SELECT *
    FROM employees
    WHERE department = 'IT';

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL TABLE FUNCTION
-- =========================================================

SELECT *
FROM get_it_employees();

-- =========================================================
-- FUNCTION RETURNING EMPLOYEE COUNT
-- =========================================================

CREATE FUNCTION total_employees()

RETURNS INT

AS $$

DECLARE

    total_count INT;

BEGIN

    SELECT COUNT(*)
    INTO total_count
    FROM employees;

    RETURN total_count;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT total_employees();

-- =========================================================
-- END OF FILE
-- =========================================================