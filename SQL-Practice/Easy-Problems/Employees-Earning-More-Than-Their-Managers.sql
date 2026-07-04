-- LeetCode 181
-- Employees Earning More Than Their Managers

-- Topic:
-- Self Join


-- ==========================
-- Solution 1 (Self Join)
-- ==========================

SELECT
    e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;



-- ==========================
-- Solution 2 (Subquery)
-- ==========================

SELECT
    name AS Employee
FROM Employee e
WHERE salary >
(
    SELECT salary
    FROM Employee
    WHERE id = e.managerId
);