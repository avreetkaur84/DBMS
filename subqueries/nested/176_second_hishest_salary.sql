-- Question Link: https://leetcode.com/problems/second-highest-salary/description/

SELECT MAX(salary) [SecondHighestSalary]
FROM Employee
WHERE salary NOT IN (
    SELECT MAX(salary) FROM Employee
);