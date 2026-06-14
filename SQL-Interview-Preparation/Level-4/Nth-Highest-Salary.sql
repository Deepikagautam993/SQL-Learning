-- LeetCode 177
-- Nth Highest Salary

-- Topic:
-- Subquery
-- DISTINCT
-- ORDER BY
-- LIMIT
-- OFFSET


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

    SET N = N - 1;

    RETURN (

        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT N, 1

    );

END;


/*
Logic:

1. Remove duplicate salaries using DISTINCT

2. Sort salaries in descending order

3. For Nth highest salary:
   
   OFFSET = N - 1

4. LIMIT N,1:
   - skip N rows
   - take 1 row


Example:

Salary:
500
400
300
200

getNthHighestSalary(2)

N = 2-1 = 1

LIMIT 1,1

Skip:
500

Return:
400
*/