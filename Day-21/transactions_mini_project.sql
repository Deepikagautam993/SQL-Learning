-- ============================================================
-- DAY 21 - TRANSACTIONS IN POSTGRESQL
-- FILE 5: MINI PROJECT
-- BANK MANAGEMENT SYSTEM
-- ============================================================

-- ============================================================
-- PROJECT OVERVIEW
-- ============================================================

/*

PROJECT NAME:
Bank Management System

OBJECTIVE:

To understand how transactions are used
in real-world banking applications.

Features:

✔ Create Bank Accounts
✔ Transfer Money
✔ Maintain Transaction History
✔ Ensure Data Consistency
✔ Use COMMIT and ROLLBACK
✔ Demonstrate ACID Properties

Real-Life Use Cases:

- Internet Banking
- Mobile Banking
- ATM Transactions
- UPI Transfers
- Wallet Applications

*/

-- ============================================================
-- STEP 1: CREATE ACCOUNTS TABLE
-- ============================================================

CREATE TABLE accounts (

    account_id INT PRIMARY KEY,
    holder_name VARCHAR(100),
    balance DECIMAL(12,2)

);

-- ============================================================
-- STEP 2: CREATE TRANSACTION HISTORY TABLE
-- ============================================================

CREATE TABLE transaction_history (

    transaction_id SERIAL PRIMARY KEY,
    sender_account INT,
    receiver_account INT,
    amount DECIMAL(12,2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- ============================================================
-- STEP 3: INSERT SAMPLE DATA
-- ============================================================

INSERT INTO accounts VALUES
(101,'Aman',15000),
(102,'Riya',8000),
(103,'Neha',12000),
(104,'Karan',5000);

-- ============================================================
-- VIEW ACCOUNTS
-- ============================================================

SELECT * FROM accounts;

-- ============================================================
-- PROJECT SCENARIO 1
-- SIMPLE MONEY TRANSFER
-- ============================================================

/*

Transfer ₹2000

Sender:
Aman (101)

Receiver:
Riya (102)

*/

BEGIN;

UPDATE accounts
SET balance = balance - 2000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 102;

INSERT INTO transaction_history
(
    sender_account,
    receiver_account,
    amount
)
VALUES
(
    101,
    102,
    2000
);

COMMIT;

-- ============================================================
-- CHECK UPDATED DATA
-- ============================================================

SELECT * FROM accounts;

SELECT * FROM transaction_history;

-- ============================================================
-- PROJECT SCENARIO 2
-- FAILED TRANSACTION
-- ============================================================

/*

Suppose transfer fails.

No money should be lost.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 3000
WHERE account_id = 101;

-- System Error Simulation

ROLLBACK;

-- ============================================================
-- VERIFY DATA
-- ============================================================

SELECT * FROM accounts;

-- ============================================================
-- PROJECT SCENARIO 3
-- SAVEPOINT IMPLEMENTATION
-- ============================================================

/*

Transfer ₹1000

Create checkpoint before credit operation.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 102;

SAVEPOINT credit_stage;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 103;

ROLLBACK TO credit_stage;

COMMIT;

-- ============================================================
-- RESULT
-- ============================================================

/*

Debit remains.

Credit operation cancelled.

Used only for learning SAVEPOINT behavior.

*/

SELECT * FROM accounts;

-- ============================================================
-- PROJECT SCENARIO 4
-- MULTIPLE TRANSFERS
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 104;

INSERT INTO transaction_history
(
    sender_account,
    receiver_account,
    amount
)
VALUES
(
    101,
    104,
    500
);

UPDATE accounts
SET balance = balance - 700
WHERE account_id = 102;

UPDATE accounts
SET balance = balance + 700
WHERE account_id = 103;

INSERT INTO transaction_history
(
    sender_account,
    receiver_account,
    amount
)
VALUES
(
    102,
    103,
    700
);

COMMIT;

-- ============================================================
-- VIEW RESULTS
-- ============================================================

SELECT * FROM accounts;

SELECT * FROM transaction_history;

-- ============================================================
-- PROJECT SCENARIO 5
-- ATM WITHDRAWAL SYSTEM
-- ============================================================

/*

Customer withdraws ₹1000.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 104;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- PROJECT SCENARIO 6
-- ATM FAILURE
-- ============================================================

/*

Cash not dispensed.

Transaction cancelled.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 104;

ROLLBACK;

SELECT * FROM accounts;

-- ============================================================
-- PROJECT SCENARIO 7
-- ONLINE PAYMENT SYSTEM
-- ============================================================

/*

Step 1:
Deduct money

Step 2:
Create payment record

Step 3:
Generate receipt

Use savepoints.

*/

BEGIN;

SAVEPOINT payment_started;

SAVEPOINT payment_record_created;

SAVEPOINT receipt_generated;

COMMIT;

-- ============================================================
-- ACID PROPERTY DEMONSTRATION
-- ============================================================

/*

ATOMICITY

Either all transfer operations succeed
or all fail.

---------------------------------------

CONSISTENCY

Total money remains valid.

---------------------------------------

ISOLATION

Transactions remain independent.

---------------------------------------

DURABILITY

After COMMIT, changes remain permanent.

*/

-- ============================================================
-- REPORT QUERIES
-- ============================================================

-- View all accounts

SELECT *
FROM accounts;

-- View transaction history

SELECT *
FROM transaction_history;

-- Total transferred amount

SELECT SUM(amount)
AS total_transfer_amount
FROM transaction_history;

-- Number of transactions

SELECT COUNT(*)
AS total_transactions
FROM transaction_history;

-- ============================================================
-- MINI PROJECT QUESTIONS
-- ============================================================

/*

Q1.
Transfer ₹500 from account 101 to 103.

------------------------------------

Q2.
Record transaction history.

------------------------------------

Q3.
Create savepoint after debit.

------------------------------------

Q4.
Rollback credit operation only.

------------------------------------

Q5.
Show all transactions.

------------------------------------

Q6.
Find total transferred amount.

------------------------------------

Q7.
Simulate ATM withdrawal.

------------------------------------

Q8.
Simulate ATM failure.

------------------------------------

Q9.
Explain ACID using this project.

------------------------------------

Q10.
Why are transactions critical
in banking systems?

*/

-- ============================================================
-- PROJECT LEARNING OUTCOMES
-- ============================================================

/*

After completing this project,
you should understand:

✔ Transactions

✔ BEGIN

✔ COMMIT

✔ ROLLBACK

✔ SAVEPOINT

✔ ACID Properties

✔ Banking Applications

✔ Transaction Logging

✔ Error Recovery

✔ Data Consistency

*/

-- ============================================================
-- END OF MINI PROJECT
-- ============================================================