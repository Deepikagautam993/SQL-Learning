-- =========================================================
-- DAY 15 - DYNAMIC SQL PRACTICE QUESTIONS
-- =========================================================

-- =========================================================
-- Q1: Dynamic SELECT all records
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees';

    EXECUTE query;

END $$;



-- =========================================================
-- Q2: Get current timestamp dynamically
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT now()';

    EXECUTE query;

END $$;



-- =========================================================
-- Q3: Insert new employee dynamically
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'INSERT INTO employees VALUES (5, ''Rohit'', 90000)';

    EXECUTE query;

END $$;



-- =========================================================
-- Q4: Update salary dynamically
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'UPDATE employees SET salary = 100000 WHERE emp_id = 2';

    EXECUTE query;

END $$;



-- =========================================================
-- Q5: Delete employee dynamically
-- =========================================================

DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'DELETE FROM employees WHERE emp_id = 4';

    EXECUTE query;

END $$;



-- =========================================================
-- Q6: Select employees with condition
-- =========================================================

DO $$

DECLARE
    emp_id INT := 1;
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees WHERE emp_id = ' || emp_id;

    EXECUTE query;

END $$;



-- =========================================================
-- Q7: Dynamic salary filter
-- =========================================================

DO $$

DECLARE
    sal INT := 60000;
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees WHERE salary >= ' || sal;

    EXECUTE query;

END $$;



-- =========================================================
-- Q8: Dynamic table select
-- =========================================================

DO $$

DECLARE
    table_name TEXT := 'employees';
    query TEXT;
BEGIN

    query := 'SELECT * FROM ' || table_name;

    EXECUTE query;

END $$;



-- =========================================================
-- IMPORTANT PRACTICE POINTS
-- =========================================================

-- EXECUTE runs dynamic query
-- TEXT stores query
-- || joins strings
-- variables inject values

-- =========================================================
-- REAL WORLD USE
-- =========================================================

-- Admin panel filters
-- Search systems
-- Reports generation
-- Dynamic dashboards

-- =========================================================
-- END OF PRACTICE FILE
-- =========================================================