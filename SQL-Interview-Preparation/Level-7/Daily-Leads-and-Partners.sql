-- =====================================================
-- LeetCode 1693
-- Daily Leads and Partners
--
-- Topic:
-- GROUP BY
-- COUNT(DISTINCT)
-- Aggregation
-- =====================================================


-- =====================================================
-- Solution 1 (GROUP BY + COUNT DISTINCT) [Optimal]
-- =====================================================

SELECT
    date_id,
    make_name,

    COUNT(DISTINCT lead_id) AS unique_leads,

    COUNT(DISTINCT partner_id) AS unique_partners

FROM DailySales

GROUP BY
    date_id,
    make_name;



-- =====================================================
-- Solution 2 (Subquery)
-- =====================================================

SELECT
    date_id,
    make_name,

    (
        SELECT
            COUNT(DISTINCT lead_id)

        FROM DailySales d2

        WHERE d2.date_id = d1.date_id
        AND d2.make_name = d1.make_name

    ) AS unique_leads,


    (
        SELECT
            COUNT(DISTINCT partner_id)

        FROM DailySales d3

        WHERE d3.date_id = d1.date_id
        AND d3.make_name = d1.make_name

    ) AS unique_partners


FROM DailySales d1

GROUP BY
    date_id,
    make_name;



-- =====================================================
-- Notes:
--
-- 1. GROUP BY creates groups based on date and company.
--
-- 2. COUNT(DISTINCT) removes duplicate leads/partners.
--
-- 3. Aggregation is applied for every date-company pair.
--
-- =====================================================