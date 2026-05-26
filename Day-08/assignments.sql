-- =========================================================
-- DAY 08 ASSIGNMENTS WITH SOLUTIONS
-- ADVANCED WINDOW ANALYTICS
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE revenue_data (
    month_id INT,
    month_name VARCHAR(20),
    revenue INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO revenue_data
VALUES
(1, 'January', 40000),
(2, 'February', 45000),
(3, 'March', 42000),
(4, 'April', 50000),
(5, 'May', 55000),
(6, 'June', 60000),
(7, 'July', 65000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM revenue_data;



-- =========================================================
-- Q1. CREATE RUNNING TOTAL
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
    ) AS running_total
FROM revenue_data;



-- =========================================================
-- Q2. CREATE RUNNING AVERAGE
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
    ) AS running_average
FROM revenue_data;



-- =========================================================
-- Q3. CREATE CUMULATIVE REVENUE REPORT
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
    ) AS cumulative_revenue
FROM revenue_data;



-- =========================================================
-- Q4. CREATE MOVING AVERAGE
-- USING PREVIOUS 2 ROWS
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average
FROM revenue_data;



-- =========================================================
-- Q5. CREATE ROLLING SUM
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_sum
FROM revenue_data;



-- =========================================================
-- Q6. CREATE ROLLING MAXIMUM
-- =========================================================

SELECT
    month_name,
    revenue,
    MAX(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_maximum
FROM revenue_data;



-- =========================================================
-- Q7. CREATE ROLLING MINIMUM
-- =========================================================

SELECT
    month_name,
    revenue,
    MIN(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_minimum
FROM revenue_data;



-- =========================================================
-- Q8. USE CURRENT ROW ONLY
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND CURRENT ROW
    ) AS current_revenue
FROM revenue_data;



-- =========================================================
-- Q9. USE PREVIOUS + CURRENT ROW
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 1 PRECEDING
        AND CURRENT ROW
    ) AS previous_current_average
FROM revenue_data;



-- =========================================================
-- Q10. USE CURRENT ROW + NEXT ROW
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND 1 FOLLOWING
    ) AS future_revenue
FROM revenue_data;



-- =========================================================
-- Q11. USE UNBOUNDED PRECEDING
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_total
FROM revenue_data;



-- =========================================================
-- Q12. CREATE REVENUE TREND ANALYSIS
-- =========================================================

SELECT
    month_name,
    revenue,
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS previous_revenue,
    revenue -
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS revenue_growth
FROM revenue_data;



-- =========================================================
-- Q13. CREATE FUTURE GROWTH ANALYSIS
-- =========================================================

SELECT
    month_name,
    revenue,
    LEAD(revenue) OVER(
        ORDER BY month_id
    ) AS next_revenue,
    LEAD(revenue) OVER(
        ORDER BY month_id
    ) - revenue AS future_growth
FROM revenue_data;



-- =========================================================
-- Q14. CREATE MOVING WINDOW ANALYSIS
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_window_average
FROM revenue_data;



-- =========================================================
-- Q15. CREATE COMBINED DASHBOARD QUERY
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
    ) AS running_total,

    AVG(revenue) OVER(
        ORDER BY month_id
    ) AS running_average,

    MAX(revenue) OVER(
        ORDER BY month_id
    ) AS running_maximum,

    MIN(revenue) OVER(
        ORDER BY month_id
    ) AS running_minimum

FROM revenue_data;



-- =========================================================
-- Q16. FIND REVENUE DIFFERENCE
-- BETWEEN CURRENT AND PREVIOUS MONTH
-- =========================================================

SELECT
    month_name,
    revenue,
    revenue -
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS revenue_difference
FROM revenue_data;



-- =========================================================
-- Q17. FIND FUTURE REVENUE DIFFERENCE
-- =========================================================

SELECT
    month_name,
    revenue,
    LEAD(revenue) OVER(
        ORDER BY month_id
    ) - revenue AS future_difference
FROM revenue_data;



-- =========================================================
-- Q18. CREATE RUNNING MAXIMUM
-- =========================================================

SELECT
    month_name,
    revenue,
    MAX(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_maximum
FROM revenue_data;



-- =========================================================
-- Q19. CREATE RUNNING MINIMUM
-- =========================================================

SELECT
    month_name,
    revenue,
    MIN(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_minimum
FROM revenue_data;



-- =========================================================
-- Q20. CREATE FUTURE AVERAGE
-- USING FOLLOWING
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND 2 FOLLOWING
    ) AS future_average
FROM revenue_data;



-- =========================================================
-- THEORY QUESTIONS WITH ANSWERS
-- =========================================================

-- =========================================================
-- Q21. DIFFERENCE BETWEEN
-- RUNNING TOTAL AND MOVING AVERAGE
-- =========================================================
--
-- Running Total:
-- Uses all previous rows
-- cumulative calculation
--
-- Moving Average:
-- Uses fixed-size window
-- rolling calculation
--
-- =========================================================



-- =========================================================
-- Q22. DIFFERENCE BETWEEN
-- PRECEDING AND FOLLOWING
-- =========================================================
--
-- PRECEDING:
-- previous rows
--
-- FOLLOWING:
-- next rows
--
-- =========================================================



-- =========================================================
-- Q23. WHAT DOES CURRENT ROW MEAN?
-- =========================================================
--
-- CURRENT ROW means:
-- active current row
-- inside calculation frame.
--
-- =========================================================



-- =========================================================
-- Q24. WHAT DOES
-- UNBOUNDED PRECEDING MEAN?
-- =========================================================
--
-- UNBOUNDED PRECEDING means:
-- all previous rows
-- from start till current row.
--
-- =========================================================



-- =========================================================
-- Q25. WHY ARE FRAME CLAUSES IMPORTANT?
-- =========================================================
--
-- Frame clauses control:
-- - calculation range
-- - rolling analysis
-- - moving calculations
-- - trend analysis
--
-- =========================================================



-- =========================================================
-- Q26. WHY IS ORDER BY IMPORTANT
-- IN WINDOW FUNCTIONS?
-- =========================================================
--
-- ORDER BY controls:
-- - calculation sequence
-- - running calculations
-- - trend analysis
-- - rolling calculations
--
-- =========================================================



-- =========================================================
-- Q27. EXPLAIN ROLLING CALCULATIONS
-- =========================================================
--
-- Rolling calculations use
-- fixed-size windows for analysis.
--
-- Example:
-- previous 2 rows + current row.
--
-- =========================================================



-- =========================================================
-- Q28. EXPLAIN CUMULATIVE CALCULATIONS
-- =========================================================
--
-- Cumulative calculations use:
-- current row + all previous rows.
--
-- Example:
-- Running Total.
--
-- =========================================================



-- =========================================================
-- Q29. EXPLAIN MOVING WINDOW ANALYSIS
-- =========================================================
--
-- Moving Window Analysis:
-- analyzes nearby rows
-- using rolling frames.
--
-- Used for:
-- trend smoothing
-- forecasting
-- KPI analytics
--
-- =========================================================



-- =========================================================
-- Q30. REAL-WORLD USES OF FRAME CLAUSES
-- =========================================================
--
-- Used in:
-- - Power BI dashboards
-- - Financial analytics
-- - Forecasting systems
-- - Revenue tracking
-- - KPI reporting
-- - Business intelligence
--
-- =========================================================




-- =========================================================
-- Q31. CREATE 3-MONTH MOVING TOTAL
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS three_month_moving_total
FROM revenue_data;



-- =========================================================
-- Q32. CREATE 3-MONTH MOVING AVERAGE
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS three_month_moving_average
FROM revenue_data;



-- =========================================================
-- Q33. FIND HIGHEST REVENUE
-- INSIDE ROLLING WINDOW
-- =========================================================

SELECT
    month_name,
    revenue,
    MAX(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_highest_revenue
FROM revenue_data;



-- =========================================================
-- Q34. FIND LOWEST REVENUE
-- INSIDE ROLLING WINDOW
-- =========================================================

SELECT
    month_name,
    revenue,
    MIN(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_lowest_revenue
FROM revenue_data;



-- =========================================================
-- Q35. CREATE FUTURE SALES ANALYSIS
-- USING FOLLOWING
-- =========================================================

SELECT
    month_name,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND 2 FOLLOWING
    ) AS future_sales_analysis
FROM revenue_data;



-- =========================================================
-- Q36. CREATE CURRENT MONTH ANALYSIS
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND CURRENT ROW
    ) AS current_month_average
FROM revenue_data;



-- =========================================================
-- Q37. CREATE PREVIOUS MONTH ANALYSIS
-- =========================================================

SELECT
    month_name,
    revenue,
    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 1 PRECEDING
        AND CURRENT ROW
    ) AS previous_month_analysis
FROM revenue_data;



-- =========================================================
-- Q38. CREATE CUMULATIVE GROWTH REPORT
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_growth

FROM revenue_data;



-- =========================================================
-- Q39. CREATE SALES FORECAST REPORT
-- =========================================================

SELECT
    month_name,
    revenue,

    LEAD(revenue) OVER(
        ORDER BY month_id
    ) AS predicted_next_month_revenue

FROM revenue_data;



-- =========================================================
-- Q40. FIND MONTHLY GROWTH PERCENTAGE
-- =========================================================

SELECT
    month_name,
    revenue,

    ROUND(
        (
            revenue -
            LAG(revenue) OVER(
                ORDER BY month_id
            )
        ) * 100.0 /
        LAG(revenue) OVER(
            ORDER BY month_id
        ),
        2
    ) AS growth_percentage

FROM revenue_data;



-- =========================================================
-- Q41. CREATE ADVANCED KPI DASHBOARD
-- =========================================================

SELECT
    month_name,
    revenue,

    SUM(revenue) OVER(
        ORDER BY month_id
    ) AS running_total,

    AVG(revenue) OVER(
        ORDER BY month_id
    ) AS running_average,

    MAX(revenue) OVER(
        ORDER BY month_id
    ) AS running_maximum,

    MIN(revenue) OVER(
        ORDER BY month_id
    ) AS running_minimum,

    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS previous_revenue,

    LEAD(revenue) OVER(
        ORDER BY month_id
    ) AS next_revenue

FROM revenue_data;



-- =========================================================
-- Q42. CREATE ROLLING TREND ANALYSIS
-- =========================================================

SELECT
    month_name,
    revenue,

    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_trend

FROM revenue_data;



-- =========================================================
-- Q43. FIND SALES SPIKES
-- =========================================================

SELECT
    month_name,
    revenue,

    revenue -
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS sales_spike

FROM revenue_data;



-- =========================================================
-- Q44. FIND DECLINING REVENUE
-- =========================================================

SELECT
    month_name,
    revenue,

    revenue -
    LAG(revenue) OVER(
        ORDER BY month_id
    ) AS revenue_change

FROM revenue_data
WHERE revenue <
LAG(revenue) OVER(
    ORDER BY month_id
);



-- =========================================================
-- Q45. CREATE FUTURE TREND ANALYSIS
-- =========================================================

SELECT
    month_name,
    revenue,

    AVG(revenue) OVER(
        ORDER BY month_id
        ROWS BETWEEN CURRENT ROW
        AND 2 FOLLOWING
    ) AS future_trend

FROM revenue_data;



-- =========================================================
-- Q46. EXPLAIN FRAME CLAUSES
-- =========================================================
--
-- Frame Clauses define:
-- which rows participate
-- in window calculations.
--
-- Example:
-- ROWS BETWEEN 2 PRECEDING
-- AND CURRENT ROW
--
-- =========================================================



-- =========================================================
-- Q47. DIFFERENCE BETWEEN
-- CUMULATIVE AND ROLLING CALCULATIONS
-- =========================================================
--
-- Cumulative:
-- uses all previous rows
--
-- Rolling:
-- uses fixed-size window
--
-- =========================================================



-- =========================================================
-- Q48. WHY ARE MOVING AVERAGES IMPORTANT?
-- =========================================================
--
-- Used for:
-- - trend smoothing
-- - forecasting
-- - stock analysis
-- - KPI analytics
--
-- =========================================================



-- =========================================================
-- Q49. EXPLAIN FUTURE ANALYSIS
-- USING FOLLOWING
-- =========================================================
--
-- FOLLOWING analyzes:
-- future rows
-- after current row.
--
-- Used in:
-- forecasting systems.
--
-- =========================================================



-- =========================================================
-- Q50. REAL-WORLD USES OF
-- ROLLING ANALYTICS
-- =========================================================
--
-- Used in:
-- - Power BI dashboards
-- - Financial forecasting
-- - Trend analysis
-- - Revenue analytics
-- - KPI reporting
-- - Business intelligence
--
-- =========================================================