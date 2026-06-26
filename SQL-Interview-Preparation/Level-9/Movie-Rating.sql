-- =====================================================
-- LeetCode 1341
-- Movie Rating
--
-- Topic:
-- JOIN
-- GROUP BY
-- AVG()
-- COUNT()
-- ORDER BY
-- UNION ALL
-- =====================================================


-- =====================================================
-- Solution (JOIN + GROUP BY + UNION ALL) [Optimal]
-- =====================================================


(
SELECT
    u.name AS results

FROM Users u

JOIN MovieRating mr

ON u.user_id = mr.user_id

GROUP BY
    u.user_id,
    u.name

ORDER BY
    COUNT(mr.movie_id) DESC,
    u.name ASC

LIMIT 1
)


UNION ALL


(
SELECT
    m.title AS results

FROM Movies m

JOIN MovieRating mr

ON m.movie_id = mr.movie_id

WHERE mr.created_at >= '2020-02-01'
AND mr.created_at < '2020-03-01'

GROUP BY
    m.movie_id,
    m.title

ORDER BY
    AVG(mr.rating) DESC,
    m.title ASC

LIMIT 1
);



-- =====================================================
-- Notes:
--
-- 1. First query finds user with maximum ratings.
--
-- 2. COUNT(movie_id) counts total movies rated.
--
-- 3. Second query finds highest average rated movie.
--
-- 4. February 2020 filter is applied.
--
-- 5. UNION ALL combines both results.
--
-- =====================================================