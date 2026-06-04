-- =========================================================
-- DAY 17 MINI PROJECT
-- EMPLOYEE REPORTING & ANALYTICS SYSTEM
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    joining_date DATE

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000,'2022-01-15'),
(102,'Riya Gupta','HR',45000,'2021-08-10'),
(103,'Karan Singh','IT',75000,'2023-02-20'),
(104,'Neha Verma','Finance',85000,'2020-05-12'),
(105,'Rohit Patel','IT',95000,'2019-07-25'),
(106,'Priya Jain','HR',55000,'2022-11-18'),
(107,'Arjun Mishra','Finance',72000,'2021-04-30');

-- =========================================================
-- SECURITY VIEW
-- =========================================================

CREATE VIEW employee_public_data AS

SELECT
    emp_id,
    emp_name,
    department,
    joining_date
FROM employees;

-- Salary hidden

-- =========================================================
-- IT EMPLOYEES VIEW
-- =========================================================

CREATE VIEW it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================================
-- HIGH SALARY VIEW
-- =========================================================

CREATE VIEW high_salary_employees AS

SELECT *
FROM employees
WHERE salary > 70000;

-- =========================================================
-- DEPARTMENT REPORT VIEW
-- =========================================================

CREATE VIEW department_report AS

SELECT
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- =========================================================
-- MATERIALIZED VIEW
-- COMPANY DASHBOARD
-- =========================================================

CREATE MATERIALIZED VIEW mv_company_dashboard AS

SELECT
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

-- =========================================================
-- VIEW DASHBOARD
-- =========================================================

SELECT *
FROM mv_company_dashboard;

-- =========================================================
-- NEW EMPLOYEE ADDED
-- =========================================================

INSERT INTO employees
VALUES
(108,'Deepika Gautam','IT',80000,'2024-01-15');

-- =========================================================
-- CHECK MATERIALIZED VIEW
-- =========================================================

SELECT *
FROM mv_company_dashboard;

-- Deepika not visible yet

-- =========================================================
-- REFRESH DASHBOARD
-- =========================================================

REFRESH MATERIALIZED VIEW mv_company_dashboard;

-- =========================================================
-- CHECK AGAIN
-- =========================================================

SELECT *
FROM mv_company_dashboard;

-- =========================================================
-- ANALYTICS QUERIES
-- =========================================================

-- Total Employees

SELECT COUNT(*)
FROM employees;

-- Average Salary

SELECT AVG(salary)
FROM employees;

-- Highest Salary

SELECT MAX(salary)
FROM employees;

-- Lowest Salary

SELECT MIN(salary)
FROM employees;

-- Department Wise Employee Count

SELECT
    department,
    COUNT(*)
FROM employees
GROUP BY department;

-- =========================================================
-- VIEW ALL VIEWS
-- =========================================================

SELECT *
FROM information_schema.views;

-- =========================================================
-- VIEW ALL MATERIALIZED VIEWS
-- =========================================================

SELECT *
FROM pg_matviews;

-- =========================================================
-- PROJECT REPORT QUERIES
-- =========================================================

SELECT *
FROM employee_public_data;

SELECT *
FROM it_employees;

SELECT *
FROM high_salary_employees;

SELECT *
FROM department_report;

SELECT *
FROM mv_company_dashboard;

-- =========================================================
-- END OF PROJECT
-- =========================================================