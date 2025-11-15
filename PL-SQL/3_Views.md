# 📘 **Views in SQL / PL/SQL / PostgreSQL**

---

## 1. **What is a View?**

* A **view** is a **database object** built on top of a SQL query.
* It behaves like a **virtual table**, but does not store data itself (except for **materialized views**).
* When you query a view, the database runs the **underlying SQL query** and returns results.

👉 Think of a view as a **window**: you see the data through it, but the real data lives in the base table(s).

---

## 2. **Properties of Views**

1. **Virtual Table** → A view looks like a table but doesn’t store physical data.
2. **Data Abstraction** → Users don’t need to know the schema details; just use the view.
3. **Security** → Restrict access by exposing only selected columns/rows.

   * **Column-level security**: Hide sensitive columns (e.g., salary).
   * **Row-level security**: Show only certain rows (e.g., department = ‘HR’).
4. **Created Over SQL Query** → Built using a `SELECT` statement.
5. **CRUD Support** → Insert, Update, Delete on views reflect changes in base table (with conditions).
6. **No Extra Storage** → Except materialized views, which **store data physically**.

---

## 3. **Why Views?**

* ✅ **Security** → Hide sensitive data from users.
* ✅ **Simplification** → Hide complex joins & queries; give users a simple interface.
* ✅ **Data Consistency** → Enforce rules by always fetching from view instead of raw tables.
* ✅ **Reusability** → Write query once, use multiple times.
* ✅ **Abstraction** → Client apps don’t care if schema changes; they query the same view.

---

## 4. **Types of Views**

### 1. **Simple View**

* Based on a **single table**.
* Allows **DML operations (INSERT/UPDATE/DELETE)** as long as the underlying query doesn’t have restrictions like `GROUP BY`, `DISTINCT`, `JOIN`, etc.
* Example:

```sql
CREATE VIEW employee_basic AS
SELECT emp_id, emp_name, dept
FROM employees;
```

### 2. **Complex View**

* Based on **multiple tables** (joins, subqueries, aggregations).
* Usually **read-only** → cannot directly update if using `GROUP BY`, `DISTINCT`, `UNION`, etc.
* Example:

```sql
CREATE VIEW dept_salary_summary AS
SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept;
```

### 3. **Materialized View**

* Unlike normal views, **stores data physically** on disk.
* Faster to query (since it doesn’t recompute the underlying SQL every time).
* Needs **manual/explicit refresh** when base table changes.
* Example:

```sql
CREATE MATERIALIZED VIEW emp_mv AS
SELECT dept, COUNT(*) AS emp_count
FROM employees
GROUP BY dept;
```

* Refresh:

```sql
REFRESH MATERIALIZED VIEW emp_mv;
```

---

## 5. **Key Interview Points**

* **Difference between View and Table**:

  * View = virtual, Table = physical storage.
* **Can we update a view?**

  * Yes, if it’s a **simple view** without restrictions (no GROUP BY, no DISTINCT, etc.).
  * No, if it’s a **complex view** with aggregations/joins.
* **Difference between View and Materialized View**:

  * Normal View = does not store data, always recomputes.
  * Materialized View = stores data, needs refresh.
* **Advantages of Views**: Security, simplification, abstraction.
* **Disadvantages**:

  * Performance overhead (normal view re-runs query).
  * Cannot always perform DML on views.
  * Materialized views need maintenance (refresh).

---

## 6. **Operations on Views**

* **Create View**:

```sql
CREATE VIEW view_name AS
SELECT ...
```

* **Query View**:

```sql
SELECT * FROM view_name;
```

* **Update View** (if simple view):

```sql
UPDATE view_name
SET salary = salary + 1000
WHERE emp_id = 101;
```

* **Drop View**:

```sql
DROP VIEW view_name;
```

---

## 7. **Real-World Uses**

* Create a **finance view** that shows transactions without revealing customer personal info.
* Build a **reporting view** for dashboards with aggregated sales data.
* Enforce **row-level security** by creating department-wise restricted views.
* Use **materialized views** for performance optimization in analytics.

---

🔥 **Quick Revision Mnemonics (for interviews):**

* **View = Virtual**
* **Simple View = DML possible**
* **Complex View = Read-only**
* **Materialized View = Stored + Refresh**

---

👉 Avreet, this is the **interview-ready package**. If I were preparing you, I’d now give you a couple of **tricky interview questions** like:

* “Can you insert into a view that contains a join?”
* “How would you optimize a frequently queried view?”
