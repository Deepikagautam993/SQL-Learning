# DAY 12 - TRIGGERS IN POSTGRESQL

## Overview

Day 12 focused on Triggers in PostgreSQL. Triggers are used to automatically execute actions when specific events occur on a table.

Events that can fire triggers:
- INSERT
- UPDATE
- DELETE

Triggers are widely used for:
- Audit Logging
- Security Monitoring
- Employee Tracking
- Payroll Systems
- Banking Applications
- ERP Software
- Inventory Management

---

# Topics Covered

- Trigger
- Trigger Function
- CREATE TRIGGER
- BEFORE Trigger
- AFTER Trigger
- INSERT Trigger
- UPDATE Trigger
- DELETE Trigger
- OLD Keyword
- NEW Keyword
- Audit Logging
- Validation Trigger

---

# What is Trigger?

Trigger is an automatic action executed when a database event occurs.

Example:

When a new employee is inserted:

INSERT

↓

Trigger Fires

↓

Audit Record Created

Automatically

---

# Trigger Workflow

Event Occurs

↓

Trigger Fires

↓

Trigger Function Executes

↓

Action Performed

---

# What is Trigger Function?

A Trigger Function is a special function executed by a trigger.

Syntax:

CREATE OR REPLACE FUNCTION function_name()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN NEW;

END;

$$;

---

# CREATE TRIGGER Syntax

CREATE TRIGGER trigger_name

AFTER INSERT

ON table_name

FOR EACH ROW

EXECUTE FUNCTION function_name();

---

# INSERT Trigger

Runs when a new record is inserted.

Example:

AFTER INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_insert();

---

# UPDATE Trigger

Runs when a record is updated.

Example:

AFTER UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_update();

---

# DELETE Trigger

Runs when a record is deleted.

Example:

AFTER DELETE

ON employees

FOR EACH ROW

EXECUTE FUNCTION audit_delete();

---

# OLD Keyword

OLD contains previous row values.

Used in:
- UPDATE
- DELETE

Example:

OLD.salary

OLD.emp_name

---

# NEW Keyword

NEW contains new row values.

Used in:
- INSERT
- UPDATE

Example:

NEW.salary

NEW.emp_name

---

# BEFORE Trigger

Executes before event occurs.

Used for:
- Validation
- Data Checking
- Business Rules

Example:

BEFORE INSERT

---

# AFTER Trigger

Executes after event occurs.

Used for:
- Logging
- Tracking
- Auditing

Example:

AFTER UPDATE

---

# Difference Between OLD and NEW

| OLD | NEW |
|-------|-------|
| Previous Values | Updated Values |
| UPDATE | INSERT |
| DELETE | UPDATE |

---

# Difference Between BEFORE and AFTER

| BEFORE | AFTER |
|----------|----------|
| Before Event | After Event |
| Validation | Logging |
| Rule Checking | Audit Tracking |

---

# Files Included

## 1. triggers_basics.sql

Contains:

- Basic Trigger Creation
- Trigger Functions
- INSERT Trigger
- UPDATE Trigger
- DELETE Trigger
- Audit Logging

---

## 2. advanced_triggers.sql

Contains:

- BEFORE Trigger
- AFTER Trigger
- Salary Validation
- Salary Tracking
- Delete Tracking
- OLD and NEW Usage

---

## 3. triggers_practice_questions.sql

Contains:

- Practice Questions
- Trigger Exercises
- Validation Practice
- Audit Practice
- Interview Preparation

---

## 4. assignments_with_solutions.sql

Contains:

- Assignments
- Complete Solutions
- Theory Questions
- Practical Questions
- Trigger Implementation

---

## 5. mini_project.sql

Project:

Employee Audit & Tracking System

Features:

- Insert Tracking
- Salary Tracking
- Delete Tracking
- Validation System
- Audit Management

---

# Mini Project Overview

Employee Audit & Tracking System

Modules:

1. Employee Management

2. Audit Logging

3. Salary Change Tracking

4. Delete History Tracking

5. Validation System

6. Employee Monitoring

---

# Real-World Applications

Triggers are used in:

- Banking Systems
- ERP Software
- Payroll Systems
- Inventory Management
- Employee Tracking Systems
- Security Monitoring
- Audit Management
- Enterprise Applications

---

# Skills Developed

- Trigger Programming
- Audit Logging
- Event Handling
- Database Automation
- Validation Rules
- PostgreSQL Advanced Concepts
- Employee Monitoring
- Business Rule Implementation

---

# Important Interview Questions

### What is Trigger?

Automatic action executed when event occurs.

---

### What is Trigger Function?

Function executed by Trigger.

---

### Which events fire Trigger?

- INSERT
- UPDATE
- DELETE

---

### Difference between OLD and NEW?

OLD = Previous Values

NEW = Updated Values

---

### Difference between BEFORE and AFTER Trigger?

BEFORE = Validation

AFTER = Logging

---

### Why use Triggers?

- Automation
- Security
- Auditing
- Monitoring
- Validation

---

### RETURN NEW vs RETURN OLD?

INSERT → RETURN NEW

UPDATE → RETURN NEW

DELETE → RETURN OLD

---

# Most Important Learnings

- Trigger automates database tasks
- Trigger uses Trigger Function
- INSERT can fire Trigger
- UPDATE can fire Trigger
- DELETE can fire Trigger
- OLD stores previous values
- NEW stores updated values
- BEFORE validates data
- AFTER performs logging
- Triggers are important in enterprise systems

---

# Conclusion

Day 12 provided strong understanding of:

- Triggers
- Trigger Functions
- Event Handling
- Audit Logging
- Validation Rules
- Employee Tracking
- Database Automation
- PostgreSQL Advanced Programming

These concepts are widely used in enterprise-level database applications and backend systems.
