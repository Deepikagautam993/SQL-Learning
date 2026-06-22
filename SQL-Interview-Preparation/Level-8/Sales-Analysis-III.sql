-- =====================================================
-- LeetCode 1084
-- Sales Analysis III
--
-- Topic:
-- GROUP BY
-- HAVING
-- MIN()
-- MAX()
-- Date Filtering
-- =====================================================


-- =====================================================
-- Solution 1 (JOIN + GROUP BY + HAVING) [Optimal]
-- =====================================================

SELECT
    p.product_id,
    p.product_name

FROM Product p

JOIN Sales s
ON p.product_id = s.product_id

GROUP BY
    p.product_id,
    p.product_name

HAVING
    MIN(s.sale_date) >= '2019-01-01'
    AND MAX(s.sale_date) <= '2019-03-31';



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    product_id,
    product_name

FROM Product

WHERE product_id IN
(
    SELECT
        product_id

    FROM Sales

    GROUP BY product_id

    HAVING MIN(sale_date) >= '2019-01-01'
       AND MAX(sale_date) <= '2019-03-31'
);



-- =====================================================
-- Notes:
--
-- 1. MIN(sale_date) ensures first sale is in Q1.
--
-- 2. MAX(sale_date) ensures last sale is in Q1.
--
-- 3. HAVING is used for group-level filtering.
--
-- 4. Only products fully sold in Q1 2019 are selected.
--
-- =====================================================