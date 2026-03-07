-- 1. QUESTION LINK: https://leetcode.com/problems/restaurant-growth/description/?envType=problem-list-v2&envId=wwa0cvsi
-- using CTE
-- getting total sum for each day
WITH temp as (
    SELECT visited_on, SUM(amount) as amt
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
)

SELECT visited_on,
SUM(amt) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount,
(AVG(amt) OVER (ROWS BETWEEN 6 PREKOCEDING AND CURRENT ROW))::NUMERIC(10, 2) as average_amount
FROM temp
OFFSET 6;