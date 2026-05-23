-- =========================================================
-- DAY 05 - JOIN PRACTICE QUERIES
-- =========================================================

-- =========================================================
-- INNER JOIN + GROUP BY
-- =========================================================

SELECT
    d.department,
    COUNT(*) AS total_employees,
    AVG(d.salary) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;

-- =========================================================
-- INNER JOIN + HAVING
-- =========================================================

SELECT
    d.department,
    AVG(d.salary) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department
HAVING AVG(d.salary) > 50000;

-- =========================================================
-- Highest Salary Employee
-- =========================================================

SELECT
    e.emp_name,
    d.salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
ORDER BY d.salary DESC
LIMIT 1;

-- =========================================================
-- Total Employees by Department
-- =========================================================

SELECT
    d.department,
    COUNT(*) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;

-- =========================================================
-- Average Salary by Department
-- =========================================================

SELECT
    d.department,
    AVG(d.salary) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.emp_id = d.emp_id
GROUP BY d.department;