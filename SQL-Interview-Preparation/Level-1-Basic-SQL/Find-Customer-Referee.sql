-- LeetCode 584
-- Find Customer Referee

-- Topic:
-- WHERE, !=, NULL Handling

-- Key Learning:
-- NULL comparisons do not return TRUE.
-- Use IS NULL to check NULL values.

SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;