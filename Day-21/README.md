# 🚀 DAY 21 - TRANSACTIONS IN POSTGRESQL

## 📖 Overview

This project focuses on **Transactions in PostgreSQL**, one of the most important concepts in database management systems.

A transaction is a group of SQL operations executed as a single unit of work. Transactions ensure that data remains correct, consistent, and reliable even when errors occur.

This repository contains theory, practical examples, assignments, and a mini project designed to provide a complete understanding of PostgreSQL Transactions.

---

# 🎯 Learning Objectives

After completing this project, you will be able to:

- Understand Transactions
- Use BEGIN statement
- Use COMMIT statement
- Use ROLLBACK statement
- Create SAVEPOINTS
- Perform partial rollbacks
- Understand ACID Properties
- Handle transaction failures
- Build banking-style transaction systems
- Implement real-world transaction workflows

---

# 📂 Project Structure

## File 1

### transactions_basics.sql

Topics Covered:

- Introduction to Transactions
- BEGIN
- COMMIT
- ROLLBACK
- Banking Examples
- ACID Properties
- Transaction Flow

---

## File 2

### transactions_savepoint.sql

Topics Covered:

- SAVEPOINT
- ROLLBACK TO SAVEPOINT
- Multiple Savepoints
- RELEASE SAVEPOINT
- Partial Recovery
- Advanced Transaction Control

---

## File 3

### transactions_practice.sql

Topics Covered:

- Practical Exercises
- Banking Scenarios
- ATM Simulations
- Payment System Examples
- Transaction Challenges

---

## File 4

### transactions_assignment_with_solutions.sql

Topics Covered:

- Assignment Questions
- Detailed Solutions
- Theory Questions
- Interview Questions
- Transaction-Based Problems

---

## File 5

### transactions_mini_project.sql

Project:

Bank Management System

Features:

- Account Management
- Money Transfer
- Transaction History
- Error Recovery
- ACID Demonstration

---

# 🧠 What is a Transaction?

A Transaction is a collection of one or more SQL statements executed as a single logical unit.

A transaction follows:

```text
All Operations Succeed
          OR
All Operations Fail
```

This ensures database reliability.

---

# 🏦 Real-World Examples

Transactions are used in:

- Banking Systems
- ATM Machines
- Online Shopping
- Ticket Booking Systems
- Mobile Wallets
- Payment Gateways
- University Registration Systems

---

# 🔄 Transaction Flow

```text
BEGIN
   ↓
Execute SQL Statements
   ↓
Success?
 ↓       ↓
Yes      No
 ↓        ↓
COMMIT  ROLLBACK
```

---

# 🔹 BEGIN

BEGIN starts a transaction.

Example:

```sql
BEGIN;
```

After BEGIN, changes remain temporary until COMMIT is executed.

---

# 🔹 COMMIT

COMMIT permanently saves all changes.

Example:

```sql
COMMIT;
```

After COMMIT:

- Data becomes permanent
- Changes cannot be cancelled using ROLLBACK

---

# 🔹 ROLLBACK

ROLLBACK cancels all changes made during the current transaction.

Example:

```sql
ROLLBACK;
```

The database returns to its previous state.

---

# 🔹 SAVEPOINT

SAVEPOINT creates a checkpoint inside a transaction.

Example:

```sql
SAVEPOINT sp1;
```

Benefits:

- Partial Recovery
- Better Error Handling
- Large Transaction Management

---

# 🔹 ROLLBACK TO SAVEPOINT

Returns transaction to a specific checkpoint.

Example:

```sql
ROLLBACK TO sp1;
```

Only changes after the savepoint are cancelled.

---

# 🔹 RELEASE SAVEPOINT

Removes a savepoint.

Example:

```sql
RELEASE SAVEPOINT sp1;
```

After release, the savepoint cannot be used again.

---

# 🧪 ACID Properties

ACID is the foundation of transaction management.

---

## A - Atomicity

Meaning:

```text
All or Nothing
```

If one operation fails, the entire transaction fails.

Example:

Money transfer between two bank accounts.

---

## C - Consistency

Meaning:

Database remains valid before and after a transaction.

Example:

Total balance remains correct after money transfer.

---

## I - Isolation

Meaning:

Transactions work independently.

One transaction should not interfere with another.

---

## D - Durability

Meaning:

Committed changes remain permanent.

Even after:

- Server Crash
- Power Failure
- System Restart

Data remains safe.

---

# 📊 ACID Summary Table

| Property | Meaning |
|-----------|----------|
| Atomicity | All or Nothing |
| Consistency | Valid Database State |
| Isolation | Independent Transactions |
| Durability | Permanent Data |

---

# 🏦 Banking Example

Money Transfer:

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;
```

Benefits:

- Safe Transfer
- No Data Loss
- Consistent Balances

---

# 📚 Key Takeaways

✔ Transactions maintain data integrity

✔ COMMIT permanently saves data

✔ ROLLBACK cancels changes

✔ SAVEPOINT allows partial recovery

✔ ACID properties ensure reliability

✔ Transactions are critical in banking and payment systems

---

# 🏁 Conclusion

Transactions are one of the most important features of PostgreSQL. They ensure that database operations are reliable, consistent, and safe.

Understanding transactions is essential for building real-world applications such as banking systems, payment gateways, e-commerce platforms, and enterprise software.

---
