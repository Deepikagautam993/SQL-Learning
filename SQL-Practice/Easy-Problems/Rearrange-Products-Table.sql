-- =====================================================
-- LeetCode 1795
-- Rearrange Products Table
--
-- Topic:
-- UNPIVOT
-- UNION ALL
-- =====================================================


-- =====================================================
-- Solution 1 (UNION ALL) [Optimal]
-- =====================================================

SELECT
    product_id,
    'store1' AS store,
    store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION ALL

SELECT
    product_id,
    'store2',
    store2
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT
    product_id,
    'store3',
    store3
FROM Products
WHERE store3 IS NOT NULL;



-- =====================================================
-- Solution 2 (CROSS APPLY style simulation - alternative logic)
-- =====================================================

SELECT product_id, store, price
FROM (
    SELECT product_id, 'store1' AS store, store1 AS price FROM Products
    UNION ALL
    SELECT product_id, 'store2', store2 FROM Products
    UNION ALL
    SELECT product_id, 'store3', store3 FROM Products
) AS t
WHERE price IS NOT NULL;



-- =====================================================
-- Notes:
--
-- 1. UNION ALL is standard UNPIVOT approach in MySQL.
--
-- 2. Second approach centralizes filtering.
--
-- 3. Both produce identical output.
--
-- =====================================================