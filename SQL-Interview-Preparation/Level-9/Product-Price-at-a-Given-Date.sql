-- =====================================================
-- LeetCode 1164
-- Product Price at a Given Date
--
-- Topic:
-- JOIN
-- GROUP BY
-- MAX()
-- Date Filtering
-- UNION
-- =====================================================


-- =====================================================
-- Solution 1 (JOIN + MAX) [Optimal]
-- =====================================================

SELECT
    p.product_id,
    p.new_price AS price

FROM Products p

JOIN
(
    SELECT
        product_id,
        MAX(change_date) AS latest_date

    FROM Products

    WHERE change_date <= '2019-08-16'

    GROUP BY product_id

) x

ON p.product_id = x.product_id
AND p.change_date = x.latest_date


UNION


SELECT
    product_id,
    10 AS price

FROM Products

GROUP BY
    product_id

HAVING MIN(change_date) > '2019-08-16';



-- =====================================================
-- Solution 2 (Window Function)
-- =====================================================

SELECT
    product_id,
    new_price AS price

FROM
(
    SELECT
        product_id,
        new_price,

        RANK() OVER(
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS rnk

    FROM Products

    WHERE change_date <= '2019-08-16'

) t

WHERE rnk = 1


UNION


SELECT
    product_id,
    10 AS price

FROM Products

GROUP BY
    product_id

HAVING MIN(change_date) > '2019-08-16';



-- =====================================================
-- Notes:
--
-- 1. MAX(change_date) finds latest price update.
--
-- 2. Only changes before target date are considered.
--
-- 3. Products without old changes get default price 10.
--
-- =====================================================