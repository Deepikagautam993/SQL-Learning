-- =========================================================
-- DAY 05 - FULL OUTER JOIN
-- =========================================================

-- =========================================================
-- FULL OUTER JOIN
-- Returns all rows from both tables
-- =========================================================

SELECT *
FROM employees e
FULL OUTER JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- Professional FULL JOIN Query
-- =========================================================

SELECT
    e.emp_name,
    d.department
FROM employees e
FULL OUTER JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- Find All Unmatched Records
-- =========================================================

SELECT
    e.emp_name,
    d.department
FROM employees e
FULL OUTER JOIN departments d
ON e.emp_id = d.emp_id
WHERE e.emp_id IS NULL
   OR d.emp_id IS NULL;

-- =========================================================
-- FULL JOIN + GROUP BY
-- =========================================================

SELECT
    d.department,
    COUNT(e.emp_name) AS total_employees
FROM employees e
FULL OUTER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;