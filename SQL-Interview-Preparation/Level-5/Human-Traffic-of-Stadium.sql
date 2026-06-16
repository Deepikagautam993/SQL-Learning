-- =====================================================
-- LeetCode 601
-- Human Traffic of Stadium
--
-- Topic:
-- Window Function
-- ROW_NUMBER()
-- Consecutive Dates
-- GROUP BY
-- =====================================================


-- =====================================================
-- Solution 1 (Window Function) [Optimal]
-- =====================================================

WITH days AS
(
    SELECT
        *,
        id - ROW_NUMBER() OVER(
            ORDER BY visit_date
        ) AS grp

    FROM Stadium

    WHERE people >= 100
),

valid_groups AS
(
    SELECT
        grp

    FROM days

    GROUP BY grp

    HAVING COUNT(*) >= 3
)

SELECT
    id,
    visit_date,
    people

FROM days

WHERE grp IN
(
    SELECT grp
    FROM valid_groups
);



-- =====================================================
-- Solution 2 (Self Join)
-- =====================================================

SELECT DISTINCT
    s1.id,
    s1.visit_date,
    s1.people

FROM Stadium s1

JOIN Stadium s2
ON DATEDIFF(
    s2.visit_date,
    s1.visit_date
) = 1

JOIN Stadium s3
ON DATEDIFF(
    s3.visit_date,
    s2.visit_date
) = 1

WHERE s1.people >= 100
AND s2.people >= 100
AND s3.people >= 100;



-- =====================================================
-- Notes:
--
-- 1. Filter high traffic days (people >= 100)
--
-- 2. ROW_NUMBER helps create groups of consecutive days.
--
-- 3. Same group means dates are continuous.
--
-- 4. HAVING COUNT(*) >= 3 keeps only sequences
--    with 3 or more consecutive high traffic days.
--
-- =====================================================