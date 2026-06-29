-- =====================================================
-- LeetCode 1661
-- Average Time of Process per Machine
--
-- Topic:
-- SELF JOIN
-- AVG()
-- GROUP BY
-- TIME DIFFERENCE
-- =====================================================


-- =====================================================
-- Solution (SELF JOIN + AVG) [Optimal]
-- =====================================================

SELECT
    a1.machine_id,

    ROUND(
        AVG(a2.timestamp - a1.timestamp),
        3
    ) AS processing_time


FROM Activity a1

JOIN Activity a2
ON a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id


WHERE a1.activity_type = 'start'
AND a2.activity_type = 'end'


GROUP BY
    a1.machine_id;



-- =====================================================
-- Notes:
--
-- 1. SELF JOIN connects start and end rows.
--
-- 2. (end - start) gives process time.
--
-- 3. AVG computes average per machine.
--
-- 4. ROUND formats output.
--
-- =====================================================