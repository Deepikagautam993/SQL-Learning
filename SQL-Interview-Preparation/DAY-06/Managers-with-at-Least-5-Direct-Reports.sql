-- =====================================================
-- LeetCode 570
-- Managers with at Least 5 Direct Reports
--
-- Topic:
-- Self Join
-- GROUP BY
-- HAVING
-- Subquery
-- =====================================================


-- =====================================================
-- Solution 1 (Self Join) [Optimal]
-- =====================================================

SELECT
    e1.name

FROM Employee e1

JOIN Employee e2
ON e1.id = e2.managerId

GROUP BY e1.id

HAVING COUNT(e2.id) >= 5;



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    name

FROM Employee

WHERE id IN
(
    SELECT
        managerId

    FROM Employee

    GROUP BY managerId

    HAVING COUNT(*) >= 5
);



-- =====================================================
-- Notes:
--
-- 1. Same table is joined twice.
--
-- 2. e1 represents manager.
--    e2 represents employees.
--
-- 3. GROUP BY manager counts direct reports.
--
-- 4. HAVING is used because COUNT()
--    is an aggregate function.
--
-- =====================================================