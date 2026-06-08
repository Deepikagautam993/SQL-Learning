-- ============================================================
-- DAY 21 - TRANSACTIONS IN POSTGRESQL
-- FILE 2: SAVEPOINT & ADVANCED TRANSACTION CONTROL
-- ============================================================

-- ============================================================
-- INTRODUCTION
-- ============================================================

/*

In the previous file we learned:

1. BEGIN
2. COMMIT
3. ROLLBACK

Problem:

Suppose a transaction contains many operations.

Example:

Operation 1 ✔
Operation 2 ✔
Operation 3 ✔
Operation 4 ❌
Operation 5 ❌

If we use ROLLBACK:

Everything gets cancelled.

Sometimes we want to cancel only a part
of the transaction instead of cancelling all work.

For this purpose PostgreSQL provides SAVEPOINT.

*/

-- ============================================================
-- CREATE TABLE
-- ============================================================

CREATE TABLE bank_accounts (

    account_id INT PRIMARY KEY,
    holder_name VARCHAR(100),
    balance DECIMAL(10,2)

);

-- ============================================================
-- INSERT SAMPLE DATA
-- ============================================================

INSERT INTO bank_accounts VALUES
(1,'Aman',10000),
(2,'Riya',5000),
(3,'Neha',7000);

-- ============================================================
-- VIEW DATA
-- ============================================================

SELECT * FROM bank_accounts;

-- ============================================================
-- WHAT IS SAVEPOINT?
-- ============================================================

/*

SAVEPOINT creates a checkpoint
inside a transaction.

We can return to that checkpoint
without cancelling the entire transaction.

Think of SAVEPOINT as:

"Temporary Recovery Point"

*/

-- ============================================================
-- BASIC SAVEPOINT EXAMPLE
-- ============================================================

BEGIN;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 1;

SAVEPOINT sp1;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;

-- ============================================================
-- SAVEPOINT WITH ROLLBACK
-- ============================================================

/*

Scenario:

Step 1 succeeds

Step 2 succeeds

Step 3 fails

Instead of cancelling everything,
we return to SAVEPOINT.

*/

BEGIN;

UPDATE bank_accounts
SET balance = balance - 500
WHERE account_id = 1;

SAVEPOINT transfer_point;

UPDATE bank_accounts
SET balance = balance + 500
WHERE account_id = 2;

-- Suppose something goes wrong

ROLLBACK TO transfer_point;

COMMIT;

-- ============================================================
-- RESULT
-- ============================================================

/*

Deduction before SAVEPOINT remains.

Changes after SAVEPOINT are cancelled.

*/

SELECT * FROM bank_accounts;

-- ============================================================
-- MULTIPLE SAVEPOINTS
-- ============================================================

/*

A transaction can contain multiple savepoints.

*/

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
SET balance = balance + 200
WHERE account_id = 3;

SAVEPOINT sp3;

COMMIT;

-- ============================================================
-- MULTIPLE SAVEPOINT ROLLBACK
-- ============================================================

BEGIN;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 1;

SAVEPOINT first_step;

UPDATE bank_accounts
SET balance = balance + 500
WHERE account_id = 2;

SAVEPOINT second_step;

UPDATE bank_accounts
SET balance = balance + 500
WHERE account_id = 3;

-- Error discovered

ROLLBACK TO second_step;

COMMIT;

-- ============================================================
-- EXPLANATION
-- ============================================================

/*

Transaction Flow:

Step 1 ✔

SAVEPOINT first_step

Step 2 ✔

SAVEPOINT second_step

Step 3 ✔

ROLLBACK TO second_step

Result:

Step 3 cancelled

Step 1 and Step 2 remain

*/

-- ============================================================
-- RELEASE SAVEPOINT
-- ============================================================

/*

SAVEPOINT can be removed manually.

Syntax:

RELEASE SAVEPOINT savepoint_name;

After release,
that savepoint can no longer be used.

*/

BEGIN;

SAVEPOINT temp_point;

UPDATE bank_accounts
SET balance = balance + 200
WHERE account_id = 1;

RELEASE SAVEPOINT temp_point;

COMMIT;

-- ============================================================
-- PRACTICAL EXAMPLE:
-- ONLINE SHOPPING SYSTEM
-- ============================================================

/*

Customer places an order.

Step 1:
Create order

Step 2:
Update inventory

Step 3:
Process payment

If payment fails:

Rollback only payment section
instead of cancelling everything.

*/

BEGIN;

-- Order Created

SAVEPOINT order_created;

-- Inventory Updated

SAVEPOINT inventory_updated;

-- Payment Processing

-- Error occurs

ROLLBACK TO inventory_updated;

COMMIT;

-- ============================================================
-- PRACTICAL EXAMPLE:
-- UNIVERSITY MANAGEMENT SYSTEM
-- ============================================================

/*

Student Registration

Step 1:
Create Student Record

Step 2:
Assign Department

Step 3:
Generate Fee Record

If fee generation fails:

Rollback only fee process.

*/

BEGIN;

SAVEPOINT student_created;

SAVEPOINT department_assigned;

ROLLBACK TO department_assigned;

COMMIT;

-- ============================================================
-- DIFFERENCE:
-- ROLLBACK vs ROLLBACK TO SAVEPOINT
-- ============================================================

/*

ROLLBACK

✔ Cancels entire transaction

--------------------------------

ROLLBACK TO SAVEPOINT

✔ Cancels only selected part
✔ Keeps previous successful work

*/

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

/*

Q1. What is SAVEPOINT?

A SAVEPOINT is a checkpoint inside
a transaction that allows partial rollback.

--------------------------------

Q2. Why is SAVEPOINT used?

To undo only a portion of a transaction.

--------------------------------

Q3. Difference between:

ROLLBACK
and
ROLLBACK TO SAVEPOINT

ROLLBACK:
Cancels complete transaction.

ROLLBACK TO SAVEPOINT:
Cancels only work after savepoint.

--------------------------------

Q4. Can multiple savepoints exist?

Yes.

A transaction can contain
multiple savepoints.

*/

-- ============================================================
-- REVISION NOTES
-- ============================================================

/*

SAVEPOINT
Creates checkpoint.

ROLLBACK TO SAVEPOINT
Returns to checkpoint.

RELEASE SAVEPOINT
Removes savepoint.

Benefits:

✔ Partial Recovery
✔ Better Error Handling
✔ Large Transaction Control
✔ Real-World Reliability

Used In:

✔ Banking Systems
✔ E-commerce Platforms
✔ Ticket Booking Systems
✔ University Portals
✔ Payment Gateways

*/

-- ============================================================
-- END OF FILE
-- ============================================================