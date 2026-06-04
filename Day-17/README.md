# DAY 17 - VIEWS AND MATERIALIZED VIEWS IN POSTGRESQL 🚀

## 📌 Overview

Views and Materialized Views are powerful PostgreSQL features used to simplify complex queries, improve security, provide reusable data access layers, and optimize reporting systems.

A View acts as a virtual table based on a SQL query, while a Materialized View stores the actual result of a query for faster access.

This module covers View creation, management, security implementation, reporting systems, and Materialized View optimization.

---

# 🎯 Learning Objectives

By completing this module, you will learn:

- What is a View?
- Why Views are used
- Creating Views
- Using Views
- Updating Views
- Updatable Views
- Non-Updatable Views
- CREATE OR REPLACE VIEW
- ALTER VIEW
- DROP VIEW
- Materialized Views
- REFRESH MATERIALIZED VIEW
- Reporting Systems
- Dashboard Optimization
- Security Through Views

---

# 🧠 What is a View?

A View is a virtual table created from a SQL query.

It does not store data itself.

Instead, it stores the query definition and retrieves fresh data whenever the view is accessed.

### Example

```sql
CREATE VIEW employee_basic_info AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;
```

Using the view:

```sql
SELECT *
FROM employee_basic_info;
```

---

# 🔒 Why Use Views?

## 1. Security

Views help hide sensitive information.

Example:

Instead of exposing:

```text
Employee ID
Employee Name
Department
Salary
```

You can create a view that hides salary data.

```sql
CREATE VIEW employee_public_data AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;
```

---

## 2. Simplicity

Complex queries can be stored once and reused many times.

Instead of repeatedly writing:

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

Create:

```sql
CREATE VIEW it_employees AS
SELECT *
FROM employees
WHERE department = 'IT';
```

Then simply use:

```sql
SELECT *
FROM it_employees;
```

---

## 3. Reusability

Business logic can be centralized and reused across applications and reports.

---

# 📚 View Operations

## Create View

```sql
CREATE VIEW view_name AS
SELECT *
FROM table_name;
```

---

## Use View

```sql
SELECT *
FROM view_name;
```

---

## Replace Existing View

```sql
CREATE OR REPLACE VIEW employee_view AS

SELECT
    emp_id,
    emp_name,
    salary
FROM employees;
```

---

## Rename View

```sql
ALTER VIEW employee_view
RENAME TO employee_details;
```

---

## Drop View

```sql
DROP VIEW employee_view;
```

Dropping a view does not affect the original table.

---

# 🔄 Updatable Views

A View is usually updatable when:

- It is based on a single table
- No GROUP BY clause
- No Aggregate Functions
- No DISTINCT keyword

Example:

```sql
CREATE VIEW employee_update_view AS

SELECT
    emp_id,
    emp_name,
    department
FROM employees;
```

Update through view:

```sql
UPDATE employee_update_view
SET department='Finance'
WHERE emp_id=101;
```

---

# ❌ Non-Updatable Views

Views containing aggregation are usually not directly updatable.

Example:

```sql
CREATE VIEW department_summary AS

SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```

Because of:

```text
GROUP BY
COUNT()
SUM()
AVG()
DISTINCT
```

updates are generally not allowed.

---

# ⚡ Materialized Views

A Materialized View stores the actual result of a query.

Unlike normal Views, Materialized Views physically store data.

---

## Create Materialized View

```sql
CREATE MATERIALIZED VIEW mv_it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';
```

---

## Use Materialized View

```sql
SELECT *
FROM mv_it_employees;
```

---

## Refresh Materialized View

```sql
REFRESH MATERIALIZED VIEW mv_it_employees;
```

This updates the stored snapshot with the latest data.

---

# 📊 View vs Materialized View

| View | Materialized View |
|--------|------------------|
| Stores query only | Stores actual query result |
| No extra storage | Requires storage |
| Always shows latest data | Stores snapshot |
| No refresh needed | Refresh required |
| Slower for complex reports | Faster for reports |

---

# 📁 Project Structure

## File 1 - view_basics.sql

Topics Covered:

- Create View
- Use View
- Security Views
- Filtered Views
- Employee Views

---

## File 2 - materialized_views.sql

Topics Covered:

- Materialized Views
- Refresh Operations
- Reporting Optimization
- Dashboard Queries
- Department Reports

---

## File 3 - view_management.sql

Topics Covered:

- CREATE VIEW
- CREATE OR REPLACE VIEW
- ALTER VIEW
- DROP VIEW
- Updatable Views
- Non-Updatable Views

---

## File 4 - assignments_with_solutions.sql

Topics Covered:

- Practice Questions
- SQL Assignments
- Interview Questions
- View Revision
- Materialized View Revision

---

## File 5 - mini_project.sql

Project:

Employee Reporting & Analytics System

Features:

- Employee Security View
- IT Department View
- High Salary Employee View
- Department Report View
- Dashboard Materialized View
- Analytics Queries

---

# 🌍 Real-World Applications

Views and Materialized Views are widely used in:

- Banking Systems
- ERP Applications
- HR Management Systems
- Inventory Management Systems
- Hospital Management Systems
- E-Commerce Platforms
- Business Intelligence Tools
- Reporting Dashboards
- Analytics Platforms

---

# 🎤 Interview Questions

## What is a View?

A virtual table based on a SQL query.

---

## Does a View store data?

No.

A View stores only the query definition.

---

## What is a Materialized View?

A database object that stores the actual result of a query.

---

## Does a Materialized View automatically update?

No.

It must be refreshed manually.

---

## Which command updates a Materialized View?

```sql
REFRESH MATERIALIZED VIEW view_name;
```

---

## What is CREATE OR REPLACE VIEW?

Used to modify an existing view without dropping it.

---

## Does dropping a View delete the original table?

No.

Only the view is removed.

---

## Which is better for dashboards and reports?

Materialized View.

---

## Can Views improve security?

Yes.

Views can hide sensitive columns and expose only required information.

---

# 📈 Skills Gained

After completing this module, you can:

- Create and manage Views
- Implement Security Views
- Build Reusable Query Layers
- Create Materialized Views
- Optimize Reporting Queries
- Build Dashboard Data Sources
- Manage View Lifecycle
- Understand PostgreSQL Reporting Architecture

---

# 🏆 Conclusion

Views and Materialized Views are essential PostgreSQL features for data abstraction, security, query simplification, and performance optimization. They are heavily used in enterprise applications, reporting systems, analytics platforms, and business intelligence solutions.

Understanding these concepts is crucial for database developers, backend engineers, data analysts, and PostgreSQL professionals.

---

### Learning Journey

30 Days PostgreSQL Challenge 🚀
