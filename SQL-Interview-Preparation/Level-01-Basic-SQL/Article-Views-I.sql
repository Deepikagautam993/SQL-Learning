-- LeetCode 1148
-- Article Views I

-- Topic:
-- DISTINCT, WHERE

-- Key Learning:
-- DISTINCT removes duplicate values.

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
