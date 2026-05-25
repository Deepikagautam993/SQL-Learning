-- =========================================================
-- DAY 07 - RANKING FUNCTIONS
-- =========================================================

-- =========================================================
-- TOPIC OVERVIEW
-- =========================================================
-- Ranking functions assign sequence numbers
-- or rankings to rows based on ordering.
--
-- Functions Covered:
-- - ROW_NUMBER()
-- - RANK()
-- - DENSE_RANK()
--
-- These functions are heavily used in:
-- - leaderboard systems
-- - KPI dashboards
-- - employee performance analysis
-- - top performer analytics
-- - sales ranking systems
-- =========================================================



-- =========================================================
-- VIEW EMPLOYEE TABLE
-- =========================================================

SELECT *
FROM employees;



-- =========================================================
-- ROW_NUMBER() FUNCTION
-- =========================================================
-- ROW_NUMBER assigns unique sequence numbers
-- to every row.
--
-- IMPORTANT:
-- Duplicate values still receive
-- different sequence numbers.
-- =========================================================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_number
FROM employees;



-- =========================================================
-- ROW_NUMBER() WITH ASCENDING ORDER
-- =========================================================
-- Lowest salary receives row number 1.
--
-- Business Use Case:
-- Salary ordering analysis.
-- =========================================================

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary ASC
    ) AS ascending_row_number
FROM employees;



-- =========================================================
-- ROW_NUMBER() WITH PARTITION BY
-- =========================================================
-- Creates separate rankings
-- inside each department.
--
-- Business Use Case:
-- Department-wise employee ranking.
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
-- RANK() FUNCTION
-- =========================================================
-- Duplicate values receive same rank.
--
-- IMPORTANT:
-- RANK skips positions after duplicates.
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;



-- =========================================================
-- RANK() WITH PARTITION BY
-- =========================================================
-- Creates department-wise ranking groups.
--
-- Business Use Case:
-- Highest paid employee analysis.
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
-- DENSE_RANK() FUNCTION
-- =========================================================
-- Duplicate values receive same rank.
--
-- IMPORTANT:
-- DENSE_RANK does NOT skip ranks.
-- =========================================================

SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_salary_rank
FROM employees;



-- =========================================================
-- DENSE_RANK() WITH PARTITION BY
-- =========================================================
-- Department-wise dense ranking.
--
-- Business Use Case:
-- Department leaderboard analysis.
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
-- COMPANY-WIDE SALARY RANKING
-- =========================================================
-- Highest salary receives rank 1.
--
-- Used in salary analytics dashboards.
-- =========================================================

SELECT
    emp_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS company_salary_rank
FROM employees;



-- =========================================================
-- TOP 3 HIGHEST PAID EMPLOYEES
-- =========================================================
-- Common interview-level analytical query.
--
-- Inner query:
-- Assigns rankings.
--
-- Outer query:
-- Filters top 3 employees.
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
-- TOP 2 HIGHEST PAID EMPLOYEES
-- =========================================================
-- Advanced ranking filter example.
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
) ranked_employees
WHERE row_num <= 2;



-- =========================================================
-- LOWEST PAID EMPLOYEE IN EACH DEPARTMENT
-- =========================================================
-- Finds minimum salary employee
-- inside each department.
--
-- Business Use Case:
-- Department salary benchmarking.
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
-- HIGHEST PAID EMPLOYEE IN EACH DEPARTMENT
-- =========================================================
-- Finds top salary employee
-- in every department.
--
-- Most common real-world analytical query.
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
-- DIFFERENCE BETWEEN ROW_NUMBER,
-- RANK AND DENSE_RANK
-- =========================================================
--
-- ROW_NUMBER:
-- - always unique
-- - no duplicate ranks
--
-- RANK:
-- - duplicate ranks allowed
-- - skips positions
--
-- DENSE_RANK:
-- - duplicate ranks allowed
-- - no skipped positions
--
-- MOST IMPORTANT INTERVIEW CONCEPT.
-- =========================================================



-- =========================================================
-- IMPORTANT INTERVIEW CONCEPTS
-- =========================================================
--
-- 1. ROW_NUMBER gives unique sequence numbers.
--
-- 2. RANK skips duplicate positions.
--
-- 3. DENSE_RANK does not skip positions.
--
-- 4. PARTITION BY creates separate ranking groups.
--
-- 5. ORDER BY controls ranking sequence.
--
-- 6. Ranking functions are heavily used in:
--    - dashboards
--    - KPI systems
--    - leaderboard systems
--    - analytics reporting
--
-- 7. Top-N queries are frequently asked
--    in SQL interviews.
--
-- =========================================================



-- =========================================================
-- FINAL UNDERSTANDING
-- =========================================================
-- Concepts Learned:
--
-- 1. ROW_NUMBER()
-- 2. RANK()
-- 3. DENSE_RANK()
-- 4. PARTITION BY with ranking
-- 5. Top-N analytical queries
-- 6. Department-wise ranking
--
-- Skills Developed:
-- - ranking analysis
-- - leaderboard systems
-- - KPI reporting
-- - employee analytics
-- - dashboard calculations
-- =========================================================