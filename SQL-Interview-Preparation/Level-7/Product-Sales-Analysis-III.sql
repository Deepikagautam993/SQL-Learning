-- =====================================================
-- LeetCode 1070
-- Product Sales Analysis III
--
-- Topic:
-- GROUP BY
-- MIN()
-- JOIN
-- Subquery
-- =====================================================


-- =====================================================
-- Solution 1 (Subquery + JOIN) [Optimal]
-- =====================================================

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price

FROM Sales s

JOIN
(
    SELECT
        product_id,
        MIN(year) AS first_year

    FROM Sales

    GROUP BY
        product_id

) f

ON s.product_id = f.product_id
AND s.year = f.first_year;



-- =====================================================
-- Solution 2 (WHERE + Subquery)
-- =====================================================

SELECT
    product_id,
    year AS first_year,
    quantity,
    price

FROM Sales

WHERE (product_id, year) IN
(
    SELECT
        product_id,
        MIN(year)

    FROM Sales

    GROUP BY
        product_id
);



-- =====================================================
-- Notes:
--
-- 1. MIN(year) finds the first selling year
--    for each product.
--
-- 2. JOIN is used to get complete details
--    from the original table.
--
-- 3. GROUP BY product_id creates product-wise groups.
--
-- =====================================================