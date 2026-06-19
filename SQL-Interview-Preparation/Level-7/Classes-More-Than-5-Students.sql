-- =====================================================
-- LeetCode 596
-- Classes More Than 5 Students
--
-- Topic:
-- GROUP BY
-- HAVING
-- COUNT()
-- =====================================================


-- =====================================================
-- Solution 1 (GROUP BY + HAVING) [Optimal]
-- =====================================================

SELECT
    class

FROM Courses

GROUP BY class

HAVING COUNT(student) >= 5;



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    class

FROM Courses

WHERE class IN
(
    SELECT
        class

    FROM Courses

    GROUP BY class

    HAVING COUNT(*) >= 5
);



-- =====================================================
-- Notes:
--
-- 1. GROUP BY creates separate groups
--    for each class.
--
-- 2. COUNT() counts students in each class.
--
-- 3. HAVING filters groups after aggregation.
--
-- 4. WHERE cannot be used with COUNT(),
--    so HAVING is required.
--
-- =====================================================