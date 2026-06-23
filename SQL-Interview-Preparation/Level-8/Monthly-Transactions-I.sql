-- =====================================================
-- LeetCode 1193
-- Monthly Transactions I
--
-- Topic:
-- GROUP BY
-- CASE WHEN
-- SUM()
-- COUNT()
-- DATE_FORMAT()
-- =====================================================


-- =====================================================
-- Solution 1 (GROUP BY + CASE WHEN) [Optimal]
-- =====================================================

SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,

    COUNT(*) AS trans_count,

    SUM(
        CASE
            WHEN state = 'approved'
            THEN 1
            ELSE 0
        END
    ) AS approved_count,

    SUM(amount) AS trans_total_amount,

    SUM(
        CASE
            WHEN state = 'approved'
            THEN amount
            ELSE 0
        END
    ) AS approved_total_amount

FROM Transactions

GROUP BY
    DATE_FORMAT(trans_date, '%Y-%m'),
    country;



-- =====================================================
-- Solution 2 (Using IF)
-- =====================================================

SELECT
    DATE_FORMAT(trans_date,'%Y-%m') AS month,
    country,

    COUNT(*) AS trans_count,

    SUM(state = 'approved') AS approved_count,

    SUM(amount) AS trans_total_amount,

    SUM(
        IF(state='approved', amount, 0)
    ) AS approved_total_amount

FROM Transactions

GROUP BY
    month,
    country;



-- =====================================================
-- Notes:
--
-- 1. DATE_FORMAT extracts month and year.
--
-- 2. CASE WHEN is used for conditional counting.
--
-- 3. SUM(amount) gives total transaction amount.
--
-- 4. SUM(CASE...) calculates approved amount only.
--
-- =====================================================