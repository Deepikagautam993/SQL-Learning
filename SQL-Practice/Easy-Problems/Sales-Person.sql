-- =====================================================
-- LeetCode 607
-- Sales Person
--
-- Topic:
-- JOIN
-- NOT EXISTS
-- LEFT JOIN
-- Filtering
-- =====================================================


-- =====================================================
-- Solution 1 (NOT EXISTS) [Optimal]
-- =====================================================

SELECT
    s.name

FROM SalesPerson s

WHERE NOT EXISTS
(
    SELECT 1

    FROM Orders o

    JOIN Company c
    ON o.com_id = c.com_id

    WHERE o.sales_id = s.sales_id
    AND c.name = 'RED'
);



-- =====================================================
-- Solution 2 (LEFT JOIN)
-- =====================================================

SELECT
    s.name

FROM SalesPerson s

LEFT JOIN Orders o
ON s.sales_id = o.sales_id

LEFT JOIN Company c
ON o.com_id = c.com_id
AND c.name = 'RED'

WHERE c.name IS NULL;



-- =====================================================
-- Notes:
--
-- 1. NOT EXISTS checks that no matching RED
--    company order exists.
--
-- 2. LEFT JOIN keeps all salespersons.
--
-- 3. IS NULL removes those who have RED orders.
--
-- =====================================================