-- LeetCode 1683
-- Invalid Tweets

-- Topic:
-- String Functions, CHAR_LENGTH()

-- Problem:
-- Find tweets whose content length is greater than 15.

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;