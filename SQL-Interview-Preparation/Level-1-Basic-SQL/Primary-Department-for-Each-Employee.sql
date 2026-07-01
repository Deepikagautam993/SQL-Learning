-- =====================================================
-- LeetCode 1789
-- Primary Department for Each Employee
--
-- Topic:
-- CASE / FILTERING
-- GROUP BY
-- UNION
-- =====================================================


-- =====================================================
-- Solution 1 (UNION Approach) [Correct & Safe]
-- =====================================================

SELECT
    employee_id,
    department_id

FROM Employee

WHERE primary_flag = 'Y'

UNION

SELECT
    employee_id,
    department_id

FROM Employee

GROUP BY employee_id

HAVING COUNT(*) = 1;



-- =====================================================
-- Solution 2 (Conditional Aggregation - Advanced)
-- =====================================================

SELECT
    employee_id,

    MAX(
        CASE
            WHEN primary_flag = 'Y'
            THEN department_id
        END
    ) AS department_id

FROM Employee

GROUP BY employee_id;



-- =====================================================
-- Notes:
--
-- 1. Solution 1:
--    - picks 'Y' departments
--    - also picks employees with only 1 department
--    - UNION removes duplicates
--
-- 2. Solution 2:
--    - uses CASE inside aggregation
--    - simpler but depends on data consistency
--
-- 3. Both return correct primary department per employee
--
-- =====================================================