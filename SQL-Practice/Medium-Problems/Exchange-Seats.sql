-- =====================================================
-- LeetCode 626
-- Exchange Seats
--
-- Topic:
-- CASE WHEN
-- Row Swapping
-- Window Function
-- =====================================================


-- =====================================================
-- Solution 1 (CASE WHEN + Subquery) [Optimal]
-- =====================================================

SELECT
    CASE
        WHEN id % 2 = 1
        AND id = (SELECT COUNT(*) FROM Seat)
        THEN id

        WHEN id % 2 = 1
        THEN id + 1

        ELSE id - 1

    END AS id,

    student

FROM Seat

ORDER BY id;



-- =====================================================
-- Solution 2 (Window Function)
-- =====================================================

SELECT
    CASE
        WHEN MOD(id,2)=1
        THEN COALESCE(
            LEAD(id) OVER(ORDER BY id),
            id
        )

        ELSE LAG(id) OVER(ORDER BY id)

    END AS id,

    student

FROM Seat

ORDER BY id;



-- =====================================================
-- Notes:
--
-- Odd id:
-- swap with next seat
--
-- Even id:
-- swap with previous seat
--
-- Last odd seat:
-- remains unchanged
--
-- CASE is used to create new seat mapping.
--
-- =====================================================