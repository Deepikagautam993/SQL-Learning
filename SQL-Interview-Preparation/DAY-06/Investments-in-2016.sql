-- =====================================================
-- LeetCode 585
-- Investments in 2016
--
-- Topic:
-- GROUP BY
-- HAVING
-- Subquery
-- JOIN
-- Aggregation
-- =====================================================


-- =====================================================
-- Solution 1 (Subquery) [Optimal]
-- =====================================================

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016

FROM Insurance

WHERE tiv_2015 IN
(
    SELECT
        tiv_2015

    FROM Insurance

    GROUP BY tiv_2015

    HAVING COUNT(*) > 1
)

AND (lat, lon) IN
(
    SELECT
        lat,
        lon

    FROM Insurance

    GROUP BY lat, lon

    HAVING COUNT(*) = 1
);



-- =====================================================
-- Solution 2 (JOIN)
-- =====================================================

SELECT
    ROUND(SUM(i.tiv_2016), 2) AS tiv_2016

FROM Insurance i

JOIN
(
    SELECT
        tiv_2015

    FROM Insurance

    GROUP BY tiv_2015

    HAVING COUNT(*) > 1

) a

ON i.tiv_2015 = a.tiv_2015


JOIN
(
    SELECT
        lat,
        lon

    FROM Insurance

    GROUP BY lat, lon

    HAVING COUNT(*) = 1

) b

ON i.lat = b.lat
AND i.lon = b.lon;



-- =====================================================
-- Notes:
--
-- 1. Same tiv_2015 means multiple users
--    have same investment in 2015.
--
-- 2. Unique location means only one user
--    exists at that latitude and longitude.
--
-- 3. HAVING is used after GROUP BY
--    for aggregate filtering.
--
-- 4. Final answer is sum of tiv_2016.
--
-- =====================================================