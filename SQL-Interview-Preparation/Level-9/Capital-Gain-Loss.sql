-- =====================================================
-- LeetCode 1393
-- Capital Gain/Loss
--
-- Topic:
-- GROUP BY
-- SUM()
-- CASE WHEN
-- Conditional Aggregation
-- =====================================================


-- =====================================================
-- Solution 1 (CASE WHEN + SUM) [Optimal]
-- =====================================================

SELECT
    stock_name,

    SUM(
        CASE
            WHEN operation = 'Buy'
            THEN -price

            WHEN operation = 'Sell'
            THEN price

        END
    ) AS capital_gain_loss

FROM Stocks

GROUP BY
    stock_name;



-- =====================================================
-- Solution 2 (CASE with multiplication)
-- =====================================================

SELECT
    stock_name,

    SUM(
        price *
        CASE
            WHEN operation = 'Buy'
            THEN -1
            ELSE 1
        END
    ) AS capital_gain_loss

FROM Stocks

GROUP BY
    stock_name;



-- =====================================================
-- Notes:
--
-- 1. Buy decreases money, so price becomes negative.
--
-- 2. Sell increases money, so price remains positive.
--
-- 3. SUM calculates final profit/loss.
--
-- =====================================================