### 1. **Subqueries – Part 1**

#### (a) Nested Subqueries

* **Definition:** A query inside another query, enclosed in parentheses.
* **Where they appear:** `WHERE`, `FROM`, `SELECT`, `HAVING`.
* **Exam traps:**

  * Using `IN`, `ANY`, `ALL` correctly.
  * Difference between `=` vs `IN` vs `EXISTS`.
  * Using subqueries inside `SELECT` to compute values dynamically.
* **Practice example:**

  > Find employees whose salary is higher than the **average salary** of the company.

---

#### (b) Scalar & Multi-row Subqueries

* **Scalar Subquery:** Returns **exactly one value** (like a single cell).

  * Can be placed in `SELECT`, `WHERE`, `HAVING`.
  * **Error to watch:** If it accidentally returns more than one row, SQL Server will throw an error.
* **Multi-row Subquery:** Returns **multiple values** (like a column).

  * Must be used with `IN`, `ANY`, `ALL`.
* **Practice example:**

  > Get names of employees whose salary is in the **top 3 highest salaries**.

---

### 2. **Subqueries – Part 2**

#### (a) Self-Contained Subqueries

* **Definition:** Subquery that **does not depend** on the outer query.

  * Executes once, result is reused.
* **Key use-cases:** Comparisons with aggregates (min, max, avg).
* **Practice example:**

  > Find employees who earn more than the **average salary** of all employees.

---

#### (b) Co-related Subqueries

* **Definition:** Subquery that **depends on outer query** — executed *row by row*.
* **Performance heavy** (SQL Server runs it multiple times).
* **Keywords:** Often used with `EXISTS`.
* **Exam traps:** Understanding why this is different from a join.
* **Practice example:**

  > Find employees who earn more than the **average salary of their own department**.

---

## 🎯 How to Study (for maximum impact in exam)

1. **Theory (Conceptual clarity):**

   * Understand *where* subqueries can be placed (`SELECT`, `WHERE`, `HAVING`, `FROM`).
   * Know difference between self-contained vs co-related.
   * Memorize when to use `IN`, `EXISTS`, `ANY`, `ALL`.

2. **Hands-on Practice (SQL Server):**

   * Write queries on a sample database (`AdventureWorks` or your own employee-department DB).
   * Focus on **common exam-type questions**:

     * Employees with highest/lowest salaries.
     * Departments with avg salary higher than X.
     * Customers who ordered something.
     * Students with marks greater than class average.

3. **Revision Strategy:**

   * Keep a small **cheat sheet** for:

     * Scalar vs multi-row
     * Self-contained vs co-related
     * IN vs EXISTS vs ANY vs ALL

---