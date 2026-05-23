# Day 05 - SQL JOINS

# Overview

Day 05 focused on one of the most important SQL concepts used in Data Analytics and Business Intelligence:

- SQL JOINS

This topic is heavily used in:
- Data Analyst roles
- dashboard development
- reporting systems
- business analytics
- AIML datasets
- SQL interviews

The primary objective of this day was to understand how multiple related tables are connected and analyzed using SQL JOIN operations.

---

# Topics Covered

## INNER JOIN
Returns only matching rows from both tables.

### Concepts Learned
- Matching records
- ON condition
- Relationship mapping
- Professional JOIN syntax

### Real-World Usage
- Employee department mapping
- Customer order analysis
- Product sales reports

---

## LEFT JOIN
Returns all rows from the LEFT table and matching rows from the RIGHT table.

### Concepts Learned
- Missing data analysis
- NULL generation
- Preserved rows

### Real-World Usage
- Customers without orders
- Employees without departments
- Products without sales

---

## RIGHT JOIN
Returns all rows from the RIGHT table and matching rows from the LEFT table.

### Concepts Learned
- Reverse relationship analysis
- Missing mapping detection

---

## FULL OUTER JOIN
Returns all rows from both tables.

### Concepts Learned
- Unmatched record analysis
- Data reconciliation
- Audit reporting

---

# Important Concepts Learned

## Primary Key
Unique identifier of a table.

## Foreign Key
Column used to connect related tables.

## NULL Handling
Understanding missing matches during JOIN operations.

## JOIN Execution Flow

```text id="readmejoin1"
FROM
→ JOIN
→ ON
→ WHERE
→ GROUP BY
→ HAVING
→ SELECT
→ ORDER BY
→ LIMIT
```

---

# Files Included

| File Name | Description |
|---|---|
| inner_join.sql | INNER JOIN queries |
| left_join.sql | LEFT JOIN queries |
| right_join.sql | RIGHT JOIN queries |
| full_outer_join.sql | FULL OUTER JOIN queries |
| join_practice_queries.sql | Advanced JOIN practice |
| assignments.sql | Assignment solutions |
| mini_project.sql | Employee Analytics Management System |

---

# Mini Project

# Employee Analytics Management System

## Project Objective

This project simulates a real-world employee analytics system used by companies to:
- manage employee data,
- analyze departments,
- generate salary reports,
- detect missing mappings,
- and perform business analytics.

---

# Features Implemented

## Employee-Department Mapping
Using INNER JOIN.

## Missing Employee Analysis
Using LEFT JOIN.

## Missing Department Analysis
Using RIGHT JOIN.

## Unmatched Record Detection
Using FULL OUTER JOIN.

## KPI Reporting
Using:
- COUNT()
- AVG()
- GROUP BY
- HAVING

---

# SQL Skills Practiced

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- GROUP BY with JOIN
- HAVING with JOIN
- Aggregate Functions
- NULL handling

---

# Business Understanding Developed

This day helped in understanding how companies:
- connect related data,
- analyze employee records,
- build dashboards,
- and generate business reports using SQL joins.

---

# Most Important Learning

```text id="readmejoin2"
SQL JOINs combine related business data using matching columns.
```

---

# Interview Concepts Covered

- INNER JOIN vs LEFT JOIN
- LEFT JOIN vs RIGHT JOIN
- FULL OUTER JOIN logic
- NULL behavior
- COUNT(*) vs COUNT(column)
- JOIN execution order
- Primary Key vs Foreign Key

---

# Tools Used

- PostgreSQL
- VS Code
- GitHub

---

# Learning Outcome

After completing Day 05, I can now:
- combine related tables,
- analyze relationships,
- identify missing data,
- write analytical JOIN queries,
- and build business reports using SQL JOINs.

---

# Conclusion

Day 05 was one of the biggest milestones in my SQL journey.

This day strengthened my understanding of:
- relational databases,
- SQL joins,
- analytics reporting,
- and real-world business queries.

These concepts are essential for:
- Data Analyst roles
- AIML datasets
- dashboard systems
- SQL interviews
- Business Intelligence workflows
