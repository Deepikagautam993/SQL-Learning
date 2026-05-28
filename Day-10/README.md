````md id="day10readme"
# DAY 10 - VIEWS IN SQL

## Overview
Day 10 focused on SQL Views, Reporting Views, Security Views, Dashboard Analytics, and Business Intelligence Queries. Views are one of the most important SQL concepts used in enterprise databases, dashboard systems, and reporting applications.

The main objective was to understand how virtual tables work and how views simplify complex SQL queries.

---

# Topics Covered
- Views
- CREATE VIEW
- Accessing Views
- Conditional Views
- CREATE OR REPLACE VIEW
- DROP VIEW
- Security-based Views
- Reporting Views
- Aggregate Views
- Dashboard Views
- Business Intelligence Views
- View vs Table

---

# Key Concepts Learned

## What is View?
A View is a:
```sql id="vw1"
virtual table created from SQL query
````

Views do not store actual data permanently.

They:

* store SQL query
* fetch latest data from original table
* simplify complex queries

---

## CREATE VIEW

Syntax:

```sql id="vw2"
CREATE VIEW view_name AS

SELECT columns
FROM table_name
WHERE condition;
```

Example:

```sql id="vw3"
CREATE VIEW it_employees AS

SELECT *
FROM employees
WHERE department = 'IT';
```

---

## Accessing View

```sql id="vw4"
SELECT *
FROM it_employees;
```

Views behave like normal tables during SELECT operations.

---

## Conditional Views

Views can contain filtering conditions.

Example:

```sql id="vw5"
CREATE VIEW high_salary AS

SELECT *
FROM employees
WHERE salary > 70000;
```

---

## CREATE OR REPLACE VIEW

Used for updating existing views.

Example:

```sql id="vw6"
CREATE OR REPLACE VIEW high_salary AS

SELECT
    emp_name,
    department,
    salary

FROM employees

WHERE salary > 65000;
```

---

## DROP VIEW

Deletes view only.

```sql id="vw7"
DROP VIEW high_salary;
```

Original table remains safe.

---

# View vs Table

| VIEW               | TABLE              |
| ------------------ | ------------------ |
| Virtual structure  | Physical structure |
| Stores query       | Stores actual data |
| Lightweight        | Stores records     |
| Used for reporting | Used for storage   |

---

# Security Using Views

Views help hide sensitive data.

Example:

* hide salary
* hide confidential columns
* allow limited access

Example:

```sql id="vw8"
CREATE VIEW public_employee_data AS

SELECT
    emp_name,
    department
FROM employees;
```

---

# Reporting & Dashboard Views

Views are heavily used in:

* KPI dashboards
* reporting systems
* HR analytics
* financial analytics
* business intelligence

---

# Files Included

## 1. views_basics.sql

Contains:

* CREATE VIEW
* conditional views
* security views
* DROP VIEW
* CREATE OR REPLACE VIEW

---

## 2. advanced_views_analytics.sql

Contains:

* KPI analytics
* dashboard reporting
* business intelligence views
* aggregate reporting

---

## 3. views_practice_questions.sql

Contains:

* practice questions
* reporting exercises
* security-based view practice
* dashboard analytics

---

## 4. assignments_with_solutions.sql

Contains:

* assignments
* complete solutions
* interview theory questions
* business analytics queries

---

## 5. mini_project.sql

Mini project based on:

* employee reporting systems
* KPI dashboards
* business intelligence reporting
* security-based analytics

---

# Mini Project Overview

## Employee Reporting & View Management System

This project demonstrates:

* SQL Views
* Reporting Systems
* Dashboard Queries
* KPI Analytics
* Security Views
* Business Intelligence SQL
* Enterprise SQL Concepts

---

# Real-World Use Cases

Views are used in:

* Power BI
* Tableau
* HR Dashboards
* Financial Reporting
* Dashboard Systems
* Business Intelligence
* Enterprise Databases
* Data Analytics

---

# Skills Developed

* SQL Views
* Reporting Queries
* Dashboard Analytics
* Security-based Query Design
* Aggregate Reporting
* Business Intelligence SQL
* Enterprise Database Concepts
* KPI Dashboard Development

---

# Important Interview Questions

## What is View?

View is:

```sql id="vw9"
virtual table created from query
```

---

## Why use Views?

Views improve:

* readability
* security
* dashboard reporting
* query simplification

---

## Difference between View and Table

| VIEW         | TABLE              |
| ------------ | ------------------ |
| Virtual      | Physical           |
| Stores query | Stores actual data |

---

## What is CREATE OR REPLACE VIEW?

Used for:

```sql id="vw10"
updating existing view
```

---

## What is DROP VIEW?

Used for:

```sql id="vw11"
deleting view only
```

---

# Most Important Learnings

```sql id="vw12"
Views are virtual tables.
```

```sql id="vw13"
Views store queries not data.
```

```sql id="vw14"
CREATE VIEW creates view.
```

```sql id="vw15"
DROP VIEW deletes view only.
```

```sql id="vw16"
CREATE OR REPLACE VIEW updates view.
```

---

# Conclusion

Day 10 provided strong understanding of:

* SQL Views
* Reporting Systems
* Dashboard Analytics
* Security-based Query Design
* KPI Reporting
* Business Intelligence SQL
* Enterprise Database Concepts

These concepts are extremely important for:

* SQL Developers
* Data Analysts
* Business Intelligence Engineers
* Backend Developers
* Database Administrators

```
```

