-- =========================================================
-- Q1. FIND COMPANY-WIDE AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM employees;



-- =========================================================
-- Q2. FIND COMPANY-WIDE TOTAL SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER() AS total_company_salary
FROM employees;



-- =========================================================
-- Q3. FIND DEPARTMENT-WISE AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS department_average_salary
FROM employees;



-- =========================================================
-- Q4. FIND DEPARTMENT-WISE TOTAL SALARY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
    ) AS department_total_salary
FROM employees;



-- =========================================================
-- Q5. COUNT EMPLOYEES INSIDE EACH DEPARTMENT
-- =========================================================

SELECT
    emp_name,
    department,
    COUNT(*) OVER(
        PARTITION BY department
    ) AS employee_count
FROM employees;



-- =========================================================
-- Q6. FIND HIGHEST SALARY INSIDE EACH DEPARTMENT
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    MAX(salary) OVER(
        PARTITION BY department
    ) AS highest_department_salary
FROM employees;



-- =========================================================
-- Q7. FIND LOWEST SALARY INSIDE EACH DEPARTMENT
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    MIN(salary) OVER(
        PARTITION BY department
    ) AS lowest_department_salary
FROM employees;



-- =========================================================
-- Q8. CREATE RUNNING SALARY TOTAL
-- =========================================================

SELECT
    emp_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
    ) AS running_salary_total
FROM employees;



-- =========================================================
-- Q9. CREATE RUNNING AVERAGE SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    AVG(salary) OVER(
        ORDER BY salary
    ) AS running_average_salary
FROM employees;



-- =========================================================
-- Q10. CREATE DEPARTMENT-WISE RUNNING TOTAL
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS department_running_total
FROM employees;



-- =========================================================
-- Q11. ASSIGN ROW NUMBERS BASED ON HIGHEST SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_number
FROM employees;



-- =========================================================
-- Q12. ASSIGN ROW NUMBERS BASED ON LOWEST SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary ASC
    ) AS row_number
FROM employees;



-- =========================================================
-- Q13. CREATE DEPARTMENT-WISE ROW NUMBERS
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_row_number
FROM employees;



-- =========================================================
-- Q14. FIND TOP 3 HIGHEST PAID EMPLOYEES
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        ROW_NUMBER() OVER(
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
) ranked_data
WHERE row_num <= 3;



-- =========================================================
-- Q15. FIND TOP 2 LOWEST PAID EMPLOYEES
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        ROW_NUMBER() OVER(
            ORDER BY salary ASC
        ) AS row_num
    FROM employees
) ranked_data
WHERE row_num <= 2;



-- =========================================================
-- Q16. FIND HIGHEST PAID EMPLOYEE IN EACH DEPARTMENT
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        department,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
) ranked_data
WHERE row_num = 1;



-- =========================================================
-- Q17. FIND LOWEST PAID EMPLOYEE IN EACH DEPARTMENT
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        department,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY department
            ORDER BY salary ASC
        ) AS row_num
    FROM employees
) ranked_data
WHERE row_num = 1;



-- =========================================================
-- Q18. RANK EMPLOYEES BASED ON SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;



-- =========================================================
-- Q19. CREATE DEPARTMENT-WISE SALARY RANKS
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;



-- =========================================================
-- Q20. CREATE DENSE RANKS
-- =========================================================

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_rank
FROM employees;



-- =========================================================
-- Q21. ACCESS PREVIOUS MONTH SALES
-- =========================================================

SELECT
    month_name,
    sales,
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS previous_sales
FROM monthly_sales;



-- =========================================================
-- Q22. ACCESS NEXT MONTH SALES
-- =========================================================

SELECT
    month_name,
    sales,
    LEAD(sales) OVER(
        ORDER BY month_name
    ) AS next_sales
FROM monthly_sales;



-- =========================================================
-- Q23. FIND MONTHLY SALES DIFFERENCE
-- =========================================================

SELECT
    month_name,
    sales,
    sales -
    LAG(sales) OVER(
        ORDER BY month_name
    ) AS sales_difference
FROM monthly_sales;



-- =========================================================
-- Q24. FIND MONTHLY GROWTH PERCENTAGE
-- =========================================================

SELECT
    month_name,
    sales,
    ROUND(
        (
            sales -
            LAG(sales) OVER(
                ORDER BY month_name
            )
        ) * 100.0 /
        LAG(sales) OVER(
            ORDER BY month_name
        ),
        2
    ) AS growth_percentage
FROM monthly_sales;



-- =========================================================
-- Q25. FIND PREVIOUS DEPARTMENT SALARY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    LAG(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS previous_department_salary
FROM employees;



-- =========================================================
-- Q26. FIND NEXT DEPARTMENT SALARY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    LEAD(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS next_department_salary
FROM employees;



-- =========================================================
-- Q27. FIND SECOND HIGHEST SALARY
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) ranked_data
WHERE salary_rank = 2;



-- =========================================================
-- Q28. FIND THIRD HIGHEST SALARY
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) ranked_data
WHERE salary_rank = 3;




-- =========================================================
-- Q29. FIND TOP RANKED EMPLOYEE IN EVERY DEPARTMENT
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        department,
        salary,
        RANK() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
) ranked_data
WHERE department_rank = 1;



-- =========================================================
-- Q30. COMPARE ROW_NUMBER() AND RANK()
-- =========================================================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_num,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;



-- =========================================================
-- Q31. IDENTIFY SKIPPED RANKS USING RANK()
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS skipped_rank
FROM employees;



-- =========================================================
-- Q32. RANK EMPLOYEES USING ASCENDING SALARY ORDER
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary ASC
    ) AS ascending_rank
FROM employees;



-- =========================================================
-- Q33. CREATE DEPARTMENT-WISE DENSE RANKS
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_dense_rank
FROM employees;



-- =========================================================
-- Q34. COMPARE DENSE_RANK() WITH RANK()
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS normal_rank,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_rank
FROM employees;



-- =========================================================
-- Q35. FIND TOP 2 EMPLOYEES USING DENSE_RANK()
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS dense_rank
    FROM employees
) ranked_data
WHERE dense_rank <= 2;



-- =========================================================
-- Q36. ANALYZE DUPLICATE RANKING BEHAVIOR
-- =========================================================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_num,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS rank_num,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_rank_num
FROM employees;



-- =========================================================
-- Q37. CALCULATE SALARY DIFFERENCE INSIDE EACH DEPARTMENT
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    salary -
    LAG(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS salary_difference
FROM employees;



-- =========================================================
-- Q38. ANALYZE SALARY GROWTH TRENDS
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    LEAD(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) - salary AS next_salary_difference
FROM employees;



-- =========================================================
-- Q39. FIND EMPLOYEES EARNING ABOVE
-- DEPARTMENT AVERAGE SALARY
-- =========================================================

SELECT *
FROM (
    SELECT
        emp_name,
        department,
        salary,
        AVG(salary) OVER(
            PARTITION BY department
        ) AS department_average_salary
    FROM employees
) salary_data
WHERE salary > department_average_salary;



-- =========================================================
-- Q40. CREATE DEPARTMENT-WISE LEADERBOARD
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS leaderboard_position
FROM employees;



-- =========================================================
-- Q41. COMPARE CURRENT SALARY
-- WITH NEXT EMPLOYEE SALARY
-- =========================================================

SELECT
    emp_name,
    salary,
    LEAD(salary) OVER(
        ORDER BY salary
    ) AS next_salary
FROM employees;



-- =========================================================
-- Q42. CREATE SALARY TREND ANALYSIS REPORT
-- =========================================================

SELECT
    emp_name,
    salary,
    salary -
    LAG(salary) OVER(
        ORDER BY salary
    ) AS salary_trend_difference
FROM employees;



-- =========================================================
-- Q43. FIND CUMULATIVE DEPARTMENT SALARY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS cumulative_department_salary
FROM employees;



-- =========================================================
-- Q44. BUILD EMPLOYEE PERFORMANCE RANKING LOGIC
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS performance_rank
FROM employees;



-- =========================================================
-- Q45. CREATE ANALYTICAL DASHBOARD QUERY
-- =========================================================

SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS department_average_salary,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;



-- =========================================================
-- Q46. DIFFERENCE BETWEEN GROUP BY
-- AND PARTITION BY
-- =========================================================
--
-- GROUP BY:
-- - collapses rows
-- - summary output
--
-- PARTITION BY:
-- - keeps rows visible
-- - analytical calculations
--
-- =========================================================



-- =========================================================
-- Q47. DIFFERENCE BETWEEN ROW_NUMBER,
-- RANK AND DENSE_RANK
-- =========================================================
--
-- ROW_NUMBER:
-- unique sequence numbers
--
-- RANK:
-- duplicate ranks allowed
-- skips positions
--
-- DENSE_RANK:
-- duplicate ranks allowed
-- no skipped positions
--
-- =========================================================



-- =========================================================
-- Q48. WHY IS ORDER BY IMPORTANT
-- IN WINDOW FUNCTIONS?
-- =========================================================
--
-- ORDER BY controls:
-- - ranking sequence
-- - comparison order
-- - running calculations
-- - trend analysis
--
-- =========================================================



-- =========================================================
-- Q49. WHAT IS THE ROLE OF OVER()?
-- =========================================================
--
-- OVER() defines:
-- calculation window
-- for analytical functions.
--
-- =========================================================



-- =========================================================
-- Q50. DIFFERENCE BETWEEN LEAD AND LAG
-- =========================================================
--
-- LAG:
-- accesses previous row
--
-- LEAD:
-- accesses next row
--
-- =========================================================



-- =========================================================
-- Q51. WHY DO WINDOW FUNCTIONS
-- NOT COLLAPSE ROWS?
-- =========================================================
--
-- Because window functions perform
-- analytical calculations while
-- preserving original row visibility.
--
-- =========================================================



-- =========================================================
-- Q52. WHY ARE RANKING FUNCTIONS IMPORTANT
-- IN DASHBOARD SYSTEMS?
-- =========================================================
--
-- Used for:
-- - leaderboard systems
-- - KPI ranking
-- - top performer analysis
-- - analytics reporting
--
-- =========================================================



-- =========================================================
-- Q53. REAL-WORLD USE CASES
-- OF LEAD() AND LAG()
-- =========================================================
--
-- Used in:
-- - growth analysis
-- - sales comparison
-- - financial reporting
-- - KPI dashboards
-- - forecasting systems
--
-- =========================================================



-- =========================================================
-- Q54. EXPLAIN PARTITION-WISE RANKING
-- =========================================================
--
-- PARTITION BY creates separate
-- ranking groups for each category.
--
-- Example:
-- Department-wise rankings.
--
-- =========================================================



-- =========================================================
-- Q55. EXPLAIN TREND ANALYSIS
-- USING WINDOW FUNCTIONS
-- =========================================================
--
-- Trend analysis compares:
-- - previous values
-- - next values
-- - growth percentages
-- - performance trends
--
-- Using:
-- - LEAD()
-- - LAG()
-- - ORDER BY
--
-- =========================================================