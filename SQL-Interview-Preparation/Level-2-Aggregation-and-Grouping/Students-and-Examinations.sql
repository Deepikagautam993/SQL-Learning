-- =====================================================
-- LeetCode 1280
-- Students and Examinations
--
-- Topic:
-- CROSS JOIN
-- LEFT JOIN
-- GROUP BY
-- COUNT()
-- =====================================================


-- =====================================================
-- Solution (CROSS JOIN + LEFT JOIN) [Optimal]
-- =====================================================


SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,

    COUNT(e.subject_name) AS attended_exams


FROM Students s


CROSS JOIN Subjects sub


LEFT JOIN Examinations e

ON s.student_id = e.student_id
AND sub.subject_name = e.subject_name


GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name


ORDER BY
    s.student_id,
    sub.subject_name;



-- =====================================================
-- Notes:
--
-- 1. CROSS JOIN creates every student-subject pair.
--
-- 2. LEFT JOIN keeps combinations even without exams.
--
-- 3. COUNT counts only existing exam records.
--
-- 4. Missing exams automatically become 0.
--
-- =====================================================