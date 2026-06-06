# DAY 19 - TRIGGERS IN POSTGRESQL 🚀

## 📌 Overview

This repository contains **Day 19 of PostgreSQL learning series**, focused on **Triggers**. Triggers are special database objects that automatically execute when specific events (INSERT, UPDATE, DELETE) occur on a table.

They are widely used in real-world systems for:
- Data validation
- Audit logging
- Security enforcement
- Automatic database actions

---

# 🎯 What You Will Learn

- What is a Trigger?
- Types of Triggers (BEFORE / AFTER)
- NEW and OLD concepts
- INSERT / UPDATE / DELETE triggers
- Validation using triggers
- Audit logging system
- Real-world mini project implementation
- Interview questions + practice sets

---

# 📁 Files in This Repository

## 1. `trigger_basics.sql`
- Introduction to triggers
- Insert, update, delete logging system
- Employee + audit table setup
- Basic trigger functions

---

## 2. `trigger_validation.sql`
- BEFORE INSERT triggers
- Salary validation rules
- Name validation
- Department validation
- Data integrity enforcement

---

## 3. `trigger_audit_update_delete.sql`
- Advanced audit system
- UPDATE tracking (OLD vs NEW values)
- DELETE tracking system
- Full history logging mechanism

---

## 4. `trigger_mini_project.sql`
- Complete employee management system
- Validation + audit combined
- Real-world database architecture
- Production-level trigger design

---

## 5. `trigger_assignments_with_solutions.sql`
- Practice questions
- Trigger-based problems
- Solutions included
- Interview preparation exercises

---

# 🧠 Key Concepts Covered

## 🔥 Trigger Types
- BEFORE Trigger → Used for validation
- AFTER Trigger → Used for logging
- INSTEAD OF Trigger → Used with views

---

## 🔄 Special Keywords

| Keyword | Meaning |
|--------|--------|
| NEW | New row data (INSERT / UPDATE) |
| OLD | Old row data (UPDATE / DELETE) |

---

## ⚡ Execution Flow

```text
User performs INSERT / UPDATE / DELETE
        ↓
Trigger gets activated automatically
        ↓
Trigger function executes
        ↓
Action is logged or validated
```

---

# 🏢 Real-World Applications

Triggers are used in:

- Banking systems 🏦
- HR management systems 👨‍💼
- E-commerce platforms 🛒
- Government databases 🏛️
- Inventory systems 📦
- Security audit systems 🔐

---

# 📊 Example Use Cases

### ✔ Audit Logging
Tracks all changes in employee data

### ✔ Data Validation
Prevents invalid salary or incorrect data entry

### ✔ Automatic History Tracking
Stores old and new values of records

---

# 🎯 Interview Questions

### Q1: What is a Trigger?
A database object that automatically executes when an event occurs.

---

### Q2: Difference between BEFORE and AFTER trigger?
- BEFORE → Validation
- AFTER → Logging

---

### Q3: What are NEW and OLD?
- NEW → New row data
- OLD → Previous row data

---

### Q4: Can triggers be called manually?
No, they are automatically executed by the database.

---

# 🚀 Skills You Gain

- Trigger creation and usage
- Database automation
- Audit system design
- Data validation techniques
- Real-world database architecture

---

# 🏁 Conclusion

Triggers are a powerful feature of PostgreSQL that help automate database operations and maintain data integrity. This module gives you both **theory + practical + real-world project experience**.
