## 🔎 Things You Need to Work On (to build **intuition**, not hacks)

### 1. **GROUP BY & Aggregates**

* Right now you think of `GROUP BY` as “always required with MAX/MIN/AVG”.
* Intuition:

  * If you want **one value per whole table** → no `GROUP BY`.
  * If you want **one value per category** → add `GROUP BY category`.
* Work on: writing queries both **with and without GROUP BY** to see when each is needed.

---

### 2. **Scalar vs Multi-row Subqueries**

* You’re mixing `=` and `IN`.
* Intuition:

  * **Scalar subquery** → returns one cell (use `=`).
  * **Multi-row subquery** → returns a column/list (use `IN`, `ANY`, `ALL`).
* Practice until your brain auto-detects which one to use.

---

### 3. **Correlated vs Self-contained Subqueries**

* You struggled because you didn’t realize when to tie a subquery back to the outer query.
* Intuition:

  * If the subquery makes sense *by itself* → self-contained.
  * If it only makes sense *per row of outer query* → correlated.
* Exam loves to ask both.

---

### 4. **Joins vs Subqueries**

* You’re forcing subqueries even when a simple `JOIN` solves it.
* Intuition:

  * If you’re **matching rows between tables** → `JOIN`.
  * If you’re **filtering based on a calculated value** → subquery.
* Many questions can be solved either way → practice rewriting one style into the other.

---

### 5. **Aggregate Intuition (MAX with details)**

* Your biggest roadblock was: “How do I get the *name* of the employee with MAX salary?”
* Intuition:

  * Aggregates collapse detail → if you want both, you need **extra logic** (correlated subquery, join with derived table, or window functions).
* This is a **classic DBMS exam trap**.

---

### 6. **Execution Order of SQL**

* You’re writing queries “hoping SQL will understand”.
* Intuition: SQL executes in this order:
  `FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY`.
* If you understand this order, a lot of “why can’t I use MAX here?” questions vanish.

---

### 7. **Window Functions (bonus but powerful)**

* Not in your test syllabus yet, but they give the **cleanest solution** for “max per department” type queries.
* Example:

  ```sql
  SELECT d.name, e.name, e.salary
  FROM Employee e
  JOIN Department d ON e.departmentId = d.id
  WHERE e.salary = MAX(e.salary) OVER (PARTITION BY e.departmentId);
  ```
* Even if not in your exam, learning them sharpens aggregate intuition.

---

## 📌 Roadmap for You

1. **Step 1: Revisit Basics**

   * Re-study: `GROUP BY`, `HAVING`, `IN`, `EXISTS`, `ANY`, `ALL`.
   * Write your own *toy queries* on small tables (like 5 rows of Employee/Department).

2. **Step 2: Train Intuition**

   * For every query you solve, ask: *is this scalar or multi-row? self-contained or correlated?*

3. **Step 3: Dual Approach**

   * Solve each problem in **two ways**: using a `JOIN` and using a `subquery`.

4. **Step 4: Targeted LeetCode Practice**

   * 176, 177, 183, 184, 185 → hammer these until you don’t think, you *just know*.

5. **Step 5: Reflect After Each Error**

   * Don’t just fix the query → write down *why* the error happened. That’s how intuition locks in.

---