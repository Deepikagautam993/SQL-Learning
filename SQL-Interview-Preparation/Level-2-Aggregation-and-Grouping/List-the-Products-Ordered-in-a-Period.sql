-- =====================================================
-- LeetCode 1327
-- List the Products Ordered in a Period
--
-- Topic:
-- JOIN
-- GROUP BY
-- HAVING
-- SUM()
-- DATE FILTER
-- =====================================================


-- =====================================================
-- Solution (JOIN + GROUP BY + HAVING) [Optimal]
-- =====================================================

SELECT
    p.product_name,
    SUM(o.unit) AS unit


FROM Products p


JOIN Orders o
ON p.product_id = o.product_id


WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'


GROUP BY
    p.product_id,
    p.product_name


HAVING
    SUM(o.unit) >= 100;



-- =====================================================
-- Notes:
--
-- 1. Filter orders for Feb 2020 using WHERE.
--
-- 2. JOIN connects product with orders.
--
-- 3. GROUP BY aggregates units per product.
--
-- 4. HAVING filters products with >= 100 units.
--
-- =====================================================