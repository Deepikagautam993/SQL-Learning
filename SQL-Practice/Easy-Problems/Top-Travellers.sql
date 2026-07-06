-- =====================================================
-- LeetCode 1407
-- Top Travellers
--
-- Topic:
-- LEFT JOIN
-- GROUP BY
-- SUM()
-- COALESCE()
-- ORDER BY
-- =====================================================


-- =====================================================
-- Solution (LEFT JOIN + GROUP BY) [Optimal]
-- =====================================================

SELECT
    u.name,

    COALESCE(
        SUM(r.distance),
        0
    ) AS travelled_distance

FROM Users u

LEFT JOIN Rides r

ON u.id = r.user_id

GROUP BY
    u.id,
    u.name

ORDER BY
    travelled_distance DESC,
    u.name ASC;



-- =====================================================
-- Notes:
--
-- 1. LEFT JOIN keeps all users.
--
-- 2. SUM(distance) calculates total travel.
--
-- 3. COALESCE converts NULL into 0.
--
-- 4. Sorting is done by distance and name.
--
-- =====================================================