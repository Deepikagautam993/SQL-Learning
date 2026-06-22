-- =====================================================
-- LeetCode 1141
-- User Activity for the Past 30 Days I
--
-- Topic:
-- GROUP BY
-- COUNT(DISTINCT)
-- DATE RANGE FILTERING
-- =====================================================


-- =====================================================
-- Solution (Correct & Accepted)
-- =====================================================

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users

FROM Activity

WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY)
                        AND '2019-07-27'

GROUP BY activity_date;



-- =====================================================
-- Notes:
--
-- 1. Only last 30 days are considered:
--    from (2019-07-27 - 29 days) to 2019-07-27
--
-- 2. COUNT(DISTINCT user_id) ensures each user
--    is counted only once per day.
--
-- 3. GROUP BY activity_date gives daily output.
--
-- =====================================================