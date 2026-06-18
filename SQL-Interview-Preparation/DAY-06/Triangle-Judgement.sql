-- =====================================================
-- LeetCode 610
-- Triangle Judgement
--
-- Topic:
-- CASE WHEN
-- IF()
-- Logical Conditions
-- =====================================================


-- =====================================================
-- Solution 1 (CASE WHEN) [Optimal]
-- =====================================================

SELECT
    x,
    y,
    z,

    CASE
        WHEN x + y > z
        AND x + z > y
        AND y + z > x
        THEN 'Yes'

        ELSE 'No'

    END AS triangle

FROM Triangle;



-- =====================================================
-- Solution 2 (IF Function)
-- =====================================================

SELECT
    x,
    y,
    z,

    IF(
        x + y > z
        AND x + z > y
        AND y + z > x,
        'Yes',
        'No'
    ) AS triangle

FROM Triangle;



-- =====================================================
-- Notes:
--
-- Triangle condition:
--
-- x + y > z
-- x + z > y
-- y + z > x
--
-- If all conditions are true:
-- Triangle exists -> Yes
--
-- Otherwise:
-- No
--
-- =====================================================