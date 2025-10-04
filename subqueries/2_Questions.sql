/*
Above/Below Dept Avg
For each employee, show emp_name, dept_id, salary, and a column "Comparison" with values "Above Dept Avg" or "Below Dept Avg" using a correlated subquery + CASE.

Nth Highest Salary
Find the 3rd highest salary using correlated subquery.

Students vs Class Average
Show student_id, name, marks, and "Status" as "Above Avg" or "Below Avg" compared to their class’s average.

Most Expensive Product per Category
For each product, mark "Max" if its price is the highest in its category, else "Not Max".

Department Salary Bands
For each employee, assign a grade:

"Top Earner" if salary = dept max

"Low Earner" if salary = dept min

"Average Earner" otherwise.

Employee Ranking Within Dept
For each employee, show how many employees in their department earn more than them (using correlated subquery).

Pass/Fail Classification
For each student, show "Pass" if marks ≥ class average, else "Fail" (CASE + subquery).

Salary Comparison with Manager
For each employee, mark "Higher" if salary > manager’s salary, "Equal" if same, "Lower" otherwise.

Aggregate with CASE
Show department-wise count of employees earning "Above Dept Avg" vs "Below Dept Avg".

Flag Employees Earning More Than Company Avg
For each employee, show emp_id, emp_name, salary, and a column "Flag" with "Above Company Avg" or "Below Company Avg".
*/

-- 1. Above/Below Dept Avg
SELECT e.emp_name, e.dept_id, e.salary,
       CASE 
           WHEN e.salary > (SELECT AVG(salary) 
                            FROM Employees 
                            WHERE dept_id = e.dept_id) 
           THEN 'Above Dept Avg'
           ELSE 'Below Dept Avg'
       END AS Comparison
FROM Employees e;

-- 2. Nth Highest Salary (3rd Highest)
SELECT DISTINCT e1.salary
FROM Employees e1
WHERE 3 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM Employees e2
    WHERE e2.salary > e1.salary
);

-- 3. Students vs Class Average
SELECT s.student_id, s.name, s.marks,
       CASE
           WHEN s.marks > (SELECT AVG(marks)
                           FROM Students
                           WHERE class_id = s.class_id)
           THEN 'Above Avg'
           ELSE 'Below Avg'
       END AS Status
FROM Students s;

-- 4. Most Expensive Product per Category
SELECT p.prod_id, p.prod_name, p.category_id, p.price,
       CASE
           WHEN p.price = (SELECT MAX(price) 
                           FROM Products 
                           WHERE category_id = p.category_id)
           THEN 'Max'
           ELSE 'Not Max'
       END AS PriceStatus
FROM Products p;

-- 5. Department Salary Bands
SELECT e.emp_id, e.emp_name, e.salary, e.dept_id,
       CASE
           WHEN e.salary = (SELECT MAX(salary) 
                            FROM Employees 
                            WHERE dept_id = e.dept_id) 
           THEN 'Top Earner'
           WHEN e.salary = (SELECT MIN(salary) 
                            FROM Employees 
                            WHERE dept_id = e.dept_id) 
           THEN 'Low Earner'
           ELSE 'Average Earner'
       END AS SalaryBand
FROM Employees e;

-- 6. Employee Ranking Within Dept
SELECT e.emp_id, e.emp_name, e.dept_id, e.salary,
       (SELECT COUNT(*) 
        FROM Employees e2 
        WHERE e2.dept_id = e.dept_id AND e2.salary > e.salary) AS higher_count
FROM Employees e;

-- 7. Pass/Fail Classification
SELECT s.student_id, s.name, s.marks,
       CASE
           WHEN s.marks >= (SELECT AVG(marks) 
                            FROM Students 
                            WHERE class_id = s.class_id)
           THEN 'Pass'
           ELSE 'Fail'
       END AS Result
FROM Students s;

-- 8. Salary Comparison with Manager
SELECT e.emp_id, e.emp_name, e.salary, m.emp_name AS manager_name, m.salary AS manager_salary,
       CASE
           WHEN e.salary > m.salary THEN 'Higher'
           WHEN e.salary = m.salary THEN 'Equal'
           ELSE 'Lower'
       END AS Comparison
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id;

-- 9. Aggregate with CASE
SELECT d.dept_id,
       SUM(CASE WHEN e.salary > (SELECT AVG(salary) 
                                 FROM Employees 
                                 WHERE dept_id = e.dept_id) 
                THEN 1 ELSE 0 END) AS above_avg_count,
       SUM(CASE WHEN e.salary <= (SELECT AVG(salary) 
                                  FROM Employees 
                                  WHERE dept_id = e.dept_id) 
                THEN 1 ELSE 0 END) AS below_avg_count
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id;

-- 10. Flag Employees Earning More Than Company Avg
SELECT e.emp_id, e.emp_name, e.salary,
       CASE
           WHEN e.salary > (SELECT AVG(salary) FROM Employees) 
           THEN 'Above Company Avg'
           ELSE 'Below Company Avg'
       END AS Flag
FROM Employees e;