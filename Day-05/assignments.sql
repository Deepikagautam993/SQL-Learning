-- =========================================================
-- DAY 05 ASSIGNMENTS
-- SQL JOINS
-- =========================================================

-- 1. Show employee names with departments

SELECT
    e.emp_name,
    d.department
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id;

-- =========================================================

-- 2. Show employees with salary greater than 50000

SELECT
    e.emp_name,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
WHERE d.salary > 50000;

-- =========================================================

-- 3. Find employees without departments

SELECT
    e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.emp_id = d.emp_id
WHERE d.department IS NULL;

-- =========================================================

-- 4. Find departments without employees

SELECT
    d.department
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.emp_id
WHERE e.emp_name IS NULL;

-- =========================================================

-- 5. Count employees department-wise

SELECT
    d.department,
    COUNT(*) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;

-- =========================================================

-- 6. Find average salary department-wise

SELECT
    d.department,
    AVG(d.salary) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;

-- =========================================================

-- 7. Find highest paid employee

SELECT
    e.emp_name,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
ORDER BY d.salary DESC
LIMIT 1;

-- =========================================================

-- 8. Find unmatched records from both tables

SELECT
    e.emp_name,
    d.department
FROM employees e
FULL OUTER JOIN departments d
ON e.emp_id = d.emp_id
WHERE e.emp_id IS NULL
   OR d.emp_id IS NULL;