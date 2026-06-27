-- =====================================================
-- LeetCode 1211
-- Queries Quality and Percentage
--
-- Topic:
-- GROUP BY
-- AVG()
-- ROUND()
-- CASE WHEN
-- Conditional Aggregation
-- =====================================================


-- =====================================================
-- Solution (GROUP BY + AVG + CASE WHEN) [Optimal]
-- =====================================================


SELECT
    query_name,


    ROUND(
        AVG(rating / position),
        2
    ) AS quality,


    ROUND(
        SUM(
            CASE
                WHEN rating < 3
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS poor_query_percentage


FROM Queries

GROUP BY
    query_name;



-- =====================================================
-- Notes:
--
-- 1. AVG(rating/position) calculates query quality.
--
-- 2. CASE WHEN counts poor queries.
--
-- 3. Multiply by 100 for percentage.
--
-- 4. ROUND keeps two decimal places.
--
-- =====================================================