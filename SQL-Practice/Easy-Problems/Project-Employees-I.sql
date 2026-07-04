-- =====================================================
-- LeetCode 1075
-- Project Employees I
--
-- Topic:
-- JOIN
-- GROUP BY
-- AVG()
-- ROUND()
-- =====================================================


-- =====================================================
-- Solution 1 (JOIN + GROUP BY + AVG) [Optimal]
-- =====================================================

SELECT
    p.project_id,

    ROUND(
        AVG(e.experience_years),
        2
    ) AS average_years

FROM Project p

JOIN Employee e

ON p.employee_id = e.employee_id

GROUP BY
    p.project_id;



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    project_id,

    (
        SELECT
            ROUND(AVG(e2.experience_years),2)

        FROM Project p2

        JOIN Employee e2
        ON p2.employee_id = e2.employee_id

        WHERE p2.project_id = p1.project_id

    ) AS average_years

FROM Project p1

GROUP BY
    project_id;



-- =====================================================
-- Notes:
--
-- 1. JOIN combines Project and Employee tables.
--
-- 2. AVG() calculates average experience.
--
-- 3. GROUP BY gives project-wise result.
--
-- 4. ROUND() keeps decimal precision.
--
-- =====================================================