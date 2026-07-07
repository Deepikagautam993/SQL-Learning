-- =====================================================
-- LeetCode 1045
-- Customers Who Bought All Products
--
-- Topic:
-- GROUP BY
-- HAVING
-- COUNT(DISTINCT)
-- Subquery
-- =====================================================


-- =====================================================
-- Solution 1 (GROUP BY + HAVING) [Optimal]
-- =====================================================

SELECT
    customer_id

FROM Customer

GROUP BY
    customer_id

HAVING COUNT(DISTINCT product_key) =
(
    SELECT
        COUNT(*)

    FROM Product
);



-- =====================================================
-- Solution 2 (Alternative)
-- =====================================================

SELECT
    customer_id

FROM Customer

GROUP BY
    customer_id

HAVING COUNT(DISTINCT product_key) =
(
    SELECT
        COUNT(product_key)

    FROM Product
);



-- =====================================================
-- Notes:
--
-- 1. GROUP BY creates group for every customer.
--
-- 2. COUNT(DISTINCT product_key) counts
--    unique products bought by customer.
--
-- 3. Customer is selected only when their
--    product count equals total products.
--
-- =====================================================