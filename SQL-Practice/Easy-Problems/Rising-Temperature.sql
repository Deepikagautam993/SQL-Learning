-- LeetCode 197
-- Rising Temperature

-- Topic:
-- Self Join
-- Date Comparison


-- ==========================
-- Solution 1 (Self Join)
-- ==========================

SELECT
    w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(
    w2.recordDate,
    INTERVAL 1 DAY
)
WHERE w1.temperature > w2.temperature;



-- ==========================
-- Solution 2 (DATEDIFF)
-- ==========================

SELECT
    w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(
    w1.recordDate,
    w2.recordDate
)=1
WHERE w1.temperature > w2.temperature;