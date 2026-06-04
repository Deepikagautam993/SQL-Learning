-- =========================================================
-- DAY 17
-- FILE 1 : VIEW BASICS
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT

);

-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO employees
VALUES
(101,'Aman Sharma','IT',60000),
(102,'Riya Gupta','HR',45000),
(103,'Karan Singh','IT',75000),
(104,'Neha Verma','Finance',85000),
(105,'Rohit Patel','IT',95000);

-- =========================================================
-- CREATE SIMPLE VIEW
-- =========================================================

CREATE VIEW employee_basic_info AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;

-- =========================================================
-- USE VIEW
-- =========================================================

SELECT *
FROM employee_basic_info;

-- =========================================================
-- VIEW FOR IT EMPLOYEES
-- =========================================================

CREATE VIEW it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';

-- =========================================================
-- USE IT VIEW
-- =========================================================

SELECT *
FROM it_employees;

-- =========================================================
-- VIEW FOR HIGH SALARY EMPLOYEES
-- =========================================================

CREATE VIEW high_salary_employees AS

SELECT
    emp_id,
    emp_name,
    salary
FROM employees
WHERE salary > 70000;

-- =========================================================
-- USE HIGH SALARY VIEW
-- =========================================================

SELECT *
FROM high_salary_employees;

-- =========================================================
-- SECURITY EXAMPLE
-- =========================================================

CREATE VIEW employee_public_data AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;

-- Salary column hidden

SELECT *
FROM employee_public_data;

-- =========================================================
-- VIEW ALL VIEWS
-- =========================================================

SELECT *
FROM information_schema.views;

-- =========================================================
-- PRACTICE QUERIES
-- =========================================================

SELECT *
FROM employee_basic_info;

SELECT *
FROM it_employees;

SELECT *
FROM high_salary_employees;

-- =========================================================
-- END OF FILE
-- =========================================================