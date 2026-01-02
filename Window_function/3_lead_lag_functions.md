## Basic idea

`LEAD()` returns a value from a **following row** in the result set, based on an order you define.

### Syntax

```sql
LEAD(column_name, offset, default_value)
OVER (
    PARTITION BY partition_column
    ORDER BY order_column
)
```

* **column_name** → value you want from the next row
* **offset** → how many rows ahead (default = `1`)
* **default_value** → what to return if there is no next row

---

## Simple example

### Table: `sales`

| day | revenue |
| --- | ------- |
| Mon | 100     |
| Tue | 120     |
| Wed | 90      |

```sql
SELECT
    day,
    revenue,
    LEAD(revenue) OVER (ORDER BY day) AS next_day_revenue
FROM sales;
```

### Result

| day | revenue | next_day_revenue |
| --- | ------- | ---------------- |
| Mon | 100     | 120              |
| Tue | 120     | 90               |
| Wed | 90      | NULL             |

👉 Wednesday has no next day, so it gets `NULL`.

---

## With default value

```sql
LEAD(revenue, 1, 0) OVER (ORDER BY day)
```

Now the last row returns `0` instead of `NULL`.

---

## Using PARTITION BY

Useful when working with **groups** (like per user, per department, per stock).

```sql
LEAD(salary) OVER (
    PARTITION BY department
    ORDER BY salary
)
```

Each department is handled separately.

---

## Common use cases

* Comparing **current vs next row**
* Calculating **day-over-day change**
* Detecting **gaps or trends**
* Time-series analysis
* Interviewers trying to see if you actually understand SQL 😄

---

## Quick comparison

| Function | Direction          |
| -------- | ------------------ |
| `LAG()`  | Looks **backward** |
| `LEAD()` | Looks **forward**  |

---

## Question

1. Consecutive numbers: https://leetcode.com/problems/consecutive-numbers/description/
```sql
SELECT DISTINCT(num) as ConsecutiveNums 
FROM (
    SELECT num,
    LAG(num) over (order by id) as prev_num,
    LEAD(num) over(order by id) as next_num
    FROM Logs
) as temp
WHERE num = prev_num AND num = next_num;
```