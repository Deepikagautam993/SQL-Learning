-- =====================================================
-- LeetCode 262
-- Trips and Users
--
-- Topic:
-- JOIN
-- CASE WHEN
-- GROUP BY
-- Aggregation
-- Percentage Calculation
-- =====================================================


-- =====================================================
-- Solution 1 (JOIN + CASE WHEN) [Optimal]
-- =====================================================

SELECT
    request_at AS `Day`,

    ROUND(
        SUM(
            CASE
                WHEN status LIKE 'cancelled%'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS `Cancellation Rate`

FROM Trips t

JOIN Users c
ON t.client_id = c.users_id

JOIN Users d
ON t.driver_id = d.users_id

WHERE c.banned = 'No'
AND d.banned = 'No'
AND request_at BETWEEN '2013-10-01' AND '2013-10-03'

GROUP BY request_at;



-- =====================================================
-- Solution 2 (CTE + Filtering)
-- =====================================================

WITH valid_trips AS
(
    SELECT
        t.request_at,
        t.status

    FROM Trips t

    JOIN Users c
    ON t.client_id = c.users_id

    JOIN Users d
    ON t.driver_id = d.users_id

    WHERE c.banned = 'No'
    AND d.banned = 'No'
    AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)


SELECT
    request_at AS `Day`,

    ROUND(
        SUM(
            CASE
                WHEN status LIKE 'cancelled%'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS `Cancellation Rate`

FROM valid_trips

GROUP BY request_at;



-- =====================================================
-- Notes:
--
-- 1. Trips table is joined twice with Users:
--    one for client and one for driver.
--
-- 2. Remove banned users first.
--
-- 3. Cancellation rate:
--
--    cancelled trips / total valid trips
--
-- 4. CASE WHEN is used to count cancelled trips.
-- =====================================================