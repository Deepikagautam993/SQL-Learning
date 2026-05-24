-- =========================================================
-- DAY 06 - SUBQUERY PRACTICE QUERIES
-- =========================================================

-- =========================================================
-- Find Employees with Maximum Salary
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- =========================================================
-- Find Employees Earning More Than Average Salary
-- =========================================================

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- =========================================================
-- Find Employees in Same Department as Rahul
-- =========================================================

SELECT emp_name, department
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE emp_name = 'Rahul'
);

-- =========================================================
-- Find Employees from Departments Having Salary > 70000
-- =========================================================

SELECT emp_name, department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 70000
);

-- =========================================================
-- Find Department-wise Highest Salary Employees
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- =========================================================
-- Find Department-wise Lowest Salary Employees
-- =========================================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MIN(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);