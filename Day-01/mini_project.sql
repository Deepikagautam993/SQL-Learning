-- =========================================
-- MINI PROJECT - STUDENT MANAGEMENT SYSTEM
-- =========================================

-- =========================================
-- Create Database
-- =========================================

CREATE DATABASE school_db;

-- =========================================
-- Create Students Table
-- =========================================

CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(50),
    city VARCHAR(50),
    marks INT,
    course VARCHAR(50)
);

-- =========================================
-- Insert Student Records
-- =========================================

INSERT INTO students
VALUES
(1, 'Deepika', 'Jabalpur', 90, 'AIML'),
(2, 'Rahul', 'Delhi', 78, 'CSE'),
(3, 'Riya', 'Mumbai', 85, 'IT'),
(4, 'Aman', 'Pune', 67, 'ECE'),
(5, 'Simran', 'Indore', 92, 'AIML');

-- =========================================
-- Display All Students
-- =========================================

SELECT * FROM students;

-- =========================================
-- Display Student Names and Courses
-- =========================================

SELECT student_name, course
FROM students;

-- =========================================
-- Display Students with Marks Greater
-- Than 80
-- =========================================

SELECT *
FROM students
WHERE marks > 80;

-- =========================================
-- Display AIML Students
-- =========================================

SELECT *
FROM students
WHERE course = 'AIML';

-- =========================================
-- Display Students from Delhi
-- =========================================

SELECT *
FROM students
WHERE city = 'Delhi';

-- =========================================
-- Display Students with Marks Less
-- Than 70
-- =========================================

SELECT *
FROM students
WHERE marks < 70;