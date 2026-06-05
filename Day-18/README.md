# DAY 18 - STORED PROCEDURES AND FUNCTIONS IN POSTGRESQL 🚀

## 📌 Overview

Stored Procedures and Functions are powerful PostgreSQL database objects used to encapsulate business logic, automate repetitive tasks, improve code reusability, and simplify application development.

Functions are primarily used for calculations and returning values, while Procedures are designed for performing database operations such as INSERT, UPDATE, and DELETE.

This module covers Functions, Procedures, Parameter Types, Payroll Calculations, Employee Management Systems, and Real-World Business Applications.

---

# 🎯 Learning Objectives

By completing this module, you will learn:

- What is a Function?
- What is a Procedure?
- Function Syntax
- Procedure Syntax
- Calling Functions
- Calling Procedures
- IN Parameters
- OUT Parameters
- INOUT Parameters
- DEFAULT Parameters
- Functions Returning Tables
- Employee Payroll Processing
- Business Logic Implementation
- PostgreSQL Automation

---

# 🧠 What is a Function?

A Function is a reusable block of code that performs a specific task and returns a value.

### Example

```sql
CREATE FUNCTION add_numbers(
    a INT,
    b INT
)

RETURNS INT

AS $$

BEGIN

    RETURN a + b;

END;

$$ LANGUAGE plpgsql;
```

Calling:

```sql
SELECT add_numbers(10,20);
```

Output:

```text
30
```

---

# 🔥 Why Use Functions?

Functions are used for:

- Bonus Calculation
- Tax Calculation
- Age Calculation
- Salary Calculation
- Reporting
- Data Validation
- Business Rules

Benefits:

- Reusable
- Easy Maintenance
- Centralized Logic
- Cleaner SQL Code

---

# 📚 Function Returning Text

Example:

```sql
CREATE FUNCTION welcome_message()

RETURNS TEXT

AS $$

BEGIN

    RETURN 'Welcome to PostgreSQL';

END;

$$ LANGUAGE plpgsql;
```

Calling:

```sql
SELECT welcome_message();
```

---

# 📊 Function Returning Table

Functions can return entire result sets.

Example:

```sql
CREATE FUNCTION get_it_employees()

RETURNS TABLE
(
    emp_id INT,
    emp_name VARCHAR,
    department VARCHAR
)

AS $$

BEGIN

    RETURN QUERY

    SELECT *
    FROM employees
    WHERE department='IT';

END;

$$ LANGUAGE plpgsql;
```

Calling:

```sql
SELECT *
FROM get_it_employees();
```

---

# 🏢 What is a Procedure?

A Procedure is a reusable block of code designed to perform actions.

Unlike Functions, Procedures are generally used for:

- INSERT
- UPDATE
- DELETE
- Bulk Processing
- Payroll Operations
- Data Maintenance

---

# Procedure Example

```sql
CREATE PROCEDURE add_employee(

    p_emp_id INT,
    p_emp_name VARCHAR(100)

)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employees
    VALUES
    (
        p_emp_id,
        p_emp_name
    );

END;

$$;
```

Calling:

```sql
CALL add_employee(
    101,
    'Aman Sharma'
);
```

---

# ⚡ Function vs Procedure

| Function | Procedure |
|-----------|-----------|
| Returns value | Performs action |
| Uses SELECT | Uses CALL |
| RETURNS required | RETURNS not required |
| Calculation oriented | Operation oriented |
| Can return table | Usually modifies data |

---

# 🔄 Parameter Types

PostgreSQL supports multiple parameter types.

---

## IN Parameter

Input only.

Example:

```sql
CREATE FUNCTION square_number(
    n INT
)
RETURNS INT
```

Input:

```text
5
```

Output:

```text
25
```

---

## OUT Parameter

Output only.

Example:

```sql
CREATE FUNCTION calculate_bonus(

    salary INT,
    OUT bonus INT

)
```

Returns:

```text
bonus
```

---

## INOUT Parameter

Acts as both input and output.

Example:

```sql
CREATE FUNCTION increase_salary(

    INOUT salary INT

)
```

Input:

```text
50000
```

Output:

```text
55000
```

---

## DEFAULT Parameter

Provides a default value.

Example:

```sql
CREATE FUNCTION welcome_message(

    user_name TEXT DEFAULT 'Guest'

)
```

Calling:

```sql
SELECT welcome_message();
```

Output:

```text
Welcome Guest
```

---

# 📁 Project Structure

## File 1 - function_basics.sql

Topics Covered:

- Function Creation
- Function Execution
- Arithmetic Functions
- Text Functions
- Table Functions
- Employee Functions

---

## File 2 - procedure_basics.sql

Topics Covered:

- Procedure Creation
- Procedure Execution
- Insert Operations
- Update Operations
- Delete Operations
- Employee Management

---

## File 3 - advanced_parameters.sql

Topics Covered:

- IN Parameters
- OUT Parameters
- INOUT Parameters
- DEFAULT Parameters
- Multiple Output Parameters
- Business Logic Examples

---

## File 4 - assignments_with_solutions.sql

Topics Covered:

- Function Assignments
- Procedure Assignments
- Interview Questions
- Practice Problems
- Revision Tasks

---

## File 5 - mini_project.sql

Project:

Employee Payroll & Management System

Features:

- Employee Management
- Bonus Calculation
- Tax Calculation
- Net Salary Calculation
- Department Transfer
- Payroll Reports
- Salary Updates

---

# 🌍 Real-World Applications

Stored Procedures and Functions are widely used in:

- Banking Systems
- Payroll Systems
- ERP Applications
- E-Commerce Platforms
- Hospital Management Systems
- Inventory Systems
- HR Management Systems
- Financial Software
- Reporting Systems

---

# 📊 Payroll Example

Bonus Calculation:

```sql
SELECT calculate_bonus(50000);
```

Tax Calculation:

```sql
SELECT calculate_tax(50000);
```

Net Salary:

```sql
SELECT net_salary(50000);
```

---

# 🎤 Interview Questions

## What is a Function?

A reusable block of code that performs a task and returns a value.

---

## What is a Procedure?

A reusable block of code used to perform actions.

---

## Which command executes a Function?

```sql
SELECT function_name();
```

---

## Which command executes a Procedure?

```sql
CALL procedure_name();
```

---

## Is RETURNS mandatory in Functions?

Yes.

---

## Is RETURNS mandatory in Procedures?

No.

---

## Which parameter is input only?

IN

---

## Which parameter is output only?

OUT

---

## Which parameter is both input and output?

INOUT

---

## Which parameter provides default values?

DEFAULT

---

## Can Functions return tables?

Yes.

Using:

```sql
RETURNS TABLE(...)
```

---

## Which is preferred for INSERT operations?

Procedure

---

## Which is preferred for calculations?

Function

---

# 📈 Skills Gained

After completing this module, you can:

- Create Functions
- Create Procedures
- Use Parameters
- Implement Business Logic
- Perform Payroll Calculations
- Manage Employee Data
- Build Reporting Systems
- Automate Database Operations
- Prepare for PostgreSQL Interviews

---

# 🏆 Conclusion

Functions and Procedures are fundamental PostgreSQL features used to build scalable, maintainable, and efficient database applications. They help centralize business logic, improve code reuse, automate operations, and simplify enterprise-level database development.

Mastering these concepts is essential for Database Developers, Backend Engineers, Data Analysts, and PostgreSQL Professionals.


30 Days PostgreSQL Challenge 🚀
