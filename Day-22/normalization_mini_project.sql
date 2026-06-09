-- ============================================================
-- DAY 22 - NORMALIZATION
-- FILE 5: NORMALIZATION MINI PROJECT
-- PROJECT: COLLEGE MANAGEMENT SYSTEM
-- ============================================================

/*

Project Objective:

Design a small College Management System
and apply Normalization concepts.

Topics Covered:

✔ Functional Dependency

✔ 1NF

✔ 2NF

✔ 3NF

✔ BCNF

✔ Relationships

✔ Joins

*/

-- ============================================================
-- STEP 1 : UNNORMALIZED TABLE
-- ============================================================

CREATE TABLE college_data_raw (

    student_id INT,
    student_name VARCHAR(50),
    department_name VARCHAR(50),
    courses VARCHAR(100)

);

INSERT INTO college_data_raw VALUES
(101,'Aman','Computer Science','DBMS,CN,OS'),
(102,'Riya','Mechanical','Thermodynamics,CAD');

-- Problems:

-- Multiple values in courses column
-- Repeated department names
-- Difficult to maintain

SELECT * FROM college_data_raw;

-- ============================================================
-- STEP 2 : APPLY 1NF
-- ============================================================

CREATE TABLE student_courses_1nf (

    student_id INT,
    student_name VARCHAR(50),
    department_name VARCHAR(50),
    course_name VARCHAR(50)

);

INSERT INTO student_courses_1nf VALUES
(101,'Aman','Computer Science','DBMS'),
(101,'Aman','Computer Science','CN'),
(101,'Aman','Computer Science','OS'),
(102,'Riya','Mechanical','Thermodynamics'),
(102,'Riya','Mechanical','CAD');

SELECT * FROM student_courses_1nf;

-- Now each column contains atomic values.

-- ============================================================
-- STEP 3 : APPLY 2NF
-- ============================================================

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT

);

CREATE TABLE enrollments (

    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id, course_id)

);

-- Partial dependency removed.

-- ============================================================
-- STEP 4 : APPLY 3NF
-- ============================================================

CREATE TABLE departments (

    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)

);

INSERT INTO departments VALUES
(1,'Computer Science'),
(2,'Mechanical');

INSERT INTO students VALUES
(101,'Aman',1),
(102,'Riya',2);

-- Transitive dependency removed.

-- ============================================================
-- STEP 5 : BCNF STRUCTURE
-- ============================================================

CREATE TABLE courses (

    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)

);

INSERT INTO courses VALUES
(1,'DBMS'),
(2,'CN'),
(3,'OS'),
(4,'Thermodynamics'),
(5,'CAD');

INSERT INTO enrollments VALUES
(101,1),
(101,2),
(101,3),
(102,4),
(102,5);

-- BCNF-compliant design.

-- ============================================================
-- PROJECT TABLE STRUCTURE
-- ============================================================

/*

Departments
------------

department_id
department_name

Students
---------

student_id
student_name
department_id

Courses
--------

course_id
course_name

Enrollments
-----------

student_id
course_id

*/

-- ============================================================
-- PROJECT QUERIES
-- ============================================================

-- View Students

SELECT * FROM students;

-- View Departments

SELECT * FROM departments;

-- View Courses

SELECT * FROM courses;

-- View Enrollments

SELECT * FROM enrollments;

-- ============================================================
-- QUERY 1
-- SHOW ALL STUDENTS WITH DEPARTMENTS
-- ============================================================

SELECT

    s.student_id,
    s.student_name,
    d.department_name

FROM students s
JOIN departments d
ON s.department_id = d.department_id;

-- ============================================================
-- QUERY 2
-- SHOW STUDENTS AND COURSES
-- ============================================================

SELECT

    s.student_name,
    c.course_name

FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id;

-- ============================================================
-- QUERY 3
-- COUNT STUDENTS IN EACH DEPARTMENT
-- ============================================================

SELECT

    d.department_name,
    COUNT(*) AS total_students

FROM students s
JOIN departments d
ON s.department_id = d.department_id

GROUP BY d.department_name;

-- ============================================================
-- QUERY 4
-- FIND ALL COURSES OF AMAN
-- ============================================================

SELECT

    s.student_name,
    c.course_name

FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id

WHERE s.student_name = 'Aman';

-- ============================================================
-- QUERY 5
-- FIND TOTAL COURSES PER STUDENT
-- ============================================================

SELECT

    s.student_name,
    COUNT(e.course_id) AS total_courses

FROM students s
JOIN enrollments e
ON s.student_id = e.student_id

GROUP BY s.student_name;

-- ============================================================
-- NORMALIZATION ANALYSIS
-- ============================================================

/*

1NF Applied

✔ Atomic Values

----------------------------------

2NF Applied

✔ Partial Dependency Removed

----------------------------------

3NF Applied

✔ Transitive Dependency Removed

----------------------------------

BCNF Applied

✔ Every Determinant is Candidate Key

*/

-- ============================================================
-- MINI PROJECT ASSIGNMENTS
-- ============================================================

/*

Task 1

Add a new department:

Civil Engineering

----------------------------------

Task 2

Add a new student.

----------------------------------

Task 3

Add a new course.

----------------------------------

Task 4

Enroll a student in multiple courses.

----------------------------------

Task 5

Display all student-course mappings.

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

1. Why was normalization applied?

2. Which normal forms were used?

3. What redundancy existed initially?

4. How did 2NF improve the design?

5. How did 3NF improve the design?

6. Why is BCNF stronger than 3NF?

7. What are the benefits of this structure?

*/

-- ============================================================
-- LEARNING OUTCOMES
-- ============================================================

/*

After completing this project,
you should be able to:

✔ Identify Functional Dependencies

✔ Apply 1NF

✔ Apply 2NF

✔ Apply 3NF

✔ Apply BCNF

✔ Design normalized databases

✔ Build relationships between tables

✔ Write JOIN queries

*/

-- ============================================================
-- END OF FILE
-- ============================================================