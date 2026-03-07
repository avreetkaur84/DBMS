In SQL, **`DISTINCT`** and **`UNIQUE`** both deal with removing duplicates — but they’re used in different places and for different purposes.

## ✅ **`DISTINCT` — query-time filtering**

**Used in:** `SELECT` statements
**Purpose:** Remove duplicate rows from the result **when retrieving data**.

### Example

```sql
SELECT DISTINCT city FROM customers;
```

👉 Returns each city only once, even if many customers live there.

### Key idea

* Works **temporarily** on query results.
* Does **not change the table structure**.
* Used for **reading data**.

Think: *“Show me unique results right now.”*

---

## ✅ **`UNIQUE` — table constraint**

**Used in:** Table definition (`CREATE TABLE`, `ALTER TABLE`)
**Purpose:** Prevent duplicate values from being stored **in the database**.

### Example

```sql
CREATE TABLE users (
  id INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE
);
```

👉 Database will reject duplicate emails.

### Key idea

* Works **permanently**.
* Enforces data integrity.
* Used for **data storage rules**.

Think: *“Duplicates are illegal here.”*

---

## ⚡ Quick Comparison

| Feature                    | `DISTINCT`                  | `UNIQUE`                      |
| -------------------------- | --------------------------- | ----------------------------- |
| Where used                 | `SELECT` query              | Table column/constraint       |
| Purpose                    | Remove duplicates in output | Prevent duplicates in storage |
| Permanent effect           | ❌ No                        | ✅ Yes                         |
| Affects database structure | ❌ No                        | ✅ Yes                         |

---

## 🧠 Easy way to remember

* **DISTINCT → display control**
* **UNIQUE → data rule**

---