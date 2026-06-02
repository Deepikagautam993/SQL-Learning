# DAY 15 - DYNAMIC SQL IN POSTGRESQL 🚀

## 📌 Overview

Dynamic SQL is a technique where SQL queries are created and executed at runtime instead of being hardcoded.

It is used when query structure is not fixed and needs to be generated dynamically.

---

## 🧠 What is Dynamic SQL?

Dynamic SQL means:

- SQL query is stored as a string  
- Query is built at runtime  
- Executed using EXECUTE command  

---

## ⚡ Why Dynamic SQL?

Used when:

- Table name is not fixed  
- Column name is not fixed  
- Query depends on user input  
- Admin dashboards  
- Reporting systems  
- Generic database tools  

---

## 🛠️ Syntax

```sql
EXECUTE 'SQL QUERY';
```

---

## 📁 Files in This Module

### 1. dynamic_sql_basics.sql
- Introduction to Dynamic SQL
- EXECUTE statement
- Simple SELECT queries
- Table creation
- Basic runtime execution

---

### 2. advanced_dynamic_sql.sql
- Dynamic table name
- Dynamic WHERE clause
- Dynamic INSERT
- Dynamic UPDATE
- Dynamic DELETE
- String concatenation (||)

---

### 3. practice_dynamic_sql.sql
- Interview practice questions
- SELECT, INSERT, UPDATE, DELETE tasks
- Condition-based queries
- Hands-on exercises

---

### 4. assignments_with_solutions.sql
- Exam-style assignments
- Solved questions
- Theory + practical
- Interview preparation

---

### 5. mini_project.sql

## 🧑‍💻 Project: Dynamic Employee Management System

### Features:
- Dynamic SELECT operations
- Dynamic INSERT operations
- Dynamic UPDATE operations
- Dynamic DELETE operations
- Runtime filtering
- Flexible query execution

---

## 📊 Example

### Dynamic SELECT

```sql
DO $$

DECLARE
    query TEXT;
BEGIN

    query := 'SELECT * FROM employees';

    EXECUTE query;

END $$;
```

---

### Dynamic Table Name

```sql
DO $$

DECLARE
    table_name TEXT := 'employees';
    query TEXT;
BEGIN

    query := 'SELECT * FROM ' || table_name;

    EXECUTE query;

END $$;
```

---

## ⚠️ Important Points

- EXECUTE runs dynamic SQL
- Queries are built at runtime
- Uses TEXT variables
- String concatenation uses ||
- Powerful but risky (SQL Injection)

---

## 🌍 Real World Applications

- Admin dashboards
- Reporting tools
- Search systems
- ERP systems
- Multi-tenant applications
- Data migration tools

---

## 📚 Key Concepts Learned

- Dynamic SQL concept
- EXECUTE statement
- Runtime query building
- Dynamic CRUD operations
- String concatenation in SQL
- Real-world usage

---

## 🎯 Conclusion

Dynamic SQL provides flexibility to build powerful database applications where queries are not fixed and need runtime generation.

---

## 👩‍💻 Author

Deepika Gautam  
Skills: Python | SQL | PostgreSQL | HTML | CSS
```
