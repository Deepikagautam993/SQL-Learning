-- LeetCode 1757
-- Recyclable and Low Fat Products

-- Topic:
-- WHERE Clause, AND Operator

-- Approach:
-- Filter products where:
-- low_fats = 'Y'
-- recyclable = 'Y'

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';