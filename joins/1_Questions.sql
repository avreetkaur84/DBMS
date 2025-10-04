/*
Top Earners by Department
Find the employee(s) with the highest salary in each department.

Department Spending on Salaries
Show each department’s total salary expense. Filter only those departments spending more than 50,000.

Projects with Most Employees
List the project name(s) with the highest number of employees working on them.

Managers with More Than 3 Direct Reports
Show manager names and the count of their direct employees, but only those managing more than 3.

Employees Without Projects
List employees who are not working on any project.

Departments with Average Salary Above Company Average
Find all departments where the average salary is above the overall company average salary.

Longest Hours Worked
Find the employee(s) who worked the most hours in total across all projects.

Employees Earning More Than Their Manager
Find employees who earn more than their manager.

Cross Department Collaboration
Find projects where employees from more than one department are working together.

Nth Highest Salary (classic)
Get the 2nd highest salary among all employees (hint: aggregation with subquery or window function).

*/

-- 1. Top Earners by Department
SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

-- 2. Department Spending on Salaries
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING SUM(e.salary) > 50000;

-- 3. Projects with Most Employees
SELECT p.proj_name, COUNT(w.emp_id) AS num_employees
FROM WorksOn w
JOIN Projects p ON w.proj_id = p.proj_id
GROUP BY p.proj_name
HAVING COUNT(w.emp_id) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(emp_id) AS cnt
        FROM WorksOn
        GROUP BY proj_id
    ) 
);

-- 4. Managers with More Than 3 Direct Reports
SELECT m.emp_name AS manager_name, COUNT(e.emp_id) AS num_reports
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING COUNT(e.emp_id) > 3;

-- 5. Employees Without Projects
SELECT e.emp_id, e.emp_name
FROM Employees e
LEFT JOIN WorksOn w ON e.emp_id = w.emp_id
WHERE w.emp_id IS NULL;

-- 6. Departments with Avg Salary Above Company Avg
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > (SELECT AVG(salary) FROM Employees);

-- 7. Longest Hours Worked
SELECT e.emp_id, e.emp_name, SUM(w.hours) AS total_hours
FROM WorksOn w
JOIN Employees e ON w.emp_id = e.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING SUM(w.hours) = (
    SELECT MAX(total_hours)
    FROM (
        SELECT SUM(hours) AS total_hours
        FROM WorksOn
        GROUP BY emp_id
    ) t
);

-- 8. Employees Earning More Than Their Manager
SELECT e.emp_id, e.emp_name, e.salary, m.emp_name AS manager_name, m.salary AS manager_salary
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- 9. Cross Department Collaboration
SELECT p.proj_name
FROM WorksOn w
JOIN Employees e ON w.emp_id = e.emp_id
JOIN Projects p ON w.proj_id = p.proj_id
GROUP BY p.proj_name
HAVING COUNT(DISTINCT e.dept_id) > 1;

-- 10. 2nd Highest Salary (generic Nth)
SELECT DISTINCT salary
FROM Employees e1
WHERE 2 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM Employees e2
    WHERE e2.salary > e1.salary
);
