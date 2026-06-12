-- LeetCode 620
-- Not Boring Movies

-- Topic:
-- Modulus Operator (%)
-- ORDER BY

-- Find movies:
-- 1. Having odd IDs
-- 2. Description is not 'boring'
-- 3. Sort by rating descending

SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;