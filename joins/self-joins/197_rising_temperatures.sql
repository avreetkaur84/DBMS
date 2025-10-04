-- Question Link: https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

-- SELF JOIN -> SAME TABLE -> SAME ROWS COMPARISON

SELECT cur.id
FROM Weather as cur
JOIN Weather as yest
ON DATEDIFF(day, yest.recordDate, cur.recordDate)=1
WHERE cur.temperature>yest.temperature;

-- on -> konsi rows ko apas mein compare karna hai, means kaise table ko compare karne hai, konsi condition par. 