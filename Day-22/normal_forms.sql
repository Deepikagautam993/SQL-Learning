-- ============================================================
-- DAY 22 - NORMALIZATION
-- FILE 2: NORMAL FORMS
-- ============================================================

-- ============================================================
-- FIRST NORMAL FORM (1NF)
-- ============================================================

/*

Definition:

A table is in First Normal Form (1NF)
if every column contains atomic values
and there are no repeating groups.

Rules:

1. One value per cell
2. No repeating columns
3. Atomic values only

*/

-- ============================================================
-- NOT IN 1NF
-- ============================================================

CREATE TABLE student_subjects_bad (

    student_id INT,
    student_name VARCHAR(50),
    subjects VARCHAR(100)

);

INSERT INTO student_subjects_bad VALUES
(101,'Aman','DBMS,OS,CN'),
(102,'Riya','DBMS,CN');

-- Problem:
-- Multiple subjects stored in one column

-- ============================================================
-- CONVERT TO 1NF
-- ============================================================

CREATE TABLE student_subjects (

    student_id INT,
    student_name VARCHAR(50),
    subject VARCHAR(50)

);

INSERT INTO student_subjects VALUES
(101,'Aman','DBMS'),
(101,'Aman','OS'),
(101,'Aman','CN'),
(102,'Riya','DBMS'),
(102,'Riya','CN');

-- Now each cell contains only one value

-- ============================================================
-- SECOND NORMAL FORM (2NF)
-- ============================================================

/*

Definition:

A table is in 2NF if:

1. It is already in 1NF
2. No Partial Dependency exists

Partial Dependency:

A non-key attribute depends on
part of a composite primary key.

*/

-- ============================================================
-- NOT IN 2NF
-- ============================================================

CREATE TABLE enrollment_bad (

    student_id INT,
    course_id VARCHAR(10),
    student_name VARCHAR(50),
    grade CHAR(1),

    PRIMARY KEY(student_id, course_id)

);

-- Functional Dependencies

/*
(student_id, course_id) -> grade

student_id -> student_name

Partial Dependency exists.
*/

-- ============================================================
-- CONVERT TO 2NF
-- ============================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);

CREATE TABLE enrollments (

    student_id INT,
    course_id VARCHAR(10),
    grade CHAR(1),

    PRIMARY KEY(student_id, course_id)

);

-- Partial Dependency removed

-- ============================================================
-- THIRD NORMAL FORM (3NF)
-- ============================================================

/*

Definition:

A table is in 3NF if:

1. It is in 2NF
2. No Transitive Dependency exists

*/

-- ============================================================
-- NOT IN 3NF
-- ============================================================

CREATE TABLE student_department_bad (

    student_id INT PRIMARY KEY,
    department_id VARCHAR(10),
    department_name VARCHAR(50)

);

-- Functional Dependencies

/*
student_id -> department_id

department_id -> department_name

Transitive Dependency exists
*/

-- ============================================================
-- CONVERT TO 3NF
-- ============================================================

CREATE TABLE departments (

    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(50)

);

CREATE TABLE students_department (

    student_id INT PRIMARY KEY,
    department_id VARCHAR(10)

);

-- Transitive Dependency removed

-- ============================================================
-- BOYCE CODD NORMAL FORM (BCNF)
-- ============================================================

/*

Definition:

A relation is in BCNF if
every determinant is a candidate key.

BCNF is stricter than 3NF.

*/

-- ============================================================
-- BCNF VIOLATION EXAMPLE
-- ============================================================

CREATE TABLE class_info (

    student_name VARCHAR(50),
    subject VARCHAR(50),
    teacher VARCHAR(50)

);

-- Functional Dependencies

/*
(Student, Subject) -> Teacher

Teacher -> Subject

Teacher is not a candidate key.

BCNF violated.
*/

-- ============================================================
-- CONVERT TO BCNF
-- ============================================================

CREATE TABLE teacher_subject (

    teacher VARCHAR(50) PRIMARY KEY,
    subject VARCHAR(50)

);

CREATE TABLE student_subject (

    student_name VARCHAR(50),
    subject VARCHAR(50)

);

-- BCNF achieved

-- ============================================================
-- DENORMALIZATION
-- ============================================================

/*

Definition:

Denormalization is the process
of intentionally adding redundancy
to improve read performance.

Used when:

✔ Queries are slow
✔ Too many joins exist
✔ Reporting systems require speed

*/

-- ============================================================
-- NORMALIZED STRUCTURE
-- ============================================================

CREATE TABLE customers (

    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)

);

CREATE TABLE orders (

    order_id INT PRIMARY KEY,
    customer_id INT,
    amount NUMERIC(10,2)

);

-- JOIN required

SELECT
    o.order_id,
    c.customer_name,
    o.amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

-- ============================================================
-- DENORMALIZED STRUCTURE
-- ============================================================

CREATE TABLE orders_report (

    order_id INT,
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    amount NUMERIC(10,2)

);

-- Faster reporting
-- No JOIN required

-- ============================================================
-- COMPARISON OF NORMAL FORMS
-- ============================================================

/*

1NF

Removes:
Repeating Groups

----------------------------------

2NF

Removes:
Partial Dependency

----------------------------------

3NF

Removes:
Transitive Dependency

----------------------------------

BCNF

Removes:
Determinant Not Being Candidate Key

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

1. What is 1NF?

2. What is 2NF?

3. What is Partial Dependency?

4. What is 3NF?

5. What is Transitive Dependency?

6. What is BCNF?

7. Difference between 3NF and BCNF?

8. What is Denormalization?

9. Advantages of Normalization?

10. Advantages of Denormalization?

*/

-- ============================================================
-- END OF FILE
-- ============================================================