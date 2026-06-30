-- =====================================================
-- LeetCode 1731
-- The Number of Employees Which Report to Each Employee
--
-- Topic:
-- SELF JOIN
-- GROUP BY
-- COUNT()
-- AVG()
-- =====================================================


-- =====================================================
-- Solution 1 (SELF JOIN + GROUP BY) [Optimal]
-- =====================================================

SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age

FROM Employees e

JOIN Employees m
ON e.reports_to = m.employee_id

GROUP BY
    m.employee_id,
    m.name

ORDER BY
    m.employee_id;



-- =====================================================
-- Solution 2 (LEFT JOIN - includes managers with 0 reports)
-- =====================================================

SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age

FROM Employees m

LEFT JOIN Employees e
ON e.reports_to = m.employee_id

GROUP BY
    m.employee_id,
    m.name

ORDER BY
    m.employee_id;



-- =====================================================
-- Notes:
--
-- 1. Solution 1 only shows managers with reports.
--
-- 2. Solution 2 includes all managers (even 0 reports).
--
-- 3. Self join is used for hierarchy mapping.
--
-- =====================================================