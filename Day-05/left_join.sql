-- =========================================================
-- DAY 05 - LEFT JOIN
-- =========================================================

-- =========================================================
-- LEFT JOIN
-- Returns all LEFT table rows
-- =========================================================

SELECT *
FROM employees e
LEFT JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- Professional LEFT JOIN Query
-- =========================================================

SELECT
    e.emp_name,
    d.department
FROM employees e
LEFT JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- Find Employees Without Departments
-- =========================================================

SELECT
    e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.emp_id = d.emp_id
WHERE d.department IS NULL;

-- =========================================================
-- LEFT JOIN + GROUP BY
-- =========================================================

SELECT
    d.department,
    COUNT(*) AS total_employees
FROM employees e
LEFT JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;

-- =========================================================
-- LEFT JOIN + ORDER BY
-- =========================================================

SELECT
    e.emp_name,
    d.department
FROM employees e
LEFT JOIN departments d
ON e.emp_id = d.emp_id
ORDER BY e.emp_name;