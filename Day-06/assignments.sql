-- =========================================================
-- DAY 06 ASSIGNMENTS
-- SUBQUERIES
-- =========================================================

-- 1. Find employee with highest salary

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- =========================================================

-- 2. Find employee with lowest salary

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- =========================================================

-- 3. Find employees earning above average salary

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- =========================================================

-- 4. Find employees earning below average salary

SELECT emp_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);

-- =========================================================

-- 5. Find employees in same department as Simran

SELECT emp_name, department
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE emp_name = 'Simran'
);

-- =========================================================

-- 6. Find employees working in departments with salary > 70000

SELECT emp_name, department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 70000
);

-- =========================================================

-- 7. Find department-wise highest salary employees

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- =========================================================

-- 8. Find department-wise lowest salary employees

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MIN(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);