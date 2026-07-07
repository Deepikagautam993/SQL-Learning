-- =====================================================
-- LeetCode 1158
-- Market Analysis I
--
-- Topic:
-- LEFT JOIN
-- GROUP BY
-- COUNT()
-- Conditional Filtering
-- =====================================================


-- =====================================================
-- Solution 1 (LEFT JOIN + GROUP BY) [Optimal]
-- =====================================================

SELECT
    u.user_id AS buyer_id,
    u.join_date,

    COUNT(o.order_id) AS orders_in_2019

FROM Users u

LEFT JOIN Orders o

ON u.user_id = o.buyer_id
AND YEAR(o.order_date) = 2019

GROUP BY
    u.user_id,
    u.join_date;



-- =====================================================
-- Solution 2 (LEFT JOIN + CASE)
-- =====================================================

SELECT
    u.user_id AS buyer_id,
    u.join_date,

    SUM(
        CASE
            WHEN YEAR(o.order_date) = 2019
            THEN 1
            ELSE 0
        END
    ) AS orders_in_2019

FROM Users u

LEFT JOIN Orders o

ON u.user_id = o.buyer_id

GROUP BY
    u.user_id,
    u.join_date;



-- =====================================================
-- Notes:
--
-- 1. LEFT JOIN keeps all users.
--
-- 2. Date condition is placed in JOIN,
--    so users with zero orders are not removed.
--
-- 3. COUNT(order_id) counts only 2019 orders.
--
-- 4. Alias buyer_id is used as required output.
--
-- =====================================================