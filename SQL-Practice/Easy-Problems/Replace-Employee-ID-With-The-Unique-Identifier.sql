-- LeetCode 1378
-- Replace Employee ID With The Unique Identifier

-- Topic:
-- LEFT JOIN

SELECT
    u.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
ON e.id = u.id;