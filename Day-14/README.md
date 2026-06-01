# DAY 14 - EXCEPTION HANDLING IN POSTGRESQL

## Overview

Day 14 focused on Exception Handling in PostgreSQL.

Exception Handling is used to catch and manage runtime errors that occur during program execution. It helps prevent database programs from crashing and allows developers to handle errors gracefully.

Exception Handling is widely used in:

- Banking Systems
- ATM Software
- ERP Applications
- Payroll Systems
- Financial Software
- Inventory Management
- Enterprise Applications

---

# Topics Covered

- Exception Handling
- EXCEPTION Block
- WHEN Clause
- division_by_zero
- unique_violation
- not_null_violation
- foreign_key_violation
- check_violation
- OTHERS
- SQLERRM
- SQLSTATE
- RAISE EXCEPTION
- Custom Exceptions
- Nested Exception Handling

---

# What is Exception Handling?

Exception Handling is a mechanism used to catch and handle runtime errors in PostgreSQL.

Without Exception Handling:

Error Occurs

↓

Program Stops

With Exception Handling:

Error Occurs

↓

Error Handled

↓

Program Continues

---

# Basic Syntax

```sql
BEGIN

    -- SQL Statements

EXCEPTION

    WHEN error_condition THEN

        -- Error Handling Code

END;
```

---

# Common Exception Types

| Exception | Meaning |
|------------|------------|
| division_by_zero | Division by zero error |
| unique_violation | Duplicate key error |
| not_null_violation | NULL value error |
| foreign_key_violation | Foreign key constraint error |
| check_violation | CHECK constraint failure |
| OTHERS | Any unhandled exception |

---

# EXCEPTION Block

Used to handle errors that occur inside a PostgreSQL block.

Example:

```sql
EXCEPTION

WHEN division_by_zero THEN

RAISE NOTICE 'Cannot divide by zero';
```

---

# WHEN Clause

Used to catch a specific error.

Example:

```sql
WHEN unique_violation THEN

RAISE NOTICE 'Duplicate ID Not Allowed';
```

---

# OTHERS

Used to catch all remaining unhandled exceptions.

Example:

```sql
WHEN OTHERS THEN

RAISE NOTICE 'Unknown Error';
```

---

# SQLERRM

Returns the actual error message.

Example:

```sql
RAISE NOTICE
'Error Message: %',
SQLERRM;
```

---

# SQLSTATE

Returns the SQL error code.

Example:

```sql
RAISE NOTICE
'Error Code: %',
SQLSTATE;
```

---

# RAISE EXCEPTION

Used to generate custom errors.

Example:

```sql
IF salary < 0 THEN

RAISE EXCEPTION
'Salary Cannot Be Negative';

END IF;
```

---

# Custom Exceptions

Developer-defined exceptions created using RAISE EXCEPTION.

Examples:

- Invalid Salary
- Invalid Age
- Invalid Deposit Amount
- Insufficient Balance

---

# Nested Exception Handling

Exception handling inside another block.

Example:

```sql
BEGIN

    BEGIN

        PERFORM 10 / 0;

    EXCEPTION

        WHEN division_by_zero THEN

            RAISE NOTICE 'Handled';

    END;

END;
```

---

# Files Included

## 1. exception_handling_basics.sql

Contains:

- EXCEPTION Block
- WHEN Clause
- OTHERS
- division_by_zero
- unique_violation
- check_violation
- foreign_key_violation

---

## 2. advanced_exception_handling.sql

Contains:

- SQLERRM
- SQLSTATE
- Custom Exceptions
- Nested Exceptions
- Transaction Safety
- Banking Examples

---

## 3. exception_practice_questions.sql

Contains:

- Practical Exercises
- Error Handling Questions
- Validation Problems
- SQLERRM Practice
- SQLSTATE Practice

---

## 4. assignments_with_solutions.sql

Contains:

- Assignments
- Complete Solutions
- Theory Questions
- Practical Questions
- Interview Preparation

---

## 5. mini_project.sql

Project:

Bank Account Management System

Features:

- Duplicate Account Validation
- Deposit Validation
- Withdrawal Validation
- Custom Exceptions
- SQLERRM Handling
- SQLSTATE Handling
- Banking Error Management

---

# Mini Project Overview

Bank Account Management System

Modules:

1. Account Creation

2. Duplicate Account Detection

3. Deposit Validation

4. Withdrawal Validation

5. Error Management

6. Banking Exception Handling

---

# Real-World Applications

Exception Handling is used in:

- Banking Systems
- ATM Software
- ERP Applications
- Payroll Systems
- Financial Systems
- E-Commerce Platforms
- Inventory Management
- Enterprise Applications

---

# Skills Developed

- Exception Handling
- Runtime Error Management
- SQLERRM Usage
- SQLSTATE Usage
- Custom Exception Creation
- Nested Exception Handling
- Safe Database Programming
- PostgreSQL Error Management

---

# Important Interview Questions

### What is Exception Handling?

A mechanism used to catch and handle runtime errors.

---

### What is EXCEPTION Block?

A block that handles errors occurring during execution.

---

### What is division_by_zero?

An exception raised when division by zero occurs.

---

### What is unique_violation?

An exception raised when duplicate values are inserted into a UNIQUE or PRIMARY KEY column.

---

### What is not_null_violation?

An exception raised when NULL is inserted into a NOT NULL column.

---

### What is check_violation?

An exception raised when a CHECK constraint condition fails.

---

### What is foreign_key_violation?

An exception raised when a foreign key constraint fails.

---

### What is OTHERS?

A special handler that catches all unhandled exceptions.

---

### What is SQLERRM?

Returns the error message generated by the exception.

---

### What is SQLSTATE?

Returns the SQL error code generated by the exception.

---

### What is RAISE EXCEPTION?

Used to create custom exceptions.

---

### What is Nested Exception Handling?

Handling exceptions inside another exception block.

---

# Most Important Learnings

- Exception Handling prevents program crashes
- EXCEPTION block catches errors
- WHEN handles specific exceptions
- OTHERS handles all remaining exceptions
- SQLERRM returns error messages
- SQLSTATE returns error codes
- RAISE EXCEPTION creates custom errors
- Nested blocks improve error control
- Exception Handling is critical for enterprise applications

---

# Conclusion

Day 14 provided practical understanding of:

- Exception Handling
- Runtime Error Management
- SQLERRM
- SQLSTATE
- Custom Exceptions
- Nested Exception Handling
- Validation Logic
- Safe PostgreSQL Programming

These concepts are essential for building secure, reliable, and production-ready PostgreSQL applications.
