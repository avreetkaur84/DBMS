# ✅ **1. Always use ISO format (recommended)**

PostgreSQL loves this format:

```
YYYY-MM-DD
```

### Example

```sql
SELECT * 
FROM orders
WHERE order_date = '2025-01-15';
```

✔ Safest
✔ No confusion
✔ Always works

👉 This is the #1 rule. If you remember only one thing, remember this.

---

# ✅ **2. Use `DATE` keyword for clarity (best practice)**

This tells PostgreSQL explicitly: “this is a date”.

### Example

```sql
SELECT *
FROM orders
WHERE order_date = DATE '2025-01-15';
```

### Why use this?

* Prevents type confusion
* Cleaner for interviews/exams
* Avoids implicit conversion issues

---

# ✅ **3. Date ranges (very common in problems)**

## Between two dates

```sql
SELECT *
FROM orders
WHERE order_date BETWEEN DATE '2025-01-01' AND DATE '2025-01-31';
```

---

## Greater / less comparisons

```sql
WHERE order_date >= DATE '2025-01-01'
WHERE order_date < DATE '2026-01-01'
```

👉 Prefer `< next_date` for accuracy with timestamps.

---

# ✅ **4. Today’s date**

You’ll use this a lot.

```sql
SELECT CURRENT_DATE;
```

### Example

```sql
SELECT *
FROM orders
WHERE order_date = CURRENT_DATE;
```

No quotes needed.

---

# ✅ **5. Date + Time (timestamp columns)**

If your column stores time too (`timestamp`):

```
YYYY-MM-DD HH:MM:SS
```

### Example

```sql
SELECT *
FROM orders
WHERE created_at >= TIMESTAMP '2025-01-15 10:30:00';
```

---

# ✅ **6. Extract year/month/day**

Super common in assignments.

```sql
SELECT EXTRACT(YEAR FROM order_date) FROM orders;
SELECT EXTRACT(MONTH FROM order_date) FROM orders;
```

---

# ✅ **7. Convert text → date (when needed)**

If data comes in weird format:

```sql
SELECT TO_DATE('15-01-2025', 'DD-MM-YYYY');
```

Use only when input isn’t ISO format.

---

# 🚨 Common mistakes beginners make

### ❌ Wrong format

```sql
'15-01-2025'   -- risky
'01/15/2025'   -- depends on settings
```

### ❌ Comparing string with date column

```sql
WHERE order_date = '15/01/2025'
```

### ❌ Forgetting quotes

```sql
WHERE order_date = 2025-01-15   -- error
```

---

# ⭐ What you should actually remember (90% use cases)

Just these four:

```sql
DATE 'YYYY-MM-DD'
CURRENT_DATE
TIMESTAMP 'YYYY-MM-DD HH:MM:SS'
BETWEEN DATE 'YYYY-MM-DD' AND DATE 'YYYY-MM-DD'
```

---

> Dates Sorting Order

## ✅ **ASC (Ascending order) → oldest → newest**

```sql id="s6lclx"
SELECT * 
FROM orders
ORDER BY order_date ASC;
```

### Order will be:

```
2020-01-01   ← oldest
2022-05-10
2025-01-15   ← newest
```

👉 **Past → Present → Future**

Think: timeline moving forward.

---

## ✅ **DESC (Descending order) → newest → oldest**

```sql id="9jccw9"
SELECT * 
FROM orders
ORDER BY order_date DESC;
```

### Order will be:

```
2025-01-15   ← newest
2022-05-10
2020-01-01   ← oldest
```

👉 **Future → Present → Past**

Think: reverse timeline.

---

## 🧠 Easy memory trick

* **ASC → A → Ancient first**
* **DESC → D → Latest first (reverse)**

---

## ⭐ What interviewers expect

* `ASC` → older dates first
* `DESC` → recent dates first

---