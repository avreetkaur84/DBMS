## 1️⃣ `LIKE` Operator

Basic syntax:

```sql
SELECT column_name
FROM table_name
WHERE column_name LIKE 'pattern';
```

`LIKE` is **case-sensitive** in PostgreSQL.

If you want case-insensitive matching → use `ILIKE`.

---

## 2️⃣ Wildcard Characters

### 🔹 `%` (Percent)

Matches **zero, one, or multiple characters**.

Example:

```sql
WHERE name LIKE 'A%';
```

➡ Matches: `Aman`, `Alex`, `A`, `Apple`
➡ Does NOT match: `manav`

---

### 🔹 `_` (Underscore)

Matches **exactly one character**.

Example:

```sql
WHERE name LIKE 'A_';
```

➡ Matches: `Al`, `An`
➡ Does NOT match: `Aman`, `A`

---

## 3️⃣ Common Pattern Examples

### 🔸 Starts with

```sql
WHERE email LIKE 'john%';
```

### 🔸 Ends with

```sql
WHERE email LIKE '%@gmail.com';
```

### 🔸 Contains

```sql
WHERE name LIKE '%mit%';
```

### 🔸 Fixed length pattern

```sql
WHERE code LIKE 'A___';
```

(A followed by exactly 3 characters)

---

## 4️⃣ Case-Insensitive Matching (`ILIKE`)

```sql
WHERE name ILIKE 'john%';
```

Matches:

* `John`
* `john`
* `JOHN`

---

## 5️⃣ Escaping Wildcards

If you want to search for actual `%` or `_` characters:

```sql
WHERE text_column LIKE '50\%' ESCAPE '\';
```

---

## 6️⃣ Important Notes

* `LIKE` works well for simple patterns.
* For **complex pattern matching**, use:

  * `SIMILAR TO`
  * Regular expressions (`~`, `~*`)

Example (regex):

```sql
WHERE name ~ '^A.*n$';
```

---

## Quick Comparison

| Operator | Case Sensitive | Use                       |
| -------- | -------------- | ------------------------- |
| LIKE     | ✅ Yes          | Basic pattern matching    |
| ILIKE    | ❌ No           | Case-insensitive matching |
| ~        | ✅ Yes          | Regex matching            |
| ~*       | ❌ No           | Case-insensitive regex    |

---



### 1️⃣ Basic Pattern Filtering

* Names starting with ‘A’
* Emails ending with `@gmail.com`
* Phone numbers containing `98`
* Codes with exactly 5 characters

👉 These are straight `%` and `_` usage.

---

### 2️⃣ Case Sensitivity Trap

They may deliberately give mixed case data.

If question says:

> Find all employees whose name starts with 's'

If data has `Suresh`, `sanjay`, `SHIV`

If you use:

```sql
WHERE name LIKE 's%'
```

You’ll miss half the data.

Correct approach?
Use `ILIKE`.

This is where marks are lost.

---

### 3️⃣ Exact Length Patterns

Example:

> Find product codes that are exactly 4 characters long and start with ‘P’

Correct pattern:

```sql
WHERE code LIKE 'P___'
```

Not:

```sql
'P%'
```

That would include longer strings.

Precision = marks.

---

### 4️⃣ Contains Pattern

```sql
WHERE name LIKE '%an%'
```

This is very common.

---

### 5️⃣ Escaping Trick Question

They might ask:

> Find records containing the character '%'

Then you must use:

```sql
WHERE column_name LIKE '%\%%' ESCAPE '\';
```

Rare — but if it comes, most students panic.

---

# ⚡ Performance Trap (Advanced but Useful)

If question is:

```sql
WHERE name LIKE '%abc'
```

Index on `name` won’t be used efficiently.

But:

```sql
WHERE name LIKE 'abc%'
```

Index works.

They probably won’t ask this directly — but knowing this gives you edge confidence.

---
