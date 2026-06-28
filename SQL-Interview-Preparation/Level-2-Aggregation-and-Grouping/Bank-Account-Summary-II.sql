-- =====================================================
-- LeetCode 1587
-- Bank Account Summary II
--
-- Topic:
-- JOIN
-- GROUP BY
-- SUM()
-- HAVING
-- =====================================================


-- =====================================================
-- Solution 1 (JOIN + GROUP BY + HAVING) [Optimal]
-- =====================================================

SELECT
    u.name,
    SUM(t.amount) AS balance

FROM Users u

JOIN Transactions t
ON u.account = t.account

GROUP BY
    u.account,
    u.name

HAVING
    SUM(t.amount) > 10000;



-- =====================================================
-- Solution 2 (SUBQUERY Approach) [Alternative]
-- =====================================================

SELECT
    name,
    balance

FROM
(
    SELECT
        u.name AS name,
        SUM(t.amount) AS balance

    FROM Users u

    JOIN Transactions t
    ON u.account = t.account

    GROUP BY
        u.account,
        u.name
) AS temp

WHERE balance > 10000;



-- =====================================================
-- Notes:
--
-- 1. Solution 1 uses HAVING (best & direct).
--
-- 2. Solution 2 uses subquery and filters later.
--
-- 3. Both give same result.
--
-- =====================================================