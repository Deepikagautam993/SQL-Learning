-- LeetCode 180
-- Consecutive Numbers

-- Topic:
-- Self Join


-- ==========================
-- Solution 1 (Self Join)
-- ==========================

SELECT DISTINCT
    a.num AS ConsecutiveNums
FROM Logs a
JOIN Logs b
ON a.id + 1 = b.id
JOIN Logs c
ON a.id + 2 = c.id
WHERE a.num = b.num
AND b.num = c.num;



-- ==========================
-- Solution 2 (Window Function)
-- ==========================

SELECT DISTINCT num AS ConsecutiveNums
FROM
(
    SELECT
        num,
        LAG(num,1) OVER(ORDER BY id) prev1,
        LAG(num,2) OVER(ORDER BY id) prev2
    FROM Logs
)x
WHERE num = prev1
AND num = prev2;
