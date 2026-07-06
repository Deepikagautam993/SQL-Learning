-- LeetCode 1527
-- Patients With a Condition

-- Topic:
-- LIKE Operator
-- Pattern Matching

SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';