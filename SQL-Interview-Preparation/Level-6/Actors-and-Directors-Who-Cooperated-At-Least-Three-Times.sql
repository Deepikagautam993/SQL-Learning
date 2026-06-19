-- =====================================================
-- LeetCode 1050
-- Actors and Directors Who Cooperated At Least Three Times
--
-- Topic:
-- GROUP BY
-- HAVING
-- COUNT()
-- =====================================================


-- =====================================================
-- Solution 1 (GROUP BY + HAVING) [Optimal]
-- =====================================================

SELECT
    actor_id,
    director_id

FROM ActorDirector

GROUP BY
    actor_id,
    director_id

HAVING COUNT(*) >= 3;



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    actor_id,
    director_id

FROM ActorDirector

WHERE (actor_id, director_id) IN
(
    SELECT
        actor_id,
        director_id

    FROM ActorDirector

    GROUP BY
        actor_id,
        director_id

    HAVING COUNT(*) >= 3
);



-- =====================================================
-- Notes:
--
-- 1. Same actor-director pair is grouped together.
--
-- 2. COUNT(*) counts how many times they worked together.
--
-- 3. HAVING filters groups after aggregation.
--
-- =====================================================