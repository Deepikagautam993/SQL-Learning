-- =====================================================
-- LeetCode 1741
-- Find Total Time Spent by Each Employee
--
-- Topic:
-- GROUP BY
-- SUM()
-- DATE + TIME CALCULATION
-- ORDER BY
-- =====================================================


-- =====================================================
-- Solution 1 (GROUP BY + SUM) [Optimal]
-- =====================================================

SELECT
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time

FROM Employees

GROUP BY
    emp_id,
    event_day

ORDER BY
    emp_id,
    event_day;



-- =====================================================
-- Solution 2 (CTE Approach - Readable Alternative)
-- =====================================================

WITH time_calc AS (
    SELECT
        emp_id,
        event_day,
        (out_time - in_time) AS session_time
    FROM Employees
)

SELECT
    event_day AS day,
    emp_id,
    SUM(session_time) AS total_time

FROM time_calc

GROUP BY
    emp_id,
    event_day

ORDER BY
    emp_id,
    event_day;



-- =====================================================
-- Notes:
--
-- 1. Solution 1 is direct and most efficient.
--
-- 2. Solution 2 separates logic using CTE (better readability).
--
-- 3. Both produce same result.
--
-- =====================================================