# DAY 11 - STORED PROCEDURES & FUNCTIONS

## Overview
Day 11 focused on Stored Procedures and Functions in PostgreSQL. These concepts are extremely important for enterprise database systems, backend development, automation, and reusable SQL programming.

The goal of this day was to understand:
- database programming
- reusable SQL logic
- automation
- parameter handling
- function-based calculations

---

# Topics Covered
- Stored Procedures
- CREATE PROCEDURE
- CALL Statement
- Functions
- CREATE FUNCTION
- RETURN Statement
- Parameter Functions
- Query-based Functions
- Procedure vs Function
- Database Automation

---

# What is Stored Procedure?

Stored Procedure is saved SQL program inside database.

Stored procedures are used for:
- automation
- reusable logic
- backend systems
- enterprise applications
- business rules

---

# CREATE PROCEDURE Syntax

CREATE OR REPLACE PROCEDURE procedure_name()

LANGUAGE plpgsql

AS $$

BEGIN

    SQL statements;

END;

$$;

---

# Example Procedure

CREATE OR REPLACE PROCEDURE show_message()

LANGUAGE plpgsql

AS $$

BEGIN

    RAISE NOTICE 'Procedure Executed';

END;

$$;

---

# Executing Procedure

CALL show_message();

Procedure execution uses:
CALL

---

# Procedure with Parameters

CREATE OR REPLACE PROCEDURE add_employee(

    p_id INT,
    p_name VARCHAR,
    p_salary INT

)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employees
    VALUES (p_id, p_name, p_salary);

END;

$$;

---

# What is Function?

Function is reusable SQL logic that returns value.

Functions are used for:
- calculations
- analytics
- reusable business logic
- automation

---

# CREATE FUNCTION Syntax

CREATE OR REPLACE FUNCTION function_name()

RETURNS datatype

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN value;

END;

$$;

---

# Example Function

CREATE OR REPLACE FUNCTION total_employees()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (
        SELECT COUNT(*)
        FROM employees
    );

END;

$$;

---

# Executing Function

SELECT total_employees();

Functions execute using:
SELECT

---

# Parameter Function

CREATE OR REPLACE FUNCTION employee_bonus(

    salary INT

)

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN salary + 5000;

END;

$$;

---

# Query-based Function

CREATE OR REPLACE FUNCTION highest_salary()

RETURNS INT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN (

        SELECT MAX(salary)
        FROM employees

    );

END;

$$;

---

# Procedure vs Function

| PROCEDURE | FUNCTION |
|---|---|
| Uses CALL | Uses SELECT |
| May not return value | Must return value |
| Used for automation | Used for calculations |
| Executes tasks | Returns output |

---

# Files Included

## 1. stored_procedures_functions_basics.sql
Contains:
- basic procedures
- parameter procedures
- basic functions
- query-based functions

---

## 2. advanced_procedures_functions.sql
Contains:
- advanced automation
- update procedures
- delete procedures
- KPI functions
- salary analytics

---

## 3. procedures_functions_practice_questions.sql
Contains:
- practice questions
- execution examples
- parameter function practice
- automation exercises

---

## 4. assignments_with_solutions.sql
Contains:
- assignments
- complete solutions
- interview theory questions
- automation examples

---

## 5. mini_project.sql
Mini project based on:
- employee management automation
- salary analytics
- KPI calculations
- enterprise SQL programming

---

# Mini Project Overview

## Employee Management Automation System

This project demonstrates:
- Stored Procedures
- Functions
- Database Automation
- Salary Analytics
- KPI Calculations
- Backend SQL Development
- Enterprise SQL Programming

---

# Real-World Use Cases

Stored Procedures and Functions are used in:
- Banking systems
- ERP software
- Payroll systems
- Backend APIs
- Enterprise applications
- Financial analytics
- Automation systems

---

# Skills Developed
- Database Programming
- SQL Automation
- Reusable SQL Logic
- Backend SQL Development
- Enterprise SQL Concepts
- KPI Calculations
- Salary Analytics
- Business Logic Handling

---

# Important Interview Questions

## What is Stored Procedure?
Stored Procedure is saved SQL program inside database.

---

## What is Function?
Function is reusable SQL logic that returns value.

---

## Difference between Procedure and Function

| PROCEDURE | FUNCTION |
|---|---|
| Uses CALL | Uses SELECT |
| May not return value | Must return value |

---

## What is CALL Statement?
CALL is used for executing procedure.

---

## What is RETURN Statement?
RETURN is used for sending output from function.

---

# Most Important Learnings

- Procedures automate tasks
- Functions return values
- CALL executes procedures
- SELECT executes functions
- Functions improve reusable logic
- Procedures improve automation
- Database programming improves backend systems

---

# Conclusion
Day 11 provided strong understanding of:
- Stored Procedures
- Functions
- SQL Automation
- Reusable SQL Programming
- Backend Database Logic
- Enterprise SQL Development
- KPI Analytics
- Business Logic Handling

These concepts are extremely important for:
- SQL Developers
- Backend Developers
- Database Administrators
- Data Engineers
- Enterprise Software Developers
