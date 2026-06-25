-- =====================================================
-- LeetCode 1321
-- Restaurant Growth
--
-- Topic:
-- Window Function
-- SUM() OVER()
-- AVG() OVER()
-- ROWS BETWEEN
-- CTE
-- =====================================================


-- =====================================================
-- Solution (Window Function + CTE) [Accepted]
-- =====================================================


WITH daily AS
(
    SELECT
        visited_on,
        SUM(amount) AS amount

    FROM Customer

    GROUP BY
        visited_on
),


window_data AS
(
    SELECT
        visited_on,

        SUM(amount) OVER(
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,


        AVG(amount) OVER(
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS avg_amount

    FROM daily
)


SELECT
    visited_on,
    amount,

    ROUND(avg_amount, 2) AS average_amount

FROM window_data

WHERE visited_on >=
(
    SELECT
        DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)

    FROM daily
);



-- =====================================================
-- Notes:
--
-- 1. First aggregate same-day sales.
--
-- 2. ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
--    creates a 7-day moving window.
--
-- 3. First 6 days are removed because
--    complete 7-day data is not available.
--
-- 4. SUM gives total amount and AVG gives
--    average amount of last 7 days.
--
-- =====================================================