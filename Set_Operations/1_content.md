## Set Operations in PostgreSQL — Notes

### 1. Definition

Set operations combine the results of two or more `SELECT` queries into a single result set.
They operate on **rows**, not tables directly.

General form:

```sql
SELECT column_list FROM table1
SET_OPERATOR
SELECT column_list FROM table2;
```

---

## 2. Rules for Set Operations (Very Important)

For set operations to work:

* Both queries must return the **same number of columns**.
* Corresponding columns must have **compatible data types**.
* Column order must be the same.
* Column names in the final result come from the first query.

---

## 3. UNION

### Purpose

Combines results of two queries and removes duplicate rows.

### Syntax

```sql
SELECT column FROM table1
UNION
SELECT column FROM table2;
```

### Properties

* Returns all distinct rows from both queries.
* Duplicate rows are removed automatically.
* Performs duplicate checking (slower than UNION ALL).

### Mathematical meaning

Union of two sets (A ∪ B).

---

## 4. UNION ALL

### Purpose

Combines results without removing duplicates.

### Syntax

```sql
SELECT column FROM table1
UNION ALL
SELECT column FROM table2;
```

### Properties

* Keeps duplicate rows.
* Faster because no duplicate elimination.
* Use when duplicate records are required.

---

## 5. INTERSECT

### Purpose

Returns only rows common to both queries.

### Syntax

```sql
SELECT column FROM table1
INTERSECT
SELECT column FROM table2;
```

### Properties

* Returns rows present in both results.
* Removes duplicates.
* Represents common elements of two sets.

### Mathematical meaning

Intersection (A ∩ B).

---

## 6. INTERSECT ALL

### Purpose

Returns common rows including duplicates.

### Properties

* Duplicate occurrences are preserved.
* Supported in PostgreSQL.

---

## 7. EXCEPT

### Purpose

Returns rows from the first query that are not present in the second query.

### Syntax

```sql
SELECT column FROM table1
EXCEPT
SELECT column FROM table2;
```

### Properties

* Removes rows in second result from first.
* Removes duplicates.
* Order of queries matters.

### Mathematical meaning

Set difference (A − B).

---

## 8. EXCEPT ALL

### Purpose

Returns difference while preserving duplicate occurrences.

### Properties

* Duplicate rows are not removed.
* PostgreSQL supports it.

---

## 9. Duplicate Handling Summary

| Operator      | Removes Duplicates |
| ------------- | ------------------ |
| UNION         | Yes                |
| UNION ALL     | No                 |
| INTERSECT     | Yes                |
| INTERSECT ALL | No                 |
| EXCEPT        | Yes                |
| EXCEPT ALL    | No                 |

---

## 10. Sorting Results with ORDER BY

* `ORDER BY` can be applied only at the end of the entire set operation.
* Cannot use `ORDER BY` inside individual queries (unless subqueries are used).

### Correct

```sql
SELECT name FROM students
UNION
SELECT name FROM teachers
ORDER BY name;
```

### Incorrect

```sql
SELECT name FROM students ORDER BY name
UNION
SELECT name FROM teachers;
```

---

### Sorting by Column Position

```sql
ORDER BY 1;
```

Sorts result using the first column.

---

## 11. Execution Order

1. Execute first `SELECT`.
2. Execute second `SELECT`.
3. Apply set operation.
4. Remove duplicates (if required).
5. Apply `ORDER BY`.

---

## 12. Key Differences (Quick Comparison)

| Operation | Meaning                             |
| --------- | ----------------------------------- |
| UNION     | All distinct rows from both queries |
| UNION ALL | All rows including duplicates       |
| INTERSECT | Only common rows                    |
| EXCEPT    | Rows in first query but not second  |

---

## 13. Important Points for Exams

* `UNION` removes duplicates by default.
* Use `ALL` to preserve duplicates.
* Order of queries matters in `EXCEPT`.
* `ORDER BY` is written at the end.
* Queries must have matching column structure.

---