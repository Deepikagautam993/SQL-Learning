-- =========================================
-- DAY 02 ASSIGNMENTS
-- SELECT & WHERE CLAUSE
-- =========================================

-- =========================================
-- Assignment 1
-- Create Customer Table
-- =========================================

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    total_purchase INT
);

-- =========================================
-- Assignment 2
-- Insert Customer Records
-- =========================================

INSERT INTO customers
VALUES
(1, 'Deepika', 'Jabalpur', 21, 50000),
(2, 'Rahul', 'Delhi', 25, 30000),
(3, 'Riya', 'Mumbai', 23, 70000),
(4, 'Aman', 'Pune', 28, 45000),
(5, 'Simran', 'Indore', 20, 25000);

-- =========================================
-- Assignment 3
-- Display all customer records
-- =========================================

SELECT * FROM customers;

-- =========================================
-- Assignment 4
-- Display customer names and cities
-- =========================================

SELECT customer_name, city
FROM customers;

-- =========================================
-- Assignment 5
-- Display customers with purchase
-- greater than 40000
-- =========================================

SELECT *
FROM customers
WHERE total_purchase > 40000;

-- =========================================
-- Assignment 6
-- Display customers from Delhi
-- =========================================

SELECT *
FROM customers
WHERE city = 'Delhi';

-- =========================================
-- Assignment 7
-- Display customers whose age
-- is greater than 22
-- =========================================

SELECT *
FROM customers
WHERE age > 22;

-- =========================================
-- Assignment 8
-- Display customers from Mumbai
-- with purchase greater than 50000
-- =========================================

SELECT *
FROM customers
WHERE city = 'Mumbai'
AND total_purchase > 50000;

-- =========================================
-- Assignment 9
-- Display customers not from Pune
-- =========================================

SELECT *
FROM customers
WHERE NOT city = 'Pune';

-- =========================================
-- Assignment 10
-- Display customers whose purchase
-- is less than 60000
-- =========================================

SELECT *
FROM customers
WHERE total_purchase < 60000;