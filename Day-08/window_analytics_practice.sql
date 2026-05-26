-- =========================================================
-- DAY 08 PRACTICE QUESTIONS
-- ADVANCED WINDOW ANALYTICS
-- =========================================================

-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE sales_data (
    sale_id INT,
    month_name VARCHAR(20),
    sales_amount INT
);



-- =========================================================
-- INSERT SAMPLE DATA
-- =========================================================

INSERT INTO sales_data
VALUES
(1, 'January', 25000),
(2, 'February', 30000),
(3, 'March', 28000),
(4, 'April', 35000),
(5, 'May', 40000),
(6, 'June', 38000),
(7, 'July', 45000);



-- =========================================================
-- VIEW TABLE
-- =========================================================

SELECT *
FROM sales_data;



-- =========================================================
-- Q1. CREATE RUNNING TOTAL
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_total
FROM sales_data;



-- =========================================================
-- Q2. CREATE RUNNING AVERAGE
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_average
FROM sales_data;



-- =========================================================
-- Q3. CREATE CUMULATIVE SALES REPORT
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
    ) AS cumulative_sales
FROM sales_data;



-- =========================================================
-- Q4. CREATE MOVING AVERAGE
-- USING PREVIOUS 2 ROWS
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average
FROM sales_data;



-- =========================================================
-- Q5. CREATE ROLLING SUM
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_sum
FROM sales_data;



-- =========================================================
-- Q6. CREATE ROLLING MAXIMUM
-- =========================================================

SELECT
    month_name,
    sales_amount,
    MAX(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_maximum
FROM sales_data;



-- =========================================================
-- Q7. CREATE ROLLING MINIMUM
-- =========================================================

SELECT
    month_name,
    sales_amount,
    MIN(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS rolling_minimum
FROM sales_data;



-- =========================================================
-- Q8. USE CURRENT ROW ONLY
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN CURRENT ROW
        AND CURRENT ROW
    ) AS current_sales
FROM sales_data;



-- =========================================================
-- Q9. USE PREVIOUS + CURRENT ROW
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 1 PRECEDING
        AND CURRENT ROW
    ) AS previous_current_average
FROM sales_data;



-- =========================================================
-- Q10. USE CURRENT ROW + NEXT ROW
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN CURRENT ROW
        AND 1 FOLLOWING
    ) AS future_sales
FROM sales_data;



-- =========================================================
-- Q11. USE UNBOUNDED PRECEDING
-- =========================================================

SELECT
    month_name,
    sales_amount,
    SUM(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_total
FROM sales_data;



-- =========================================================
-- Q12. CREATE SALES TREND ANALYSIS
-- =========================================================

SELECT
    month_name,
    sales_amount,
    LAG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS previous_sales,
    sales_amount -
    LAG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS sales_growth
FROM sales_data;



-- =========================================================
-- Q13. CREATE FUTURE GROWTH ANALYSIS
-- =========================================================

SELECT
    month_name,
    sales_amount,
    LEAD(sales_amount) OVER(
        ORDER BY sale_id
    ) AS next_sales,
    LEAD(sales_amount) OVER(
        ORDER BY sale_id
    ) - sales_amount AS future_growth
FROM sales_data;



-- =========================================================
-- Q14. CREATE MOVING WINDOW ANALYSIS
-- =========================================================

SELECT
    month_name,
    sales_amount,
    AVG(sales_amount) OVER(
        ORDER BY sale_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_window_average
FROM sales_data;



-- =========================================================
-- Q15. CREATE COMBINED DASHBOARD QUERY
-- =========================================================

SELECT
    month_name,
    sales_amount,

    SUM(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_total,

    AVG(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_average,

    MAX(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_maximum,

    MIN(sales_amount) OVER(
        ORDER BY sale_id
    ) AS running_minimum

FROM sales_data;



-- =========================================================
-- IMPORTANT INTERVIEW QUESTIONS
-- =========================================================
--
-- Q1. Difference between:
-- Running Total vs Moving Average
--
-- Q2. Difference between:
-- PRECEDING vs FOLLOWING
--
-- Q3. What does:
-- UNBOUNDED PRECEDING mean?
--
-- Q4. Why are frame clauses important?
--
-- Q5. Why is ORDER BY important
-- inside window functions?
--
-- =========================================================



-- =========================================================
-- REAL-WORLD USE CASES
-- =========================================================
--
-- Used in:
-- - Power BI dashboards
-- - Tableau analytics
-- - Financial systems
-- - Revenue tracking
-- - Forecasting systems
-- - KPI reporting
-- - Business intelligence
-- - Trend analysis
--
-- =========================================================