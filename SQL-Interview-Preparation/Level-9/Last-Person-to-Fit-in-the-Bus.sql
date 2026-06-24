-- =====================================================
-- LeetCode 1204
-- Last Person to Fit in the Bus
--
-- Topic:
-- Window Function
-- SUM() OVER()
-- CTE
-- Running Sum
-- =====================================================


-- =====================================================
-- Solution 1 (CTE + Window Function) [Optimal]
-- =====================================================

WITH running_weight AS
(
    SELECT
        person_name,
        turn,

        SUM(weight) OVER(
            ORDER BY turn
        ) AS total_weight

    FROM Queue
)

SELECT
    person_name

FROM running_weight

WHERE total_weight <= 1000

ORDER BY turn DESC

LIMIT 1;



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    person_name

FROM
(
    SELECT
        person_name,
        turn,

        SUM(weight) OVER(
            ORDER BY turn
        ) AS total_weight

    FROM Queue

) t

WHERE total_weight <= 1000

ORDER BY turn DESC

LIMIT 1;



-- =====================================================
-- Notes:
--
-- 1. SUM(weight) OVER() creates running total.
--
-- 2. Running weight follows turn order.
--
-- 3. Filter passengers within bus capacity.
--
-- 4. Highest turn among valid passengers is answer.
--
-- =====================================================