-- =====================================================
-- LeetCode 627
-- Swap Sex of Employees
--
-- Topic:
-- UPDATE
-- CASE WHEN
-- IF()
-- =====================================================


-- =====================================================
-- Solution 1 (UPDATE + CASE) [Optimal]
-- =====================================================

UPDATE Salary

SET sex =
CASE
    WHEN sex = 'm'
    THEN 'f'

    ELSE 'm'

END;



-- =====================================================
-- Solution 2 (UPDATE + IF)
-- =====================================================

UPDATE Salary

SET sex =
IF(
    sex = 'm',
    'f',
    'm'
);



-- =====================================================
-- Notes:
--
-- CASE is used for conditional replacement.
--
-- m becomes f
-- f becomes m
--
-- UPDATE is used because existing
-- table values need to be changed.
--
-- =====================================================