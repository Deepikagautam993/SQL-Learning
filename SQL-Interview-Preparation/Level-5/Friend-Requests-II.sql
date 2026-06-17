-- =====================================================
-- LeetCode 602
-- Friend Requests II: Who Has the Most Friends
--
-- Topic:
-- UNION ALL
-- GROUP BY
-- COUNT()
-- Aggregation
-- =====================================================


-- =====================================================
-- Solution 1 (UNION ALL + GROUP BY) [Optimal]
-- =====================================================

SELECT
    id,
    COUNT(*) AS num

FROM
(
    SELECT
        requester_id AS id

    FROM RequestAccepted


    UNION ALL


    SELECT
        accepter_id AS id

    FROM RequestAccepted

) t

GROUP BY id

ORDER BY num DESC

LIMIT 1;



-- =====================================================
-- Solution 2 (CTE + MAX Count)
-- =====================================================

WITH friends AS
(
    SELECT
        requester_id AS id

    FROM RequestAccepted


    UNION ALL


    SELECT
        accepter_id AS id

    FROM RequestAccepted
)


SELECT
    id,
    COUNT(*) AS num

FROM friends

GROUP BY id

HAVING COUNT(*) =
(
    SELECT MAX(cnt)

    FROM
    (
        SELECT
            COUNT(*) AS cnt

        FROM friends

        GROUP BY id

    ) x
);



-- =====================================================
-- Notes:
--
-- 1. Friendship is bidirectional.
--
-- 2. requester_id and accepter_id both
--    represent a friend connection.
--
-- 3. UNION ALL keeps duplicate appearances.
--
-- 4. COUNT(*) gives total friends.
--
-- =====================================================