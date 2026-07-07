-- =====================================================
-- LeetCode 550
-- Game Play Analysis IV
--
-- Topic:
-- Date Difference
-- Aggregation
-- JOIN
-- Retention Analysis
-- =====================================================


-- =====================================================
-- Solution 1 (LEFT JOIN + Subquery) [Optimal]
-- =====================================================

SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        COUNT(DISTINCT f.player_id),
        2
    ) AS fraction

FROM
(
    SELECT
        player_id,
        MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
) f

LEFT JOIN Activity a
ON f.player_id = a.player_id
AND a.event_date = DATE_ADD(
    f.first_date,
    INTERVAL 1 DAY
);



-- =====================================================
-- Solution 2 (CTE + CASE WHEN)
-- =====================================================

WITH first_login AS
(
    SELECT
        player_id,
        MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(
        SUM(
            CASE
                WHEN a.event_date IS NOT NULL THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS fraction

FROM first_login f

LEFT JOIN Activity a
ON f.player_id = a.player_id
AND a.event_date =
DATE_ADD(
    f.first_date,
    INTERVAL 1 DAY
);



-- =====================================================
-- Notes:
--
-- First find every player's first login date.
-- Then check whether the player played the next day.
--
-- LEFT JOIN is used because players who did not return
-- should also be counted in the denominator.
-- =====================================================