-- ============================================================
-- DAY 21 - TRANSACTIONS IN POSTGRESQL
-- FILE 3: TRANSACTIONS PRACTICE LAB
-- ============================================================

-- ============================================================
-- OBJECTIVE
-- ============================================================

/*

This file is designed for practice.

Goals:

✔ Understand BEGIN
✔ Understand COMMIT
✔ Understand ROLLBACK
✔ Understand SAVEPOINT
✔ Build confidence using transactions
✔ Learn real-world transaction handling

Important:

Run each exercise separately.

Observe results carefully.

*/

-- ============================================================
-- SETUP SECTION
-- ============================================================

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (

    account_id INT PRIMARY KEY,
    holder_name VARCHAR(100),
    balance DECIMAL(10,2)

);

INSERT INTO accounts VALUES
(1,'Aman',10000),
(2,'Riya',5000),
(3,'Neha',7000),
(4,'Karan',3000);

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 1
-- SIMPLE COMMIT
-- ============================================================

/*

Task:

Transfer ₹1000
from Aman to Riya.

Expected Result:

Aman = 9000
Riya = 6000

*/

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 2
-- SIMPLE ROLLBACK
-- ============================================================

/*

Task:

Deduct ₹500 from Karan

Then cancel transaction.

Expected Result:

No change.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 4;

ROLLBACK;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 3
-- MULTIPLE UPDATES
-- ============================================================

/*

Task:

Increase salary-like balance
for all users by ₹100.

Save permanently.

*/

BEGIN;

UPDATE accounts
SET balance = balance + 100;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 4
-- SAVEPOINT PRACTICE
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

ROLLBACK TO sp1;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 5
-- MULTIPLE SAVEPOINTS
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance - 200
WHERE account_id = 1;

SAVEPOINT first_step;

UPDATE accounts
SET balance = balance + 100
WHERE account_id = 2;

SAVEPOINT second_step;

UPDATE accounts
SET balance = balance + 100
WHERE account_id = 3;

ROLLBACK TO second_step;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 6
-- COMPLETE TRANSACTION FAILURE
-- ============================================================

/*

Imagine an error occurs.

Cancel everything.

*/

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

ROLLBACK;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 7
-- PAYMENT SYSTEM
-- ============================================================

/*

Customer Payment Flow

1. Deduct amount
2. Add amount
3. Save transaction

*/

BEGIN;

UPDATE accounts
SET balance = balance - 300
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 300
WHERE account_id = 3;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 8
-- ATM WITHDRAWAL
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 2;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 9
-- CANCELLED ATM TRANSACTION
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 2;

ROLLBACK;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 10
-- ONLINE SHOPPING
-- ============================================================

/*

Customer purchases product.

1. Deduct money
2. Update inventory
3. Confirm order

*/

BEGIN;

SAVEPOINT order_created;

SAVEPOINT inventory_updated;

COMMIT;

-- ============================================================
-- EXERCISE 11
-- UNIVERSITY REGISTRATION
-- ============================================================

BEGIN;

SAVEPOINT student_created;

SAVEPOINT department_assigned;

ROLLBACK TO department_assigned;

COMMIT;

-- ============================================================
-- EXERCISE 12
-- CHECKPOINT TEST
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 1;

SAVEPOINT bonus_added;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

ROLLBACK TO bonus_added;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 13
-- RELEASE SAVEPOINT
-- ============================================================

BEGIN;

SAVEPOINT temp_sp;

UPDATE accounts
SET balance = balance + 50
WHERE account_id = 3;

RELEASE SAVEPOINT temp_sp;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- EXERCISE 14
-- INTERVIEW CHALLENGE
-- ============================================================

/*

Question:

What happens here?

BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

ROLLBACK TO sp1;

COMMIT;

Answer:

First update remains.
Second update is cancelled.

*/

-- ============================================================
-- EXERCISE 15
-- REAL BANKING TRANSFER
-- ============================================================

BEGIN;

UPDATE accounts
SET balance = balance - 2000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 4;

COMMIT;

SELECT * FROM accounts;

-- ============================================================
-- SELF PRACTICE QUESTIONS
-- ============================================================

/*

Q1.
Transfer ₹500 from Riya to Neha.

--------------------------------

Q2.
Add ₹1000 to all accounts
and then rollback.

--------------------------------

Q3.
Create two savepoints and
rollback to first savepoint.

--------------------------------

Q4.
Perform three updates and
cancel only the last update.

--------------------------------

Q5.
Simulate online payment system
using savepoints.

*/

-- ============================================================
-- REVISION SHEET
-- ============================================================

/*

BEGIN
Starts transaction.

COMMIT
Saves changes permanently.

ROLLBACK
Cancels complete transaction.

SAVEPOINT
Creates checkpoint.

ROLLBACK TO SAVEPOINT
Returns to checkpoint.

RELEASE SAVEPOINT
Removes checkpoint.

Most Common Uses:

✔ Banking
✔ ATM
✔ Payment Gateway
✔ Online Shopping
✔ Ticket Booking
✔ Student Registration

*/

-- ============================================================
-- END OF FILE
-- ============================================================