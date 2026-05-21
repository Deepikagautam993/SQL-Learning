-- =========================================
-- DAY 03 - LIMIT PRACTICE
-- =========================================

-- =========================================
-- Display First 3 Employees
-- =========================================

SELECT *
FROM employees
LIMIT 3;

-- =========================================
-- Display First 5 Employees
-- =========================================

SELECT *
FROM employees
LIMIT 5;

-- =========================================
-- Top 3 Highest Salary Employees
-- =========================================

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- =========================================
-- Highest Salary Employee
-- =========================================

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- =========================================
-- Lowest Salary Employee
-- =========================================

SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 1;

-- =========================================
-- Top 2 Employees from IT Department
-- =========================================

SELECT *
FROM employees
WHERE department = 'IT'
LIMIT 2;