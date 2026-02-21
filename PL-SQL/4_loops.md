# 1. LOOP / WHILE (PostgreSQL Procedural Control)

Important:
Loops are **not normal SQL**. They are used inside **PL/pgSQL blocks, functions, or procedures**.

Used for:

* row-by-row processing
* repeated execution
* conditional repetition

---

## 1.1 Anonymous Block Structure (Base Syntax)

```sql
DO $$
BEGIN
    -- statements
END $$;
```

Loops run inside this block.

---

## 1.2 LOOP (Basic Infinite Loop)

Runs continuously until stopped using `EXIT`.

### Syntax

```sql
LOOP
    statements;
    EXIT WHEN condition;
END LOOP;
```

---

### Example

```sql
DO $$
DECLARE
    i INT := 1;
BEGIN
    LOOP
        RAISE NOTICE '%', i;
        i := i + 1;
        EXIT WHEN i > 5;
    END LOOP;
END $$;
```

### Output

```
1 2 3 4 5
```

### Key Points

* Must use `EXIT` to stop.
* Otherwise infinite loop.

---

## 1.3 WHILE LOOP

Runs while condition is true.

### Syntax

```sql
WHILE condition LOOP
    statements;
END LOOP;
```

---

### Example

```sql
DO $$
DECLARE
    i INT := 1;
BEGIN
    WHILE i <= 5 LOOP
        RAISE NOTICE '%', i;
        i := i + 1;
    END LOOP;
END $$;
```

---

## 1.4 FOR LOOP (Often Asked)

### Numeric FOR Loop

```sql
FOR i IN 1..5 LOOP
    statements;
END LOOP;
```

Example:

```sql
DO $$
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE '%', i;
    END LOOP;
END $$;
```

---

### Loop Control Statements

| Statement | Purpose          |
| --------- | ---------------- |
| EXIT      | stop loop        |
| EXIT WHEN | conditional exit |
| CONTINUE  | skip iteration   |

---

## What Exams Usually Ask About Loops

* syntax
* difference between LOOP and WHILE
* EXIT usage
* simple output prediction

---

# 2. CASE WHEN (Conditional Logic in SQL)

Like if–else.

---

## 2.1 Basic Syntax

```sql
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END
```

---

## Example

```sql
SELECT name,
CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 50 THEN 'Pass'
    ELSE 'Fail'
END AS result
FROM students;
```

---

## Simple CASE (Equality Check)

```sql
CASE column
    WHEN value1 THEN result
    WHEN value2 THEN result
END
```

---

### Where Used

* SELECT
* UPDATE
* ORDER BY
* WHERE

---

# 3. INNER JOIN / OUTER JOIN (Quick Revision)

Used to combine rows from multiple tables.

---

## 3.1 INNER JOIN

Returns matching rows from both tables.

```sql
SELECT *
FROM A
INNER JOIN B
ON A.id = B.id;
```

Only common values.

---

## 3.2 LEFT OUTER JOIN

* All rows from left table
* Matching rows from right
* Non-matching → NULL

```sql
SELECT *
FROM A
LEFT JOIN B
ON A.id = B.id;
```

---

## 3.3 RIGHT OUTER JOIN

Opposite of LEFT.

```sql
SELECT *
FROM A
RIGHT JOIN B
ON A.id = B.id;
```

---

## 3.4 FULL OUTER JOIN

All rows from both tables.

```sql
SELECT *
FROM A
FULL JOIN B
ON A.id = B.id;
```

---

### Quick Memory

* INNER → common only
* LEFT → everything left
* RIGHT → everything right
* FULL → everything both

---

# 4. Nested Subqueries

Query inside another query.

---

## 4.1 Basic Structure

```sql
SELECT column
FROM table
WHERE column IN (
    SELECT column FROM table2
);
```

Inner query executes first.

---

## Example

```sql
SELECT name
FROM students
WHERE marks > (
    SELECT AVG(marks) FROM students
);
```

---

### Types of Nested Subqueries

* single-row
* multi-row
* multi-column

---

# 5. Correlated Subqueries (Important Concept)

Inner query depends on outer query.

Runs once for each outer row.

---

## Syntax Pattern

```sql
SELECT *
FROM table1 t1
WHERE EXISTS (
    SELECT 1
    FROM table2 t2
    WHERE t1.id = t2.id
);
```

---

## Key Difference

| Nested      | Correlated               |
| ----------- | ------------------------ |
| runs once   | runs per row             |
| independent | dependent on outer query |

---

# 6. EXISTS / NOT EXISTS

Checks whether subquery returns rows.

Returns TRUE or FALSE.

---

## 6.1 EXISTS

True if subquery returns at least one row.

```sql
SELECT name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM marks m
    WHERE s.id = m.id
);
```

---

## 6.2 NOT EXISTS

True if subquery returns no rows.

```sql
SELECT name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM marks m
    WHERE s.id = m.id
);
```

---

### Why `SELECT 1`?

Only existence matters, not actual data.

---

# High-Probability Exam Questions From These Topics

* Write LOOP or WHILE syntax
* Predict output of CASE
* Difference: INNER vs OUTER JOIN
* Nested vs correlated subquery
* EXISTS vs IN difference
* Identify join type from output
* Find matching / non-matching records

---

If you want next, we can do one of these high-value exam preps:

* LOOP practice questions (since it’s new for you)
* tricky JOIN questions professors ask
* nested vs correlated vs EXISTS comparison sheet
* 30-minute full DBMS exam revision sheet
* expected SQL output prediction drills

Tell me which direction.
