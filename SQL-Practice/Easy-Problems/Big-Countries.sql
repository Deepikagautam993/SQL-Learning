-- LeetCode 595
-- Big Countries

-- Topic:
-- WHERE Clause, OR Operator

-- Problem:
-- Find countries having:
-- area >= 3000000
-- OR
-- population >= 25000000

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;