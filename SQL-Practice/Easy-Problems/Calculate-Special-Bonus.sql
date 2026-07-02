-- =====================================================
-- LeetCode 1873
-- Calculate Special Bonus
--
-- Topic:
-- CASE WHEN
-- MOD (%)
-- LIKE condition
-- =====================================================


-- =====================================================
-- Solution 1 (CASE WHEN) [Optimal]
-- =====================================================

SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1
             AND name NOT LIKE 'M%'
        THEN salary
        ELSE 0
    END AS bonus

FROM Employees

ORDER BY employee_id;



-- =====================================================
-- Solution 2 (WHERE + CASE separated logic) [Alternative]
-- =====================================================

SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1
             AND name NOT LIKE 'M%'
        THEN salary
        ELSE 0
    END AS bonus

FROM Employees

WHERE 1 = 1;



-- =====================================================
-- Notes:
--
-- 1. CASE WHEN is mandatory here.
--
-- 2. Alternative is logically same but cleaner separation possible.
--
-- 3. WHERE filter is optional since logic is inside CASE.
--
-- =====================================================