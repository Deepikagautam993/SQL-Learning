-- ============================================================
-- DAY 22 - NORMALIZATION
-- FILE 3: NORMALIZATION PRACTICE
-- ============================================================

-- ============================================================
-- OBJECTIVE
-- ============================================================

/*

This file contains practice exercises
to strengthen your understanding of:

✔ Functional Dependency

✔ 1NF

✔ 2NF

✔ 3NF

✔ BCNF

✔ Denormalization

Try solving each problem yourself
before checking the solution.

*/

-- ============================================================
-- PRACTICE 1
-- IDENTIFY FUNCTIONAL DEPENDENCIES
-- ============================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50)

);

/*

Question:

Identify Functional Dependencies.

Expected Answer:

student_id -> student_name

student_id -> city

*/

-- ============================================================
-- PRACTICE 2
-- CHECK WHETHER TABLE IS IN 1NF
-- ============================================================

CREATE TABLE student_skills (

    student_id INT,
    student_name VARCHAR(50),
    skills VARCHAR(100)

);

INSERT INTO student_skills VALUES
(101,'Aman','Python,Java,C++'),
(102,'Riya','Python,SQL');

/*

Question:

Is this table in 1NF?

Answer:

NO

Reason:

Multiple values stored
inside one column.

*/

-- ============================================================
-- SOLUTION
-- ============================================================

CREATE TABLE student_skills_1nf (

    student_id INT,
    student_name VARCHAR(50),
    skill VARCHAR(50)

);

INSERT INTO student_skills_1nf VALUES
(101,'Aman','Python'),
(101,'Aman','Java'),
(101,'Aman','C++'),
(102,'Riya','Python'),
(102,'Riya','SQL');

-- ============================================================
-- PRACTICE 3
-- IDENTIFY PARTIAL DEPENDENCY
-- ============================================================

CREATE TABLE course_enrollment (

    student_id INT,
    course_id VARCHAR(10),
    student_name VARCHAR(50),
    grade CHAR(1),

    PRIMARY KEY(student_id, course_id)

);

/*

Question:

Find Partial Dependency.

Answer:

student_id -> student_name

Reason:

student_name depends
only on student_id.

*/

-- ============================================================
-- PRACTICE 4
-- CONVERT TO 2NF
-- ============================================================

/*

Original Table:

(student_id,
 course_id,
 student_name,
 grade)

Primary Key:

(student_id, course_id)

*/

-- Students Table

CREATE TABLE students_2nf (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);

-- Enrollment Table

CREATE TABLE enrollment_2nf (

    student_id INT,
    course_id VARCHAR(10),
    grade CHAR(1),

    PRIMARY KEY(student_id, course_id)

);

-- ============================================================
-- PRACTICE 5
-- IDENTIFY TRANSITIVE DEPENDENCY
-- ============================================================

CREATE TABLE employee_department (

    employee_id INT PRIMARY KEY,
    department_id VARCHAR(10),
    department_name VARCHAR(50)

);

/*

Question:

Find Transitive Dependency.

Answer:

employee_id -> department_id

department_id -> department_name

Transitive Dependency Exists.

*/

-- ============================================================
-- PRACTICE 6
-- CONVERT TO 3NF
-- ============================================================

CREATE TABLE departments (

    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(50)

);

CREATE TABLE employees (

    employee_id INT PRIMARY KEY,
    department_id VARCHAR(10)

);

-- Transitive Dependency Removed

-- ============================================================
-- PRACTICE 7
-- CHECK BCNF
-- ============================================================

CREATE TABLE class_schedule (

    student_name VARCHAR(50),
    subject VARCHAR(50),
    teacher VARCHAR(50)

);

/*

Functional Dependencies:

(Student, Subject) -> Teacher

Teacher -> Subject

Question:

Is BCNF satisfied?

Answer:

NO

Reason:

Teacher is not a Candidate Key.

*/

-- ============================================================
-- PRACTICE 8
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

-- BCNF Achieved

-- ============================================================
-- PRACTICE 9
-- IDENTIFY NORMAL FORM
-- ============================================================

/*

Table A

| ID | Subjects |

|101|DBMS,OS|

Question:

Which Normal Form violated?

Answer:

1NF

Reason:

Multiple values in one column.

*/

-- ============================================================
-- PRACTICE 10
-- IDENTIFY NORMAL FORM
-- ============================================================

/*

Table B

(student_id,
course_id,
student_name)

Primary Key:

(student_id, course_id)

Dependency:

student_id -> student_name

Question:

Which Normal Form violated?

Answer:

2NF

Reason:

Partial Dependency.

*/

-- ============================================================
-- PRACTICE 11
-- IDENTIFY NORMAL FORM
-- ============================================================

/*

Table C

(student_id,
department_id,
department_name)

Dependencies:

student_id -> department_id

department_id -> department_name

Question:

Which Normal Form violated?

Answer:

3NF

Reason:

Transitive Dependency.

*/

-- ============================================================
-- PRACTICE 12
-- NORMALIZATION EXERCISE
-- ============================================================

CREATE TABLE orders_raw (

    order_id INT,
    customer_name VARCHAR(50),
    customer_city VARCHAR(50),
    product_name VARCHAR(50)

);

/*

Task:

Normalize the table.

Expected Solution:

Customers Table

customer_id
customer_name
customer_city

Orders Table

order_id
customer_id

Products Table

product_id
product_name

*/

-- ============================================================
-- PRACTICE 13
-- DENORMALIZATION CASE
-- ============================================================

/*

Question:

Why might a company
store customer_name
inside the orders table?

Answer:

To improve reporting
performance and reduce joins.

*/

-- ============================================================
-- PRACTICE 14
-- TRUE OR FALSE
-- ============================================================

/*

1. Every BCNF table is in 3NF.

Answer: TRUE

--------------------------------

2. Every 3NF table is in BCNF.

Answer: FALSE

--------------------------------

3. 1NF removes Partial Dependency.

Answer: FALSE

--------------------------------

4. 2NF removes Partial Dependency.

Answer: TRUE

--------------------------------

5. 3NF removes Transitive Dependency.

Answer: TRUE

*/

-- ============================================================
-- PRACTICE 15
-- QUICK REVISION QUESTIONS
-- ============================================================

/*

Q1. Define Normalization.

Q2. Define Functional Dependency.

Q3. What is 1NF?

Q4. What is Partial Dependency?

Q5. What is 2NF?

Q6. What is Transitive Dependency?

Q7. What is 3NF?

Q8. What is BCNF?

Q9. Difference between 3NF and BCNF?

Q10. What is Denormalization?

*/

-- ============================================================
-- SELF-ASSESSMENT CHECKLIST
-- ============================================================

/*

Can you explain:

□ Functional Dependency

□ 1NF

□ 2NF

□ 3NF

□ BCNF

□ Denormalization

□ Partial Dependency

□ Transitive Dependency

□ Candidate Key

□ BCNF Violation

If YES to all,
you are ready for interviews
and university examinations.

*/

-- ============================================================
-- END OF FILE
-- ============================================================