-- ============================================================
-- DAY 22 - NORMALIZATION
-- FILE 1: NORMALIZATION BASICS
-- ============================================================

-- ============================================================
-- INTRODUCTION TO NORMALIZATION
-- ============================================================

/*

Normalization is the process of organizing
data in a database to reduce redundancy
and improve consistency.

Goals:

1. Reduce Duplicate Data
2. Improve Data Integrity
3. Avoid Data Anomalies
4. Improve Database Design

*/

-- ============================================================
-- EXAMPLE OF UNNORMALIZED TABLE
-- ============================================================

CREATE TABLE student_courses (

    student_id INT,
    student_name VARCHAR(50),
    subjects VARCHAR(100)

);

-- Example Data

INSERT INTO student_courses VALUES
(101,'Aman','DBMS,OS,CN'),
(102,'Riya','DBMS,CN');

-- Problem:
-- Subjects contain multiple values.

-- ============================================================
-- FUNCTIONAL DEPENDENCY
-- ============================================================

/*

Functional Dependency:

A -> B

Meaning:

A determines B

Example:

Student_ID -> Student_Name

*/

-- Example Table

CREATE TABLE students (

    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)

);

INSERT INTO students VALUES
(101,'Aman'),
(102,'Riya'),
(103,'Neha');

-- Functional Dependency

/*
student_id -> student_name
*/

-- ============================================================
-- TYPES OF DEPENDENCIES
-- ============================================================

/*

1. Full Functional Dependency

(Student_ID, Course_ID) -> Grade

----------------------------------

2. Partial Dependency

Student_ID -> Student_Name

----------------------------------

3. Transitive Dependency

Student_ID -> Department_ID
Department_ID -> Department_Name

*/

-- ============================================================
-- NORMALIZATION BENEFITS
-- ============================================================

/*

Advantages:

✔ Reduces Redundancy

✔ Improves Consistency

✔ Better Data Integrity

✔ Easier Maintenance

✔ Organized Structure

*/

-- ============================================================
-- NORMALIZATION DRAWBACKS
-- ============================================================

/*

Disadvantages:

✔ More Tables

✔ More JOIN Operations

✔ Slightly Complex Queries

*/

-- ============================================================
-- END OF FILE
-- ============================================================