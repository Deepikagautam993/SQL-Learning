# 🚀 DAY 20 - INDEXING & QUERY OPTIMIZATION (PostgreSQL)

## 📌 Overview

This repository contains **Day 20 of PostgreSQL learning series**, focused on **Indexing and Query Optimization**.

It explains how PostgreSQL improves performance using indexes and how query execution works internally.

---

# 🎯 Topics Covered

- What is Indexing?
- Why Indexing is used
- Types of Indexes:
  - B-Tree Index
  - Unique Index
  - Composite Index
  - Partial Index
  - Expression Index
- Sequential Scan vs Index Scan
- EXPLAIN & EXPLAIN ANALYZE
- Query Optimization Techniques
- Real-world performance examples

---

# 📁 File Included

## 📄 `indexing_query_optimization.sql`

This file includes:

- Employee table creation
- Sample data insertion
- All types of indexes implementation
- Query examples using indexes
- EXPLAIN & EXPLAIN ANALYZE usage
- Performance comparison examples
- Optimization best practices

---

# 🧠 Key Concepts

## 🔥 Indexing

An index is a database structure that improves the speed of data retrieval operations.

---

## ⚡ Types of Indexes

| Type | Description |
|------|-------------|
| B-Tree | Default index used for most operations |
| Unique Index | Ensures no duplicate values |
| Composite Index | Index on multiple columns |
| Partial Index | Index on selected rows |
| Expression Index | Index on expressions or functions |

---

## 🔄 Execution Flow

```
SQL Query
   ↓
Parser
   ↓
Planner (creates execution plan)
   ↓
Executor (runs query)
```

---

## 📊 Scan Types

### Sequential Scan
- Reads full table row by row
- Slow for large datasets

### Index Scan
- Uses index structure
- Faster and optimized

---

# ⚡ EXPLAIN vs EXPLAIN ANALYZE

| Command | Purpose |
|----------|--------|
| EXPLAIN | Shows execution plan |
| EXPLAIN ANALYZE | Shows actual execution time |

---

# 🏢 Real-World Use Cases

- Banking systems 🏦
- E-commerce platforms 🛒
- HR management systems 👨‍💼
- Large-scale data systems 📊
- Search optimization engines 🔍

---

# 🚀 Performance Rules

✔ Use indexes for frequently searched columns  
✔ Avoid SELECT * for large tables  
✔ Use WHERE conditions properly  
✔ Use composite indexes for multi-column filtering  
✔ Avoid unnecessary indexes (slow writes)

---

# 🧠 Interview Questions

### Q1: What is indexing?
A technique to improve database query performance.

---

### Q2: Does indexing always improve performance?
No, it improves SELECT queries but slows INSERT/UPDATE/DELETE.

---

### Q3: What is Sequential Scan?
Reading full table row by row.

---

### Q4: What is EXPLAIN used for?
To view query execution plan.

👉 Advanced SQL Queries  
👉 Joins + Subqueries + Window Functions
