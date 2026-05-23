-- =========================================================
-- DAY 05 - RIGHT JOIN
-- =========================================================

-- =========================================================
-- RIGHT JOIN
-- Returns all RIGHT table rows
-- =========================================================

SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- Professional RIGHT JOIN Query
-- =========================================================

SELECT
    e.emp_name,
    d.department
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================
-- Find Departments Without Employees
-- =========================================================

SELECT
    d.department
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.emp_id
WHERE e.emp_name IS NULL;

-- =========================================================
-- RIGHT JOIN + GROUP BY
-- =========================================================

SELECT
    d.department,
    COUNT(e.emp_name) AS employee_count
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;

-- =========================================================
-- RIGHT JOIN + ORDER BY
-- =========================================================

SELECT
    e.emp_name,
    d.department
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.emp_id
ORDER BY d.department;