-- ============================================================
-- DAY 22 - NORMALIZATION
-- FILE 4: NORMALIZATION ASSIGNMENT WITH SOLUTIONS
-- ============================================================

-- ============================================================
-- ASSIGNMENT 1 : CHECK 1NF
-- ============================================================

CREATE TABLE student_subjects (

    student_id INT,
    student_name VARCHAR(50),
    subjects VARCHAR(100)

);

INSERT INTO student_subjects VALUES
(101,'Aman','DBMS,OS,CN'),
(102,'Riya','DBMS,CN');

-- Question:
-- Is the table in 1NF?

-- Answer:
-- NO

-- Reason:
-- Multiple values exist in the subjects column.

-- ============================================================
-- SOLUTION FOR 1NF
-- ============================================================

CREATE TABLE student_subjects_1nf (

    student_id INT,
    student_name VARCHAR(50),
    subject VARCHAR(50)

);

INSERT INTO student_subjects_1nf VALUES
(101,'Aman','DBMS'),
(101,'Aman','OS'),
(101,'Aman','CN'),
(102,'Riya','DBMS'),
(102,'Riya','CN');

SELECT * FROM student_subjects_1nf;

-- ============================================================
-- ASSIGNMENT 2 : IDENTIFY PARTIAL DEPENDENCY
-- ============================================================

CREATE TABLE enrollment (

    student_id INT,
    course_id VARCHAR(10),
    student_name VARCHAR(50),
    grade CHAR(1),

    PRIMARY KEY(student_id, course_id)

);

INSERT INTO enrollment VALUES
(101,'C101','Aman','A'),
(101,'C102','Aman','B'),
(102,'C101','Riya','A');

-- Question:
-- Identify Partial Dependency.

-- Answer:
-- student_id -> student_name

-- Table is NOT in 2NF.

-- ============================================================
-- SOLUTION FOR 2NF
-- ============================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);

INSERT INTO students VALUES
(101,'Aman'),
(102,'Riya');

CREATE TABLE enrollments (

    student_id INT,
    course_id VARCHAR(10),
    grade CHAR(1),

    PRIMARY KEY(student_id, course_id)

);

INSERT INTO enrollments VALUES
(101,'C101','A'),
(101,'C102','B'),
(102,'C101','A');

SELECT * FROM students;
SELECT * FROM enrollments;

-- ============================================================
-- ASSIGNMENT 3 : IDENTIFY TRANSITIVE DEPENDENCY
-- ============================================================

CREATE TABLE employee_department (

    employee_id INT PRIMARY KEY,
    department_id VARCHAR(10),
    department_name VARCHAR(50)

);

INSERT INTO employee_department VALUES
(1,'D1','IT'),
(2,'D2','HR'),
(3,'D1','IT');

-- Question:
-- Identify Transitive Dependency.

-- Answer:

-- employee_id -> department_id
-- department_id -> department_name

-- Table is NOT in 3NF.

-- ============================================================
-- SOLUTION FOR 3NF
-- ============================================================

CREATE TABLE departments (

    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(50)

);

INSERT INTO departments VALUES
('D1','IT'),
('D2','HR');

CREATE TABLE employees (

    employee_id INT PRIMARY KEY,
    department_id VARCHAR(10)

);

INSERT INTO employees VALUES
(1,'D1'),
(2,'D2'),
(3,'D1');

SELECT * FROM departments;
SELECT * FROM employees;

-- ============================================================
-- ASSIGNMENT 4 : BCNF VIOLATION
-- ============================================================

CREATE TABLE class_info (

    student_name VARCHAR(50),
    subject VARCHAR(50),
    teacher VARCHAR(50)

);

INSERT INTO class_info VALUES
('Aman','DBMS','Sharma'),
('Riya','DBMS','Sharma'),
('Neha','CN','Verma');

-- Functional Dependencies:

-- (Student, Subject) -> Teacher
-- Teacher -> Subject

-- Question:
-- Is BCNF satisfied?

-- Answer:
-- NO

-- Teacher is not a Candidate Key.

-- ============================================================
-- SOLUTION FOR BCNF
-- ============================================================

CREATE TABLE teacher_subject (

    teacher VARCHAR(50) PRIMARY KEY,
    subject VARCHAR(50)

);

INSERT INTO teacher_subject VALUES
('Sharma','DBMS'),
('Verma','CN');

CREATE TABLE student_subject (

    student_name VARCHAR(50),
    subject VARCHAR(50)

);

INSERT INTO student_subject VALUES
('Aman','DBMS'),
('Riya','DBMS'),
('Neha','CN');

SELECT * FROM teacher_subject;
SELECT * FROM student_subject;

-- ============================================================
-- ASSIGNMENT 5 : DENORMALIZATION
-- ============================================================

CREATE TABLE customers (

    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)

);

INSERT INTO customers VALUES
(101,'Aman','Jabalpur'),
(102,'Riya','Bhopal');

CREATE TABLE orders (

    order_id INT PRIMARY KEY,
    customer_id INT,
    amount NUMERIC(10,2)

);

INSERT INTO orders VALUES
(1,101,5000),
(2,102,3000);

-- Normalized Query

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

-- ============================================================
-- DENORMALIZED TABLE
-- ============================================================

CREATE TABLE orders_report (

    order_id INT,
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    amount NUMERIC(10,2)

);

INSERT INTO orders_report VALUES
(1,101,'Aman','Jabalpur',5000),
(2,102,'Riya','Bhopal',3000);

SELECT * FROM orders_report;

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

1. What is Normalization?

2. What is Functional Dependency?

3. What is 1NF?

4. What is 2NF?

5. What is 3NF?

6. What is BCNF?

7. Difference between 3NF and BCNF?

8. What is Partial Dependency?

9. What is Transitive Dependency?

10. What is Denormalization?

*/

-- ============================================================
-- QUICK REVISION
-- ============================================================

/*

1NF  -> Removes Repeating Groups

2NF  -> Removes Partial Dependency

3NF  -> Removes Transitive Dependency

BCNF -> Every Determinant Must Be Candidate Key

Denormalization -> Improves Read Performance

*/

-- ============================================================
-- END OF FILE
-- ============================================================