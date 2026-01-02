# 📘 SESSION 1 — WINDOW FUNCTIONS (FOUNDATION)

## 1️⃣ Why Window Functions Exist (The “Pain” They Solve)

Before window functions, SQL had a problem:

> “I want aggregate data **without losing row-level detail**.”

Example:

```sql
SELECT department, AVG(salary)
FROM employees
GROUP BY department;
```

This is fine… **but rows are gone**.
Now suppose you want:

👉 *Each employee’s salary + average salary of their department in the same row.*

Without window functions:

* subqueries
* self joins
* messy, unreadable SQL
* interviewers judging you silently

Enter **WINDOW FUNCTIONS** 🎉

---

## 2️⃣ What Is a Window Function? (Core Definition)

**Simple definition (memorize-worthy):**

> A window function performs a calculation across a set of rows related to the current row **without collapsing rows**.

🔑 Key difference from `GROUP BY`:

* `GROUP BY` → **reduces rows**
* Window function → **keeps rows**

---

## 3️⃣ The Syntax (This Is Non-Negotiable)

General form:

```sql
function_name(...) OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

### Think of `OVER()` as:

> “Define the window of rows I want to look at.”

If you understand `OVER()`, you understand window functions.

---

## 4️⃣ First Window Function: `AVG()` OVER()

Assume table:

```sql
employees(id, name, department, salary)
```

### ❌ Traditional aggregate

```sql
SELECT department, AVG(salary)
FROM employees
GROUP BY department;
```

### ✅ Window function

```sql
SELECT 
    name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM employees;
```

### What just happened?

* `PARTITION BY department` → divide rows into department-wise groups
* `AVG(salary)` → calculated **per partition**
* **No rows removed**

📌 Each employee sees their department’s average.

---

## 5️⃣ Mental Model (IMPORTANT)

Imagine:

* SQL first **builds the result set**
* Then window functions are applied **on top of it**

It’s like Excel:

* Each row exists
* You compute formulas referencing other rows

---

## 6️⃣ `PARTITION BY` vs `GROUP BY`

| Feature                    | GROUP BY | PARTITION BY |
| -------------------------- | -------- | ------------ |
| Reduces rows               | ✅        | ❌            |
| Keeps detail               | ❌        | ✅            |
| Used with aggregates       | ✅        | ✅            |
| Used with window functions | ❌        | ✅            |

🔥 Interview line:

> “`PARTITION BY` is like `GROUP BY`, but without collapsing rows.”

---

## 7️⃣ Using ORDER BY in Window Functions

Now things get spicy.

```sql
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
        ORDER BY salary
    ) AS running_avg
FROM employees;
```

### What does ORDER BY do here?

It creates a **running (cumulative) calculation**.

By default:

```
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
```

Meaning:

> “From the first row of the partition up to the current row”

---

## 8️⃣ Example: Running Salary Average

For department = IT:

| name | salary | running_avg |
| ---- | ------ | ----------- |
| A    | 50k    | 50k         |
| B    | 70k    | 60k         |
| C    | 90k    | 70k         |

💡 This is **impossible** to do cleanly without window functions.

---

## 9️⃣ Common Window Functions (Overview)

Don’t memorize yet—just recognize.

### Aggregate window functions:

* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`
* `COUNT()`

### Ranking window functions:

* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`

### Navigation:

* `LAG()`
* `LEAD()`

We’ll deep-dive these later.

---

## 🔥 Your First Practice (Do This Now)

Try these in PostgreSQL:

### 1️⃣ Department average salary

```sql
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department)
FROM employees;
```

### 2️⃣ Company-wide average salary

```sql
SELECT
    name,
    salary,
    AVG(salary) OVER ()
FROM employees;
```

(No partition = whole table)

---

## ⚠️ Common Beginner Mistakes

❌ Using `GROUP BY` with window functions unnecessarily
❌ Thinking `ORDER BY` sorts the output (it doesn’t)
❌ Confusing query `ORDER BY` vs window `ORDER BY`

---

## 🎯 Session 1 Summary (If You Remember Nothing Else)

* Window functions **do calculations without removing rows**
* `OVER()` defines the window
* `PARTITION BY` = logical grouping
* `ORDER BY` = running calculations
* PostgreSQL supports window functions beautifully

------------------

# 📘 SESSION 2 (REVISED) — WINDOW FRAMES & BASICS (THE REAL CORE)

We’ll do **three things**:

1. Understand `OVER`, `PARTITION BY`, `ORDER BY`
2. Understand **window frames** (`UNBOUNDED PRECEDING`, etc.)
3. Give you **LeetCode problems** that match *exactly* this level

No rankings. No LAG yet. Pure fundamentals.

---

## 1️⃣ Mental Model Upgrade: What Is a Window Frame?

You already know:

```sql
AVG(salary) OVER (PARTITION BY department)
```

This defines:

* **Partition** → which rows
* **But not HOW MANY rows are used per calculation**

That “how many” is controlled by the **window frame**.

---

## 2️⃣ Default Window Frame (CRITICAL)

When you write:

```sql
AVG(salary) OVER (
    PARTITION BY department
    ORDER BY salary
)
```

PostgreSQL silently expands it to:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
```

### Translation:

> “From the first row of the partition up to the current row”

That’s why you get **running averages**.

---

## 3️⃣ Window Frame Keywords (Memorize These)

| Keyword               | Meaning            |
| --------------------- | ------------------ |
| `UNBOUNDED PRECEDING` | Start of partition |
| `UNBOUNDED FOLLOWING` | End of partition   |
| `CURRENT ROW`         | Current row        |
| `n PRECEDING`         | n rows before      |
| `n FOLLOWING`         | n rows after       |

---

## 4️⃣ Visual Example (IT Department Salaries ASC)

| Salary | Row Position |
| ------ | ------------ |
| 70000  |              |
| 70000  |              |
| 90000  |              |
| 120000 |              |

---

## 5️⃣ Running Sum (Classic Example)

```sql
SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_sum
FROM employees;
```

Each row sees:

* all previous salaries + itself
* inside its department

---

## 6️⃣ Full Partition Calculation (Same Value Everywhere)

```sql
SUM(salary) OVER (
    PARTITION BY department
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
```

📌 This behaves like:

```sql
SUM(salary) GROUP BY department
```

But rows remain intact.

---

## 7️⃣ Sliding Window (This Is Powerful)

### Example: Salary + previous salary

```sql
AVG(salary) OVER (
    PARTITION BY department
    ORDER BY salary
    ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
) AS moving_avg
```

Each row sees:

* itself
* previous row only

Used heavily in analytics.

---

## 8️⃣ IMPORTANT: `ROWS` vs `RANGE` (Postgres Detail)

Default in PostgreSQL:

```sql
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
```

### Difference:

* `ROWS` → physical rows
* `RANGE` → logical values (ties matter)

⚠️ With duplicate salaries, `RANGE` can surprise you.

**For now**:

> Always explicitly use `ROWS` to avoid confusion.

---

## 9️⃣ Practice Queries (DO THESE)

### 1️⃣ Company-wide running salary (no partition)

```sql
SELECT
    emp_name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )
FROM employees;
```

### 2️⃣ Dept-wise full salary total

```sql
SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    )
FROM employees;
```

---

## 10️⃣ LeetCode Questions (Perfect for This Level)

These focus **only** on `OVER`, `PARTITION BY`, `ORDER BY`, frames.

### 🟢 Easy (Start Here)

1️⃣ **Running Total for Different Genders**
LeetCode 1308

> Practice running sum + partition

2️⃣ **Employees Earning More Than Their Managers**
(Not window-based but good warmup)

---

### 🟡 Medium (Best Matches)

3️⃣ **Department Highest Salary**
LeetCode 184
👉 First solve WITHOUT ranking, using window aggregates

4️⃣ **Calculate Cumulative Salary**
LeetCode 579
👉 Uses `ORDER BY` + `UNBOUNDED PRECEDING`

5️⃣ **Monthly Transactions I**
LeetCode 1193
👉 Partition + order by date

---

### 🧠 Bonus (Frame Awareness)

6️⃣ **Restaurant Growth**
LeetCode 1321
👉 Sliding window (7-day moving average)

