-- =========================================================
-- DAY 10 PRACTICE QUESTIONS
-- VIEWS IN SQL
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees_data (

    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT

);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees_data
VALUES
(1, 'Aman', 'IT', 65000),
(2, 'Riya', 'HR', 45000),
(3, 'Karan', 'IT', 80000),
(4, 'Simran', 'Finance', 55000),
(5, 'Neha', 'IT', 90000),
(6, 'Rohit', 'Finance', 60000);



-- =========================================================
-- VIEW COMPLETE TABLE
-- =========================================================

SELECT *
FROM employees_data;



-- =========================================================
-- Q1. CREATE BASIC VIEW
-- =========================================================

CREATE VIEW it_employees AS

SELECT *
FROM employees_data
WHERE department = 'IT';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM it_employees;



-- =========================================================
-- Q2. CREATE VIEW WITH SPECIFIC COLUMNS
-- =========================================================

CREATE VIEW employee_salary AS

SELECT
    emp_name,
    salary

FROM employees_data;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM employee_salary;



-- =========================================================
-- Q3. CREATE CONDITIONAL VIEW
-- =========================================================

CREATE VIEW high_salary AS

SELECT *
FROM employees_data
WHERE salary > 70000;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM high_salary;



-- =========================================================
-- Q4. CREATE SECURITY VIEW
-- =========================================================

CREATE VIEW public_employee_data AS

SELECT
    emp_name,
    department

FROM employees_data;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM public_employee_data;



-- =========================================================
-- Q5. CREATE FINANCE VIEW
-- =========================================================

CREATE VIEW finance_department AS

SELECT
    emp_name,
    salary

FROM employees_data

WHERE department = 'Finance';



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM finance_department;



-- =========================================================
-- Q6. CREATE MULTIPLE CONDITIONS VIEW
-- =========================================================

CREATE VIEW senior_salary AS

SELECT
    emp_name,
    department,
    salary

FROM employees_data

WHERE department = 'IT'
AND salary > 70000;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM senior_salary;



-- =========================================================
-- Q7. CREATE KPI VIEW
-- =========================================================

CREATE VIEW department_kpi AS

SELECT
    department,

    COUNT(*) AS total_employees,

    MAX(salary) AS highest_salary,

    MIN(salary) AS lowest_salary,

    AVG(salary) AS average_salary

FROM employees_data

GROUP BY department;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM department_kpi;



-- =========================================================
-- Q8. UPDATE VIEW
-- =========================================================

CREATE OR REPLACE VIEW high_salary AS

SELECT
    emp_name,
    department,
    salary

FROM employees_data

WHERE salary > 65000;



-- =========================================================
-- ACCESS UPDATED VIEW
-- =========================================================

SELECT *
FROM high_salary;



-- =========================================================
-- Q9. DELETE VIEW
-- =========================================================

DROP VIEW finance_department;



-- =========================================================
-- Q10. BUSINESS REPORT VIEW
-- =========================================================

CREATE VIEW business_report AS

SELECT
    emp_name,
    department,

    CASE

        WHEN salary > 80000 THEN 'High Salary'
        WHEN salary > 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'

    END AS salary_category

FROM employees_data;



-- =========================================================
-- ACCESS VIEW
-- =========================================================

SELECT *
FROM business_report;



-- =========================================================
-- IMPORTANT INTERVIEW QUESTIONS
-- =========================================================
--
-- Q1. What is View?
--
-- Q2. Difference between:
-- View and Table
--
-- Q3. Why use Views?
--
-- Q4. What is CREATE VIEW?
--
-- Q5. What is CREATE OR REPLACE VIEW?
--
-- Q6. What is DROP VIEW?
--
-- Q7. How Views improve security?
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Power BI
-- - Tableau
-- - KPI dashboards
-- - HR analytics
-- - Financial reporting
-- - Business intelligence
--
-- =========================================================