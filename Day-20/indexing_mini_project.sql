-- ============================================================
-- DAY 20 - INDEXING & QUERY OPTIMIZATION
-- FILE 6: MINI PROJECT
-- EMPLOYEE MANAGEMENT SYSTEM
-- ============================================================

-- ============================================================
-- PROJECT OVERVIEW
-- ============================================================

/*

PROJECT NAME:
Employee Management System

OBJECTIVE:

Learn how indexing improves query
performance in real-world applications.

In this project we will:

✔ Create employee database
✔ Create multiple indexes
✔ Optimize search queries
✔ Use EXPLAIN
✔ Use EXPLAIN ANALYZE
✔ Compare query performance

Real-world Similar Systems:

- HR Management Systems
- Employee Portals
- ERP Software
- Payroll Applications
- University Staff Systems

*/

-- ============================================================
-- STEP 1: CREATE TABLE
-- ============================================================

CREATE TABLE employees (

    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    designation VARCHAR(50),
    salary NUMERIC(10,2),
    joining_date DATE

);

-- ============================================================
-- STEP 2: INSERT SAMPLE DATA
-- ============================================================

INSERT INTO employees VALUES
(101,'Aman','aman@gmail.com','IT','Developer',50000,'2022-01-10'),
(102,'Riya','riya@gmail.com','HR','HR Executive',45000,'2021-05-15'),
(103,'Neha','neha@gmail.com','IT','Senior Developer',70000,'2020-03-12'),
(104,'Karan','karan@gmail.com','Finance','Accountant',55000,'2021-08-22'),
(105,'Ankit','ankit@gmail.com','Marketing','Marketing Executive',48000,'2023-02-05');

-- ============================================================
-- VIEW DATA
-- ============================================================

SELECT *
FROM employees;

-- ============================================================
-- PROJECT SCENARIO 1
-- SEARCH EMPLOYEE BY NAME
-- ============================================================

/*

Without index,
large tables require sequential scanning.

*/

EXPLAIN
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- Create Index

CREATE INDEX idx_employee_name
ON employees(employee_name);

EXPLAIN
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- PROJECT SCENARIO 2
-- SEARCH BY EMAIL
-- ============================================================

/*

Emails should be unique.

*/

CREATE UNIQUE INDEX idx_email
ON employees(email);

SELECT *
FROM employees
WHERE email = 'aman@gmail.com';

-- ============================================================
-- PROJECT SCENARIO 3
-- DEPARTMENT + SALARY SEARCH
-- ============================================================

/*

Frequently used in HR reports.

*/

CREATE INDEX idx_dept_salary
ON employees(department, salary);

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;

-- ============================================================
-- PROJECT SCENARIO 4
-- HIGH SALARY EMPLOYEES
-- ============================================================

/*

Management often views
high-salary employees.

*/

CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 60000;

SELECT *
FROM employees
WHERE salary > 60000;

-- ============================================================
-- PROJECT SCENARIO 5
-- CASE INSENSITIVE SEARCH
-- ============================================================

/*

User may type:

aman
AMAN
Aman

*/

CREATE INDEX idx_lower_name
ON employees(LOWER(employee_name));

SELECT *
FROM employees
WHERE LOWER(employee_name) = 'aman';

-- ============================================================
-- PROJECT SCENARIO 6
-- SORT EMPLOYEES
-- ============================================================

CREATE INDEX idx_salary_sort
ON employees(salary);

SELECT *
FROM employees
ORDER BY salary;

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary;

-- ============================================================
-- PROJECT SCENARIO 7
-- JOIN OPTIMIZATION
-- ============================================================

CREATE TABLE departments (

    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)

);

INSERT INTO departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing');

/*

Join columns are commonly indexed
for better performance.

*/

-- ============================================================
-- PROJECT SCENARIO 8
-- PERFORMANCE COMPARISON
-- ============================================================

/*

Step 1

Run query without index.

Observe execution plan.

-----------------------------------

Step 2

Create index.

-----------------------------------

Step 3

Run EXPLAIN ANALYZE again.

Compare results.

*/

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE employee_name = 'Neha';

-- ============================================================
-- REPORT QUERIES
-- ============================================================

-- All Employees

SELECT *
FROM employees;

-- Employees in IT Department

SELECT *
FROM employees
WHERE department = 'IT';

-- Highest Salary Employee

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- Average Salary

SELECT AVG(salary)
AS average_salary
FROM employees;

-- Employee Count

SELECT COUNT(*)
AS total_employees
FROM employees;

-- ============================================================
-- INDEX MONITORING
-- ============================================================

SELECT *
FROM pg_indexes
WHERE tablename = 'employees';

-- ============================================================
-- BUSINESS REQUIREMENTS
-- ============================================================

/*

Requirement 1

Search employee by email quickly.

Solution:

Unique Index

-----------------------------------

Requirement 2

Search employees by department.

Solution:

B-Tree Index

-----------------------------------

Requirement 3

Case-insensitive name search.

Solution:

Expression Index

-----------------------------------

Requirement 4

Department + Salary filtering.

Solution:

Composite Index

-----------------------------------

Requirement 5

High salary reports.

Solution:

Partial Index

*/

-- ============================================================
-- MINI PROJECT QUESTIONS
-- ============================================================

/*

Q1.

Create index on designation.

-----------------------------------

Q2.

Create composite index on:

department
designation

-----------------------------------

Q3.

Create partial index:

salary > 50000

-----------------------------------

Q4.

Create expression index using:

UPPER(employee_name)

-----------------------------------

Q5.

Use EXPLAIN ANALYZE
for salary search.

-----------------------------------

Q6.

Find all employees
earning above 55000.

-----------------------------------

Q7.

Find average salary.

-----------------------------------

Q8.

Display all indexes.

-----------------------------------

Q9.

Explain performance benefits
of indexing.

-----------------------------------

Q10.

Compare Sequential Scan
and Index Scan.

*/

-- ============================================================
-- PROJECT LEARNING OUTCOMES
-- ============================================================

/*

After completing this project,
you should understand:

✔ Index Creation

✔ B-Tree Index

✔ Unique Index

✔ Composite Index

✔ Partial Index

✔ Expression Index

✔ EXPLAIN

✔ EXPLAIN ANALYZE

✔ Query Optimization

✔ Performance Tuning

✔ Real-world Search Optimization

*/

-- ============================================================
-- INTERVIEW PREPARATION
-- ============================================================

/*

1. What is indexing?

2. Why is indexing important?

3. What is B-Tree Index?

4. What is Composite Index?

5. What is Partial Index?

6. What is Expression Index?

7. What is EXPLAIN?

8. What is EXPLAIN ANALYZE?

9. What is Query Optimization?

10. Difference between
    Sequential Scan and Index Scan.

*/

-- ============================================================
-- END OF MINI PROJECT
-- ============================================================