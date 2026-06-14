-- LeetCode 196
-- Delete Duplicate Emails

-- Topic:
-- DELETE
-- Self Join


-- ==========================
-- Solution 1 (Self Join)
-- ==========================

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
WHERE p1.id > p2.id;



-- ==========================
-- Solution 2 (Subquery)
-- ==========================

DELETE FROM Person
WHERE id NOT IN
(
    SELECT min_id
    FROM
    (
        SELECT MIN(id) AS min_id
        FROM Person
        GROUP BY email
    ) x
);