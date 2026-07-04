-- =====================================================
-- LeetCode 619
-- Biggest Single Number
--
-- Topic:
-- GROUP BY
-- HAVING
-- MAX()
-- Subquery
-- =====================================================


-- =====================================================
-- Solution 1 (Subquery + GROUP BY) [Optimal]
-- =====================================================

SELECT
    MAX(num) AS num

FROM
(
    SELECT
        num

    FROM MyNumbers

    GROUP BY num

    HAVING COUNT(*) = 1

) t;



-- =====================================================
-- Solution 2 (NOT IN + HAVING)
-- =====================================================

SELECT
    MAX(num) AS num

FROM MyNumbers

WHERE num NOT IN
(
    SELECT
        num

    FROM MyNumbers

    GROUP BY num

    HAVING COUNT(*) > 1
);



-- =====================================================
-- Notes:
--
-- 1. GROUP BY creates groups of same numbers.
--
-- 2. HAVING COUNT(*) = 1 finds numbers
--    that appear only once.
--
-- 3. MAX() returns the largest unique number.
--
-- =====================================================