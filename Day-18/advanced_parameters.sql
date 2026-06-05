-- =========================================================
-- DAY 18
-- FILE 3 : ADVANCED PARAMETERS
-- =========================================================

-- =========================================================
-- IN PARAMETER EXAMPLE
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
-- OUT PARAMETER EXAMPLE
-- =========================================================

CREATE FUNCTION calculate_bonus(

    salary INT,
    OUT bonus INT

)

AS $$

BEGIN

    bonus := salary * 10 / 100;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT *
FROM calculate_bonus(50000);

SELECT *
FROM calculate_bonus(80000);

-- =========================================================
-- INOUT PARAMETER EXAMPLE
-- =========================================================

CREATE FUNCTION increase_salary(

    INOUT salary INT

)

AS $$

BEGIN

    salary := salary + 5000;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT *
FROM increase_salary(50000);

SELECT *
FROM increase_salary(70000);

-- =========================================================
-- DEFAULT PARAMETER EXAMPLE
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

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT welcome_message();

SELECT welcome_message('Deepika');

SELECT welcome_message('Aman');

-- =========================================================
-- MULTIPLE PARAMETERS
-- =========================================================

CREATE FUNCTION calculate_total_salary(

    basic_salary INT,
    hra INT,
    bonus INT

)

RETURNS INT

AS $$

BEGIN

    RETURN basic_salary + hra + bonus;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT calculate_total_salary(
    50000,
    10000,
    5000
);

-- =========================================================
-- TAX CALCULATION FUNCTION
-- =========================================================

CREATE FUNCTION calculate_tax(

    income INT

)

RETURNS NUMERIC

AS $$

BEGIN

    RETURN income * 0.10;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT calculate_tax(50000);

SELECT calculate_tax(100000);

-- =========================================================
-- EMPLOYEE PROMOTION FUNCTION
-- =========================================================

CREATE FUNCTION promoted_salary(

    current_salary INT,
    increment_percent INT

)

RETURNS NUMERIC

AS $$

BEGIN

    RETURN current_salary +
           (current_salary * increment_percent / 100.0);

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT promoted_salary(
    50000,
    20
);

SELECT promoted_salary(
    80000,
    15
);

-- =========================================================
-- OUT PARAMETERS WITH MULTIPLE VALUES
-- =========================================================

CREATE FUNCTION employee_statistics(

    OUT total_employees INT,
    OUT average_salary NUMERIC

)

AS $$

BEGIN

    total_employees := 100;
    average_salary := 65000;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT *
FROM employee_statistics();

-- =========================================================
-- DEFAULT + IN PARAMETER
-- =========================================================

CREATE FUNCTION company_greeting(

    employee_name TEXT,
    company_name TEXT DEFAULT 'ABC Technologies'

)

RETURNS TEXT

AS $$

BEGIN

    RETURN 'Welcome '
           || employee_name
           || ' to '
           || company_name;

END;

$$ LANGUAGE plpgsql;

-- =========================================================
-- CALL FUNCTION
-- =========================================================

SELECT company_greeting('Deepika');

SELECT company_greeting(
    'Deepika',
    'OpenAI'
);

-- =========================================================
-- END OF FILE
-- =========================================================