# DAY 16 - INDEXING IN POSTGRESQL 🚀

## 📌 Overview

Indexing is one of the most important performance optimization techniques in PostgreSQL. An index helps the database locate data faster without scanning every row in a table.

In large databases containing thousands or millions of records, indexes significantly improve query performance and reduce search time.

---

## 🎯 Learning Objectives

In this module, you will learn:

- What is Indexing?
- Why Indexes are used
- Advantages and Disadvantages of Indexes
- B-Tree Index
- Unique Index
- Composite Index
- Partial Index
- Primary Key Index
- Sequential Scan
- Index Scan
- Query Planner
- EXPLAIN
- EXPLAIN ANALYZE
- Query Performance Optimization

---

## 🧠 What is an Index?

An Index is a special database object that improves the speed of data retrieval operations.

Without an index, PostgreSQL performs a Sequential Scan and checks rows one by one.

With an index, PostgreSQL can directly locate the required rows, resulting in much faster query execution.

---

## 📚 Index Types Covered

### 1. B-Tree Index

Default index type in PostgreSQL.

Best for:

- =
- >
- <
- >=
- <=
- BETWEEN
- ORDER BY

Example:

```sql
CREATE INDEX idx_salary
ON employees(salary);
```

---

### 2. Unique Index

Prevents duplicate values and improves search performance.

Example:

```sql
CREATE UNIQUE INDEX idx_email
ON employees(email);
```

Use Cases:

- Email
- Username
- Employee ID
- Account Number

---

### 3. Composite Index

Created on multiple columns.

Example:

```sql
CREATE INDEX idx_dept_salary
ON employees(department, salary);
```

Best for:

```sql
WHERE department = 'IT'
AND salary > 60000;
```

---

### 4. Partial Index

Indexes only rows matching a specific condition.

Example:

```sql
CREATE INDEX idx_high_salary
ON employees(salary)
WHERE salary > 70000;
```

Benefits:

- Smaller index size
- Faster performance
- Reduced storage usage

---

## ⚡ Query Performance Concepts

### Sequential Scan

Reads rows one by one.

Usually used for small tables.

---

### Index Scan

Uses indexes to find rows quickly.

Usually used for large tables.

---

### Query Planner

PostgreSQL automatically decides whether to use:

- Sequential Scan
- Index Scan

based on estimated execution cost.

---

## 🔍 EXPLAIN

Shows the estimated execution plan.

Example:

```sql
EXPLAIN
SELECT *
FROM employees
WHERE emp_id = 100;
```

---

## 🔍 EXPLAIN ANALYZE

Executes the query and shows actual execution statistics.

Example:

```sql
EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE emp_id = 100;
```

Shows:

- Actual execution time
- Actual rows processed
- Actual execution plan

---

## 📁 Project Structure

### File 1 - index_basics.sql

Topics Covered:

- Creating Indexes
- Viewing Indexes
- Dropping Indexes
- Basic Search Optimization

---

### File 2 - index_types.sql

Topics Covered:

- B-Tree Index
- Unique Index
- Composite Index
- Partial Index
- Primary Key Index

---

### File 3 - index_performance.sql

Topics Covered:

- Query Planner
- Sequential Scan
- Index Scan
- EXPLAIN
- EXPLAIN ANALYZE
- Query Optimization

---

### File 4 - assignments_with_solutions.sql

Topics Covered:

- Practice Assignments
- Interview Questions
- SQL Exercises
- Revision Tasks

---

### File 5 - mini_project.sql

Project:

Employee Search Optimization System

Features:

- Employee ID Search
- Email Search
- Department Search
- Salary Filtering
- Performance Analysis
- Query Optimization

---

## 🌍 Real World Applications

Indexes are widely used in:

- Banking Systems
- ATM Applications
- E-Commerce Platforms
- ERP Systems
- Inventory Management
- Hospital Management Systems
- Social Media Platforms
- Search Engines

---

## 🎤 Interview Questions

### What is an Index?

A database object used to improve data retrieval speed.

---

### Which operation benefits most from indexing?

SELECT

---

### What is PostgreSQL's default index type?

B-Tree Index

---

### What is a Composite Index?

An index created on multiple columns.

---

### What is a Partial Index?

An index created only for rows matching a condition.

---

### What is the difference between EXPLAIN and EXPLAIN ANALYZE?

| EXPLAIN | EXPLAIN ANALYZE |
|----------|----------------|
| Estimated Plan | Actual Execution |
| Does Not Run Query | Runs Query |
| Faster | Slightly Slower |

---

## 📈 Skills Gained

By completing this module, you learned:

- PostgreSQL Indexing Fundamentals
- Query Optimization Techniques
- Performance Analysis
- Execution Plan Interpretation
- Real-World Indexing Strategies
- Database Performance Tuning Basics

---

## 🏆 Conclusion

Indexing is a critical PostgreSQL feature used to improve query performance and optimize large databases. Understanding how indexes work and how PostgreSQL chooses execution plans is essential for database developers, backend engineers, and data professionals.

---

## 👩‍💻 Author

**Deepika Gautam**
