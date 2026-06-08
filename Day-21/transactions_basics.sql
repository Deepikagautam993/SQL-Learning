-- ============================================================
-- DAY 21 - TRANSACTIONS IN POSTGRESQL
-- FILE 1: TRANSACTION BASICS
-- ============================================================

-- ============================================================
-- INTRODUCTION
-- ============================================================

/*

A Transaction is a group of one or more SQL statements that
are executed as a single unit of work.

A transaction follows the principle:

    Either ALL operations succeed
    OR
    NONE of the operations succeed.

Transactions help maintain:

1. Data Consistency
2. Data Integrity
3. Reliability
4. Accuracy

Real-world examples:

- Bank money transfer
- Online shopping payment
- Ticket booking systems
- ATM withdrawal
- Inventory management

*/

-- ============================================================
-- CREATE SAMPLE TABLE
-- ============================================================

CREATE TABLE accounts (

    account_id INT PRIMARY KEY,
    holder_name VARCHAR(100),
    balance DECIMAL(10,2)

);

-- ============================================================
-- INSERT SAMPLE DATA
-- ============================================================

INSERT INTO accounts VALUES
(1, 'Aman', 5000),
(2, 'Riya', 2000),
(3, 'Neha', 8000);

-- ============================================================
-- VIEW DATA
-- ============================================================

SELECT * FROM accounts;

-- ============================================================
-- BEGIN TRANSACTION
-- ============================================================

/*

BEGIN starts a transaction.

Changes made after BEGIN are not permanently saved
until COMMIT is executed.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

-- Changes are currently temporary

SELECT * FROM accounts;

-- ============================================================
-- COMMIT
-- ============================================================

/*

COMMIT permanently saves all changes made
during the transaction.

After COMMIT:

✔ Data becomes permanent
✔ Changes cannot be undone using ROLLBACK

*/

COMMIT;

-- ============================================================
-- VERIFY SAVED DATA
-- ============================================================

SELECT * FROM accounts;

-- ============================================================
-- ROLLBACK EXAMPLE
-- ============================================================

/*

ROLLBACK cancels all changes made
during the current transaction.

Database returns to the state
before the transaction started.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

SELECT * FROM accounts;

ROLLBACK;

-- Data restored

SELECT * FROM accounts;

-- ============================================================
-- SIMPLE MONEY TRANSFER
-- ============================================================

/*

Transfer ₹1000 from Aman to Riya

Step 1:
Deduct money from sender

Step 2:
Add money to receiver

Both operations must succeed together.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;

-- ============================================================
-- CHECK FINAL RESULT
-- ============================================================

SELECT * FROM accounts;

-- ============================================================
-- FAILED TRANSACTION EXAMPLE
-- ============================================================

/*

Suppose a system error occurs.

Transaction should not leave
the database in an inconsistent state.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

-- Intentional error

-- UPDATE wrong_table
-- SET amount = 500;

ROLLBACK;

-- Data remains unchanged

SELECT * FROM accounts;

-- ============================================================
-- ACID PROPERTIES
-- ============================================================

/*

A = Atomicity

Either all operations succeed
or none succeed.

Example:
Money transfer.

---------------------------------

C = Consistency

Database remains valid before
and after transaction.

Example:
Total balance remains correct.

---------------------------------

I = Isolation

Multiple transactions do not
interfere with each other.

Example:
Two users updating accounts simultaneously.

---------------------------------

D = Durability

Once COMMIT is executed,
changes become permanent.

Even after:

- Power failure
- Server restart
- Database crash

Committed data remains safe.

*/

-- ============================================================
-- ACID DEMONSTRATION
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance - 200
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 200
WHERE account_id = 2;

COMMIT;

-- ============================================================
-- REVISION NOTES
-- ============================================================

/*

BEGIN
Starts a transaction.

COMMIT
Saves all changes permanently.

ROLLBACK
Cancels all changes.

Transaction
Group of SQL statements executed as one unit.

Benefits:
✔ Data Safety
✔ Data Consistency
✔ Reliability
✔ Error Recovery

Most Common Real-World Uses:
✔ Banking
✔ E-commerce
✔ Payment Systems
✔ Inventory Management

*/

-- ============================================================
-- END OF FILE
-- ============================================================