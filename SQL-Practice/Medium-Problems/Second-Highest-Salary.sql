-- LeetCode 176
-- Second Highest Salary

-- Topic:
-- Subquery
-- DISTINCT
-- ORDER BY

SELECT
(
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;