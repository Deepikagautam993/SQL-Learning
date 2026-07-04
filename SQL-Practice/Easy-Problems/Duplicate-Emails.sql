-- LeetCode 182
-- Duplicate Emails

-- Topic:
-- GROUP BY
-- HAVING
-- COUNT


-- ==========================
-- Solution 1 (GROUP BY)
-- ==========================

SELECT
    email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;



-- ==========================
-- Solution 2 (Self Join)
-- ==========================

SELECT DISTINCT
    p1.email
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
WHERE p1.id <> p2.id;