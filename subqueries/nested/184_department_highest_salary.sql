/* Write your T-SQL query statement below */
-- highest salary in each dep.

-- Department name issue as department name is in subquery, so can't use it in main query
-- SELECT e.departmentId, MAX(e.salary)
-- FROM Employee as e
-- JOIN Department as d
-- ON e.departmentId = d.id
-- GROUP BY d.id;

-- Main subquery to write both emp and department data
-- 1st subquery to get the employee id
-- 2nd subquery to get the max salary
SELECT d.name [Department], e.name [Employee], e.salary [Salary]
FROM Department as d 
JOIN Employee as e
ON e.departmentId=d.id 
WHERE e.salary IN
(SELECT MAX(salary) FROM Employee WHERE Employee.departmentId=d.id);