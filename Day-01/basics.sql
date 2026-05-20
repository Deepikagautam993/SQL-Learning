-- =========================================
-- SQL BASICS - DAY 01
-- Introduction to Database and Tables
-- =========================================

-- =========================================
-- Create Database
-- =========================================

CREATE DATABASE company_db;

-- =========================================
-- Create Students Table
-- =========================================

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

-- =========================================
-- Insert Student Records
-- =========================================

INSERT INTO students
VALUES
(1, 'Deepika', 'Jabalpur', 90),
(2, 'Aman', 'Delhi', 75),
(3, 'Riya', 'Mumbai', 88),
(4, 'Kunal', 'Pune', 67),
(5, 'Simran', 'Indore', 95);

-- =========================================
-- View Complete Table
-- =========================================

SELECT * FROM students;

-- =========================================
-- View Specific Columns
-- =========================================

SELECT name, city
FROM students;

-- =========================================
-- Create Employees Table
-- =========================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- =========================================
-- Insert Employee Records
-- =========================================

INSERT INTO employees
VALUES
(101, 'Rahul', 'HR', 40000),
(102, 'Ankit', 'AI', 75000),
(103, 'Sneha', 'IT', 68000),
(104, 'Priya', 'Finance', 55000);

-- =========================================
-- Display Employee Records
-- =========================================

SELECT * FROM employees;

-- =========================================
-- Display Employee Names Only
-- =========================================

SELECT emp_name
FROM employees;