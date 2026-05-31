# DAY 13 - CURSORS IN POSTGRESQL

## Overview

Day 13 focused on Cursors in PostgreSQL.

A Cursor is a database object that allows rows returned by a query to be processed one at a time.

Cursors are mainly used when row-by-row processing is required instead of processing all records together.

---

# Topics Covered

- Cursor
- DECLARE
- OPEN
- FETCH
- CLOSE
- LOOP
- NOT FOUND
- RECORD Variable
- Cursor Workflow
- Row-by-Row Processing
- Batch Processing
- Cursor Programming

---

# What is a Cursor?

A Cursor is a pointer to the result set of a query.

It allows PostgreSQL to process rows one at a time.

Example:

SELECT * FROM employees;

returns all rows together.

Cursor processes:

Row 1 → Process

Row 2 → Process

Row 3 → Process

...

---

# Why Use Cursors?

Cursors are useful when:

- Large datasets need processing
- Complex business rules exist
- Row-by-row operations are required
- Batch processing is needed
- Reports must be generated individually

---

# Cursor Workflow

DECLARE

↓

OPEN

↓

FETCH

↓

PROCESS

↓

CLOSE

---

# Important Keywords

## DECLARE

Used to create a cursor.

Example:

DECLARE emp_cursor CURSOR FOR

SELECT * FROM employees;

---

## OPEN

Starts the cursor.

Example:

OPEN emp_cursor;

---

## FETCH

Reads the next row.

Example:

FETCH emp_cursor
INTO employee_name;

---

## CLOSE

Closes the cursor and releases resources.

Example:

CLOSE emp_cursor;

---

## NOT FOUND

Used to stop processing when no more rows exist.

Example:

EXIT WHEN NOT FOUND;

---

# RECORD Variable

A RECORD variable stores an entire row.

Example:

DECLARE

emp_record RECORD;

You can access columns as:

emp_record.emp_name

emp_record.salary

emp_record.department

---

# Cursor with LOOP

Most common pattern:

LOOP

    FETCH cursor_name
    INTO variable;

    EXIT WHEN NOT FOUND;

    -- Process Data

END LOOP;

---

# Cursor vs Normal Query

| Normal Query | Cursor |
|-------------|---------|
| Processes all rows together | Processes one row at a time |
| Faster | Slower |
| Less control | More control |
| Suitable for simple tasks | Suitable for complex logic |

---

# Files Included

## 1. cursors_basics.sql

Contains:

- Cursor Basics
- DECLARE
- OPEN
- FETCH
- CLOSE
- LOOP
- NOT FOUND

---

## 2. advanced_cursors.sql

Contains:

- RECORD Variable
- Multiple Column Processing
- Salary Processing
- Bonus Calculation
- Conditional Logic
- Row-by-Row Updates

---

## 3. cursors_practice_questions.sql

Contains:

- Cursor Exercises
- Salary Calculations
- Employee Processing
- Counting Records
- Department Processing

---

## 4. assignments_with_solutions.sql

Contains:

- Practical Assignments
- Complete Solutions
- Theory Questions
- Interview Preparation

---

## 5. mini_project.sql

Project:

Employee Bonus Processing System

Features:

- Employee Reports
- Bonus Calculation
- Salary Increment
- Employee Counting
- Total Salary Calculation

---

# Mini Project Overview

Employee Bonus Processing System

Modules:

1. Employee Report Generator

2. Bonus Calculator

3. Salary Increment System

4. Employee Counter

5. High Salary Employee Finder

6. Salary Summary Report

---

# Real-World Applications

Cursors are used in:

- Banking Systems
- Payroll Systems
- ERP Software
- Reporting Systems
- Enterprise Applications
- Data Migration
- Batch Processing
- Financial Systems

---

# Skills Developed

- Cursor Programming
- Row-by-Row Processing
- Loop Handling
- Record Variables
- Report Generation
- Business Logic Implementation
- PostgreSQL Programming

---

# Important Interview Questions

### What is a Cursor?

A Cursor is a pointer to rows returned by a query that allows row-by-row processing.

---

### Why use Cursors?

To process records individually when complex logic is required.

---

### What is FETCH?

FETCH retrieves the next row from the cursor.

---

### What is OPEN?

OPEN starts the cursor.

---

### What is CLOSE?

CLOSE releases cursor resources.

---

### What is NOT FOUND?

It indicates that no more rows are available.

---

### What is RECORD?

A variable that stores an entire row.

---

### Cursor Workflow?

DECLARE

OPEN

FETCH

PROCESS

CLOSE

---

### Cursor vs Normal Query?

Cursor processes one row at a time while a normal query processes all rows together.

---

# Most Important Learnings

- Cursor is a pointer to query results
- Cursor processes rows individually
- DECLARE creates a cursor
- OPEN starts processing
- FETCH retrieves rows
- CLOSE releases resources
- RECORD stores complete rows
- LOOP automates processing
- NOT FOUND stops processing
- Cursors are useful for business logic

---

# Conclusion

Day 13 provided practical understanding of:

- Cursors
- Row-by-Row Processing
- Record Variables
- Loop Handling
- Report Generation
- Batch Processing
- PostgreSQL Procedural Programming

These concepts are widely used in enterprise-level database systems and backend applications.
