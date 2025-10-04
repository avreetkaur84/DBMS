# 🔥 Deep Dive into Subqueries 

---

## **1. Scalar Subquery** (one output, one cell 🟢)

* **Class Definition:** returns one output, used with `=, <, >, !=`
* **Real Intuition:** Think of it as a variable. The subquery runs once and produces a single value → outer query compares with it.
* ✅ Example:

  ```sql
  -- Employee(s) with highest salary
  SELECT *
  FROM MyEmployees
  WHERE Salary = (SELECT MAX(Salary) FROM MyEmployees);
  ```
* 🔑 Viva trick: if your subquery returns **multiple rows**, it will throw an error with `=` operator. That’s how you know you should’ve used `IN`.

---

## **2. Multi-Row (a.k.a Multi-Valued) Subquery** (returns a list 📜)

* **Class Definition:** returns multiple rows, use `IN, NOT IN, ANY, ALL`
* **Real Intuition:** It’s basically like supplying a mini table of values for filtering.
* ✅ Example with `IN`:

  ```sql
  SELECT *
  FROM MyEmployees
  WHERE Dept_ID IN (SELECT ID FROM Dept WHERE Location = 'Delhi');
  ```
* ✅ Example with `ANY / ALL`:

  ```sql
  -- Employees who earn more than ANY salary in dept 2
  SELECT EmpName, Salary
  FROM MyEmployees
  WHERE Salary > ANY (SELECT Salary FROM MyEmployees WHERE Dept_ID = 2);

  -- Employees who earn more than ALL salaries in dept 2
  SELECT EmpName, Salary
  FROM MyEmployees
  WHERE Salary > ALL (SELECT Salary FROM MyEmployees WHERE Dept_ID = 2);
  ```

---

## **3. Self-Contained Subquery** (no dependency 🏠)

* **Class Definition:** no dependency on outer query
* **Real Intuition:** Run it in isolation → works fine.
* ✅ Example:

  ```sql
  -- Employees in Accounts dept
  SELECT *
  FROM MyEmployees
  WHERE Dept_ID = (SELECT ID FROM Dept WHERE Dept_Name = 'Accounts');
  ```
* 🔑 Easy to spot: outer query doesn’t pass anything “inside”.

---

## **4. Correlated Subquery** (depends on outer query 🔗)

* **Class Definition:** inner query refers to outer query columns

* **Real Intuition:** Runs **once per row** of outer query → expensive, but powerful.

* ✅ Example:

  ```sql
  -- Employees with max salary in each department
  SELECT EmpName, Salary, Dept_ID
  FROM MyEmployees E
  WHERE Salary = (
    SELECT MAX(Salary)
    FROM MyEmployees
    WHERE Dept_ID = E.Dept_ID
  );
  ```

  👉 Notice how the subquery uses `E.Dept_ID` (from outer query).

* 🔑 Viva trick: if inner query has alias reference to outer → it’s correlated. If not → self-contained.

---

# **Placement of Subqueries (Where they can sit 🪑)**

1. **In WHERE clause** → most common (filtering)

   ```sql
   SELECT EmpName FROM MyEmployees
   WHERE Salary > (SELECT AVG(Salary) FROM MyEmployees);
   ```

2. **In SELECT clause** → for derived/calculated columns

   ```sql
   SELECT EmpName,
          (SELECT Dept_Name FROM Dept D WHERE D.ID = E.Dept_ID) AS DeptName
   FROM MyEmployees E;
   ```

3. **In FROM clause** → treat subquery as a virtual table (a “derived table”)

   ```sql
   SELECT Dept_ID, AvgSalary
   FROM (SELECT Dept_ID, AVG(Salary) AS AvgSalary
         FROM MyEmployees
         GROUP BY Dept_ID) AS Temp;
   ```

---

---

## **Phase 2: IN, ANY, ALL, EXISTS (your blind spot 🤯)**

These are weapons when dealing with subqueries:

* `IN` → checks if value exists in a set.

  ```sql
  SELECT name FROM Employee WHERE departmentId IN (1, 2, 3);
  ```

* `ANY` → condition is true if it matches *at least one*.

  ```sql
  SELECT name FROM Employee
  WHERE salary > ANY (SELECT salary FROM Employee WHERE departmentId = 2);
  ```

  👉 Means salary > minimum salary in dept 2.

* `ALL` → condition must hold for *every row*.

  ```sql
  SELECT name FROM Employee
  WHERE salary > ALL (SELECT salary FROM Employee WHERE departmentId = 2);
  ```

  👉 Means salary > maximum salary in dept 2.

* `EXISTS` → checks if subquery returns **any rows at all**.

  ```sql
  SELECT d.name
  FROM Department d
  WHERE EXISTS (SELECT 1 FROM Employee e WHERE e.departmentId = d.id);
  ```

  👉 Only returns departments that have employees.

---

## **Phase 3: Aggregates & GROUP BY (your mental block 🧱)**

👉 Key truth:

* Aggregate functions (`MAX`, `MIN`, `SUM`, `AVG`, `COUNT`) can be used **without GROUP BY** if you want a single summary of the whole table.
* `GROUP BY` is only needed when you want aggregates **per group**.

Example:

```sql
-- Without GROUP BY → single max
SELECT MAX(salary) FROM Employee;

-- With GROUP BY → max per department
SELECT departmentId, MAX(salary)
FROM Employee
GROUP BY departmentId;
```
