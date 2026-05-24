# Day 06 - SQL Subqueries

# Overview

Day 06 focused on one of the most important advanced SQL concepts:

- Subqueries

Subqueries are heavily used in:
- Data Analytics
- KPI dashboards
- business reports
- advanced filtering
- SQL interviews
- reporting systems

The main objective of this day was to understand how one query can dynamically depend on another query.

---

# Topics Covered

## Single-Row Subqueries

Single-row subqueries return only one value.

### Concepts Learned
- MAX()
- MIN()
- AVG()
- COUNT()
- Dynamic filtering

### Example Use Cases
- Highest salary employee
- Lowest salary employee
- Employees above average salary

---

## Multiple-Row Subqueries

Multiple-row subqueries return multiple values.

### Concepts Learned
- IN
- NOT IN
- ANY
- ALL
- EXISTS

### Example Use Cases
- Department filtering
- Employee segmentation
- Advanced business filtering

---

## Correlated Subqueries

Correlated subqueries depend on outer query values.

### Concepts Learned
- Row-by-row execution
- Department-level analysis
- Correlation conditions
- Performance understanding

### Example Use Cases
- Employees above department average
- Highest salary employee in each department
- KPI analysis

---

# Important Concepts Learned

## Inner Query Execution
The inner query executes first.

## Dynamic Filtering
Subqueries help generate dynamic query conditions.

## Correlation
Correlated subqueries connect outer and inner queries.

## EXISTS
Checks whether matching rows exist.

---

# Files Included

| File Name | Description |
|---|---|
| single_row_subqueries.sql | Single-row subquery queries |
| multiple_row_subqueries.sql | Multiple-row subquery queries |
| correlated_subqueries.sql | Correlated subquery queries |
| subquery_practice_queries.sql | Advanced subquery practice |
| assignments.sql | Assignment solutions |
| mini_project.sql | Employee Performance Analytics System |

---

# Mini Project

# Employee Performance Analytics System

## Project Objective

This project simulates a real-world employee performance analytics system used by organizations to:
- analyze salaries,
- compare department performance,
- identify top performers,
- and generate KPI reports.

---

# Features Implemented

## Salary Analysis
Using:
- MAX()
- MIN()
- AVG()

## Dynamic Filtering
Using subqueries.

## Department-Level Analytics
Using correlated subqueries.

## Advanced Filtering
Using:
- IN
- EXISTS
- ANY
- ALL

---

# SQL Skills Practiced

- Single-row subqueries
- Multiple-row subqueries
- Correlated subqueries
- IN operator
- EXISTS
- ANY
- ALL
- Aggregate functions

---

# Business Understanding Developed

This day helped in understanding how companies:
- compare employee performance,
- analyze salary trends,
- create advanced reports,
- and perform dynamic filtering using SQL.

---

# Most Important Learning

```text id="readme6a"
Subqueries help build dynamic SQL logic.
```

---

# Important Interview Concepts

- Single-row vs Multiple-row subqueries
- IN vs EXISTS
- ANY vs ALL
- Correlated subqueries
- Execution flow
- Performance understanding

---

# Tools Used

- PostgreSQL
- VS Code
- GitHub

---

# Learning Outcome

After completing Day 06, I can now:
- write advanced SQL filters,
- use nested queries,
- analyze department performance,
- create KPI-based reports,
- and implement correlated query logic.

---

# Conclusion

Day 06 was a major milestone in advanced SQL learning.

This day strengthened my understanding of:
- analytical query building,
- dynamic filtering,
- advanced business logic,
- and real-world SQL reporting systems.

These concepts are essential for:
- Data Analyst roles
- dashboard analytics
- SQL interviews
- Business Intelligence systems
- advanced reporting workflows
