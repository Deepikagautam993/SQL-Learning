-- =====================================================
-- LeetCode 1729
-- Find Followers Count
--
-- Topic:
-- GROUP BY
-- COUNT()
-- ORDER BY
-- =====================================================


-- =====================================================
-- Solution 1 (GROUP BY + COUNT) [Optimal]
-- =====================================================

SELECT
    user_id,
    COUNT(follower_id) AS followers_count

FROM Followers

GROUP BY
    user_id

ORDER BY
    user_id ASC;



-- =====================================================
-- Solution 2 (DISTINCT safety version) [Alternative]
-- =====================================================

SELECT
    user_id,
    COUNT(DISTINCT follower_id) AS followers_count

FROM Followers

GROUP BY
    user_id

ORDER BY
    user_id ASC;



-- =====================================================
-- Notes:
--
-- 1. Solution 1 is direct and most optimal.
--
-- 2. Solution 2 avoids duplicate follower entries.
--
-- 3. GROUP BY ensures per user aggregation.
--
-- =====================================================