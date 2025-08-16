-- Question_Link - https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50

-- Try using joins also --

/* Write your T-SQL query statement below */
SELECT V.customer_id, COUNT(V.customer_id) [count_no_trans]
FROM Visits as V 
WHERE V.visit_id NOT IN
(SELECT t.visit_id FROM Transactions as t)
GROUP BY V.customer_id;