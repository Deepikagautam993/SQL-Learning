-- =====================================================
-- LeetCode 1633
-- Percentage of Users Attended a Contest
--
-- Topic:
-- GROUP BY
-- COUNT(DISTINCT)
-- Subquery
-- ROUND
-- =====================================================


-- =====================================================
-- Solution 1 (Subquery + GROUP BY) [Optimal]
-- =====================================================

SELECT
    contest_id,

    ROUND(
        COUNT(DISTINCT user_id) * 100.0 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage

FROM Register

GROUP BY contest_id

ORDER BY
    percentage DESC,
    contest_id ASC;



-- =====================================================
-- Solution 2 (CROSS JOIN + Precomputed Total Users)
-- =====================================================

WITH total_users AS (
    SELECT COUNT(*) AS total
    FROM Users
)

SELECT
    r.contest_id,

    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 / t.total,
        2
    ) AS percentage

FROM Register r

CROSS JOIN total_users t

GROUP BY
    r.contest_id,
    t.total

ORDER BY
    percentage DESC,
    r.contest_id ASC;



-- =====================================================
-- Notes:
--
-- 1. Solution 1 uses direct subquery for total users.
--
-- 2. Solution 2 precomputes total using CTE (cleaner in large queries).
--
-- 3. Both give same result.
--
-- =====================================================