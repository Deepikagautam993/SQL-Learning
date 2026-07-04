-- LeetCode 511
-- Game Play Analysis I

-- Topic:
-- GROUP BY
-- MIN()


-- ==========================
-- Solution 1 (Aggregation)
-- ==========================

SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;



-- ==========================
-- Solution 2 (Window Function)
-- ==========================

SELECT DISTINCT
    player_id,
    FIRST_VALUE(event_date) OVER(
        PARTITION BY player_id
        ORDER BY event_date
    ) AS first_login
FROM Activity;