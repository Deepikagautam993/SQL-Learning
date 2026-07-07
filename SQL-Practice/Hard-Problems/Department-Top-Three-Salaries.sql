-- =====================================================
-- LeetCode 185
-- Department Top Three Salaries
--
-- Topic:
-- Window Function
-- DENSE_RANK()
-- PARTITION BY
-- JOIN
-- =====================================================


-- =====================================================
-- Solution 1 (DENSE_RANK) [Optimal]
-- =====================================================

SELECT
    Department,
    Employee,
    Salary

FROM
(
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,

        DENSE_RANK() OVER(
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS rnk

    FROM Employee e

    JOIN Department d
    ON e.departmentId = d.id

) x

WHERE rnk <= 3;



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary

FROM Employee e

JOIN Department d
ON e.departmentId = d.id

WHERE 3 >
(
    SELECT COUNT(DISTINCT e2.salary)

    FROM Employee e2

    WHERE e2.departmentId = e.departmentId
    AND e2.salary > e.salary
);



-- =====================================================
-- Notes:
--
-- DENSE_RANK gives same rank to same salaries.
--
-- PARTITION BY creates separate ranking
-- for each department.
--
-- Top 3 salaries:
-- keep rows where rank <= 3
--
-- =====================================================