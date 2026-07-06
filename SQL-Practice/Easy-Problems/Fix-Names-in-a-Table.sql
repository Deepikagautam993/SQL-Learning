-- =====================================================
-- LeetCode 1667
-- Fix Names in a Table
--
-- Topic:
-- String Functions
-- CONCAT()
-- UPPER()
-- LOWER()
-- SUBSTRING()
-- =====================================================


-- =====================================================
-- Solution 1 (CONCAT + SUBSTRING) [Optimal]
-- =====================================================

SELECT
    user_id,

    CONCAT(
        UPPER(SUBSTRING(name,1,1)),
        LOWER(SUBSTRING(name,2))
    ) AS name

FROM Users

ORDER BY user_id;



-- =====================================================
-- Solution 2 (LEFT + RIGHT)
-- =====================================================

SELECT
    user_id,

    CONCAT(
        UPPER(LEFT(name,1)),
        LOWER(RIGHT(name, LENGTH(name)-1))
    ) AS name

FROM Users

ORDER BY user_id;



-- =====================================================
-- Notes:
--
-- 1. First character is converted to uppercase.
--
-- 2. Remaining characters are converted to lowercase.
--
-- 3. CONCAT() joins both parts.
--
-- 4. ORDER BY keeps output in user_id order.
--
-- =====================================================