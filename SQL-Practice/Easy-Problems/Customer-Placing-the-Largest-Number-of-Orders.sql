-- LeetCode 586
-- Customer Placing the Largest Number of Orders

-- Topic:
-- COUNT()
-- GROUP BY
-- ORDER BY
-- LIMIT

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;