-- LeetCode 178
-- Rank Scores

-- Topic:
-- Window Function
-- DENSE_RANK()

SELECT
    score,
    DENSE_RANK() OVER(
        ORDER BY score DESC
    ) AS `rank`
FROM Scores;