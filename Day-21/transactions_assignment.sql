-- ============================================================
-- DAY 21 - TRANSACTIONS IN POSTGRESQL
-- FILE 4: ASSIGNMENT WITH SOLUTIONS
-- ============================================================

-- ============================================================
-- INTRODUCTION
-- ============================================================

/*

This assignment is designed to test
your understanding of Transactions.

Topics Covered:

✔ BEGIN
✔ COMMIT
✔ ROLLBACK
✔ SAVEPOINT
✔ ROLLBACK TO SAVEPOINT
✔ RELEASE SAVEPOINT
✔ ACID Properties

Complete the questions yourself first,
then compare with the provided solutions.

*/

-- ============================================================
-- DATABASE SETUP
-- ============================================================

DROP TABLE IF EXISTS bank_accounts;

CREATE TABLE bank_accounts (

    account_id INT PRIMARY KEY,
    holder_name VARCHAR(100),
    balance DECIMAL(10,2)

);

INSERT INTO bank_accounts VALUES
(1,'Aman',10000),
(2,'Riya',5000),
(3,'Neha',8000),
(4,'Karan',4000);

SELECT * FROM bank_accounts;

-- ============================================================
-- QUESTION 1
-- ============================================================

/*

Transfer ₹1000
from Aman to Riya.

Use Transaction.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;

-- ============================================================
-- QUESTION 2
-- ============================================================

/*

Deduct ₹500 from Neha
but cancel the transaction.

Expected Result:

No change in balance.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 500
WHERE account_id = 3;

ROLLBACK;

-- ============================================================
-- QUESTION 3
-- ============================================================

/*

Increase balance of all users
by ₹200.

Save changes permanently.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance + 200;

COMMIT;

-- ============================================================
-- QUESTION 4
-- ============================================================

/*

Create a SAVEPOINT after
deducting ₹1000 from Aman.

Then add ₹1000 to Riya.

Rollback only the second operation.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 1;

SAVEPOINT transfer_point;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE account_id = 2;

ROLLBACK TO transfer_point;

COMMIT;

-- ============================================================
-- QUESTION 5
-- ============================================================

/*

Create two SAVEPOINTS.

Rollback to second SAVEPOINT.

Observe result.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 100
WHERE account_id = 1;

SAVEPOINT sp1;

UPDATE bank_accounts
SET balance = balance + 100
WHERE account_id = 2;

SAVEPOINT sp2;

UPDATE bank_accounts
SET balance = balance + 100
WHERE account_id = 3;

ROLLBACK TO sp2;

COMMIT;

-- ============================================================
-- QUESTION 6
-- ============================================================

/*

Simulate ATM withdrawal.

Withdraw ₹2000 from Karan.

Save transaction.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 2000
WHERE account_id = 4;

COMMIT;

-- ============================================================
-- QUESTION 7
-- ============================================================

/*

Simulate failed ATM transaction.

Withdraw ₹1000.

Cancel transaction.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 4;

ROLLBACK;

-- ============================================================
-- QUESTION 8
-- ============================================================

/*

Online Shopping Scenario

Step 1:
Create Order

Step 2:
Update Inventory

Step 3:
Process Payment

Create savepoints
for each stage.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

SAVEPOINT order_created;

SAVEPOINT inventory_updated;

SAVEPOINT payment_processing;

COMMIT;

-- ============================================================
-- QUESTION 9
-- ============================================================

/*

University Registration Scenario

1. Create Student
2. Assign Department
3. Generate Fee Record

Rollback only fee generation stage.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

SAVEPOINT student_created;

SAVEPOINT department_assigned;

SAVEPOINT fee_generated;

ROLLBACK TO fee_generated;

COMMIT;

-- ============================================================
-- QUESTION 10
-- ============================================================

/*

Add ₹500 bonus
to all account holders.

Use transaction.

*/

-- ----------------------------
-- SOLUTION
-- ----------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance + 500;

COMMIT;

-- ============================================================
-- THEORY QUESTIONS
-- ============================================================

/*

Q1. What is a Transaction?

Answer:

A transaction is a group of SQL statements
executed as a single unit of work.

Either all operations succeed
or all operations fail.

------------------------------------------------

Q2. Why are transactions important?

Answer:

Transactions ensure:

✔ Data Consistency
✔ Data Integrity
✔ Reliability
✔ Error Recovery

------------------------------------------------

Q3. What is COMMIT?

Answer:

COMMIT permanently saves all changes
made during a transaction.

------------------------------------------------

Q4. What is ROLLBACK?

Answer:

ROLLBACK cancels all changes
made during a transaction.

------------------------------------------------

Q5. What is SAVEPOINT?

Answer:

SAVEPOINT creates a checkpoint
inside a transaction.

------------------------------------------------

Q6. Difference between
ROLLBACK and ROLLBACK TO SAVEPOINT?

ROLLBACK

Cancels complete transaction.

ROLLBACK TO SAVEPOINT

Cancels only a selected portion.

------------------------------------------------

Q7. What does ACID stand for?

A = Atomicity
C = Consistency
I = Isolation
D = Durability

------------------------------------------------

Q8. Which ACID property means
"All or Nothing"?

Atomicity.

------------------------------------------------

Q9. Which ACID property ensures
permanent storage of committed data?

Durability.

------------------------------------------------

Q10. Which ACID property keeps
transactions independent?

Isolation.

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

1. What is a Transaction?

2. Explain COMMIT and ROLLBACK.

3. What is SAVEPOINT?

4. Difference between COMMIT and SAVEPOINT.

5. Difference between ROLLBACK
   and ROLLBACK TO SAVEPOINT.

6. Explain ACID Properties.

7. Why are transactions important
   in banking systems?

8. Can multiple SAVEPOINTS exist
   in one transaction?

9. What happens if an error occurs
   before COMMIT?

10. What is the purpose of BEGIN?

*/

-- ============================================================
-- REVISION SHEET
-- ============================================================

/*

BEGIN
→ Start Transaction

COMMIT
→ Save Changes

ROLLBACK
→ Cancel All Changes

SAVEPOINT
→ Create Checkpoint

ROLLBACK TO SAVEPOINT
→ Return to Checkpoint

RELEASE SAVEPOINT
→ Remove Checkpoint

ACID

Atomicity
→ All or Nothing

Consistency
→ Valid Data

Isolation
→ Independent Transactions

Durability
→ Permanent Data

*/

-- ============================================================
-- END OF FILE
-- ============================================================