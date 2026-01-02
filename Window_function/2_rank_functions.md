# 📘 DENSE_RANK() — COMPLETE NOTES (PostgreSQL / SQL)

## 1️⃣ What is `DENSE_RANK()`?

`DENSE_RANK()` is a **window function** that assigns a rank to each row based on a specified order, **without skipping rank values when ties occur**.

---

## 2️⃣ Syntax

```sql
DENSE_RANK() OVER (
    PARTITION BY column_name   -- optional
    ORDER BY column_name [ASC | DESC]
)
```

⚠️ `DENSE_RANK()` takes **no arguments**.

---

## 3️⃣ Why No Parameters Inside `DENSE_RANK()`?

Because:

* `DENSE_RANK()` does **not calculate on column values**
* It only **labels rows based on their position**
* The **ranking logic comes entirely from `ORDER BY`**

Think of it as:

> “Given an order, assign ranks.”

---

## 4️⃣ Core Rules of `DENSE_RANK()`

1. Rows are ranked according to `ORDER BY`
2. Equal values → same rank
3. Next rank is **incremented by 1** (no gaps)
4. Ranking restarts for each partition (if `PARTITION BY` is used)

---

## 5️⃣ Example Without PARTITION

```sql
SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores;
```

### Input:

```
4.00
4.00
3.85
3.65
3.65
3.50
```

### Output:

```
score | rank
4.00  | 1
4.00  | 1
3.85  | 2
3.65  | 3
3.65  | 3
3.50  | 4
```

---

## 6️⃣ Example With PARTITION

```sql
SELECT
    emp_name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_salary_rank
FROM employees;
```

📌 Ranking restarts **inside each department**.

---

## 7️⃣ Comparison With Other Ranking Functions

| Function       | Handles Ties | Skips Ranks | Use Case             |
| -------------- | ------------ | ----------- | -------------------- |
| `ROW_NUMBER()` | ❌            | ❌           | Unique row numbering |
| `RANK()`       | ✅            | ✅           | Competition ranking  |
| `DENSE_RANK()` | ✅            | ❌           | Ordered categories   |

---

## 8️⃣ When to Use `DENSE_RANK()`

Use `DENSE_RANK()` when:

* Ties must share the same rank
* Ranking numbers must be **continuous**
* Questions mention:

  * “no gaps”
  * “consecutive ranks”
  * “same rank for same values”

Typical problems:

* Rank scores
* Top N per group
* Salary ranking
* Leaderboards

---

## 9️⃣ Mental Model (Very Important)

> **Dense rank = count of DISTINCT values greater than current + 1**

This explains why your subquery solution worked — you manually implemented dense ranking.

---

## 🔟 Interview One-Liner (Use This)

> “`DENSE_RANK()` assigns ranks based on ordering, gives the same rank to ties, and does not skip rank values.”

Say this and stop. Interviewer will move on.

---



---

# 📘 SQL RANKING — COMPLETE GUIDE (WINDOW + NON-WINDOW)

## 1️⃣ The Three Ranking Functions (Big Picture)

| Function       | Ties | Gaps | Use When            |
| -------------- | ---- | ---- | ------------------- |
| `ROW_NUMBER()` | ❌    | ❌    | Unique ordering     |
| `RANK()`       | ✅    | ✅    | Competition ranking |
| `DENSE_RANK()` | ✅    | ❌    | Ordered categories  |

---

## 2️⃣ `RANK()` — What It Actually Does

### Definition

`RANK()` assigns the same rank to equal values, **but skips rank numbers after ties**.

This is also called **competition ranking**.

---

## 3️⃣ Syntax

```sql
RANK() OVER (
    PARTITION BY column_name   -- optional
    ORDER BY column_name DESC
)
```

⚠️ No arguments inside `RANK()`.

---

## 4️⃣ Example (Important)

### Input scores:

```
4.00
4.00
3.85
3.65
3.65
3.50
```

### Output using `RANK()`:

| score | rank |
| ----- | ---- |
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 3    |
| 3.65  | 4    |
| 3.65  | 4    |
| 3.50  | 6    |

📌 Notice the gaps:

* Rank **2** is skipped
* Rank **5** is skipped

---

## 5️⃣ Why Gaps Exist (Intuition)

Think of a race:

* Two people tie for 1st
* Next person is **3rd**, not 2nd

That’s exactly how `RANK()` behaves.

---

## 6️⃣ `RANK()` vs `DENSE_RANK()` (Burn This In)

| Feature            | RANK         | DENSE_RANK |
| ------------------ | ------------ | ---------- |
| Same rank for ties | ✅            | ✅          |
| Skips ranks        | ✅            | ❌          |
| Continuous ranking | ❌            | ✅          |
| Common use         | competitions | grouping   |

---

## 7️⃣ When to Use `RANK()` (Very Specific)

Use `RANK()` when:

* Ranking represents **position count**
* Gaps are meaningful
* Example problems:

  * sports leaderboards
  * exam positions
  * race results

---

## 8️⃣ When NOT to Use `RANK()`

❌ “Top 3 per department”
❌ “Second highest salary”
❌ “No gaps allowed”

In these cases → `DENSE_RANK()`.

---

## 9️⃣ Ranking With PARTITION (Very Common)

```sql
SELECT
    emp_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;
```

Each department gets its own ranking.

---

## 🔟 Ranking Without Window Functions (Old-School)

### Example: Dense Rank Without Window Functions

```sql
SELECT s1.score,
       1 + COUNT(DISTINCT s2.score) AS rank
FROM Scores s1
LEFT JOIN Scores s2
    ON s2.score > s1.score
GROUP BY s1.score
ORDER BY s1.score DESC;
```

📌 Works, but:

* harder to read
* slower
* not scalable

Use only if window functions are unavailable.

---

## 1️⃣1️⃣ Ranking Patterns (Interview Gold)

### 🔹 Top N per Group

```sql
DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC)
```

### 🔹 Second Highest Value

```sql
WHERE rank = 2
```

### 🔹 Unique Row ID

```sql
ROW_NUMBER() OVER (ORDER BY ...)
```

---

## 1️⃣2️⃣ Common Ranking Interview Questions

| Question              | Function   |
| --------------------- | ---------- |
| Rank scores           | DENSE_RANK |
| Top N per department  | DENSE_RANK |
| Second highest salary | DENSE_RANK |
| Competition ranking   | RANK       |
| Unique ordering       | ROW_NUMBER |

---

## 1️⃣3️⃣ One-Line Intuition Summary

* `ROW_NUMBER()` → **identity**
* `RANK()` → **position**
* `DENSE_RANK()` → **category order**

---

## 1️⃣4️⃣ Interview Killer Line

> “I choose between `RANK()` and `DENSE_RANK()` based on whether gaps in ranking are meaningful.”

Say that and stop talking.

---

## 1️⃣5️⃣ Final Mental Shortcut (Memorize)

> If ranks must be **continuous → DENSE_RANK**
> If rank represents **position count → RANK**

---

## Where You Are Now

You now fully understand:

* all ranking window functions
* when to use each
* how to simulate them without windows
* how to recognize ranking problems instantly

This is **core SQL mastery territory**.

---