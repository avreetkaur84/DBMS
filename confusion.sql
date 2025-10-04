SELECT e.departmentId, MAX(e.salary), e.name
FROM Employee as e 
GROUP BY e.departmentId;

-- Why e.name is not being displayed, what other group by property am I missing?
-- SOLUTION:
-- If you use GROUP BY, every column in SELECT must be either:
-- Included in the GROUP BY clause, OR
-- Wrapped inside an aggregate function (MAX, MIN, AVG, COUNT, etc.)


SELECT xyz
FROM a
(Type) JOIN b
ON a.id = b.id