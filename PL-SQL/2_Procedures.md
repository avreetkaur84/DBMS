# 📘 **Stored Procedures in PostgreSQL (PL/pgSQL)**

## 1. **What is a Procedure?**

* A **procedure** is a reusable block of code stored in the database.
* It can contain **SQL queries, control statements, loops, exception handling, and more.**
* Unlike functions, procedures in PostgreSQL do **not return values directly**, but they can modify data, raise messages, or return via `OUT` parameters.

> 📝 Think of it like a “recipe” stored in the database. Instead of rewriting the steps every time, you just **call the procedure**.

---

## 2. **Purpose of Using a Procedure**

* **Code Reusability** → Write once, use many times.
* **Performance** → Stored in compiled form inside DB, executes faster.
* **Security** → Access to underlying tables can be restricted; only procedure access is given.
* **Maintainability** → Logic kept in one place, easier to update.
* **Transaction Control** → Procedures can handle multiple queries as one logical unit.

---

## 3. **How to Create a Stored Procedure**

Syntax in PostgreSQL:

```sql
CREATE PROCEDURE procedure_name(parameter_list)
LANGUAGE plpgsql
AS $$
BEGIN
    -- SQL statements
END;
$$;
```

---

## 4. **Procedure Without Parameters**

Example:

```sql
CREATE PROCEDURE greet_user()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Hello, Welcome to PostgreSQL Procedures!';
END;
$$;
```

Execution:

```sql
CALL greet_user();
```

---

## 5. **Procedure With Parameters**

Example with **IN** parameters:

```sql
CREATE PROCEDURE add_employee(emp_name TEXT, emp_salary NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employees(name, salary)
    VALUES (emp_name, emp_salary);
    
    RAISE NOTICE 'Employee % added with salary %', emp_name, emp_salary;
END;
$$;
```

Execution:

```sql
CALL add_employee('Avreet', 70000);
```

### With **IN and OUT parameters**:

```sql
CREATE PROCEDURE calculate_bonus(emp_salary NUMERIC, OUT bonus NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    bonus := emp_salary * 0.1;
END;
$$;
```

Execution:

```sql
CALL calculate_bonus(50000, bonus);
-- bonus = 5000
```

---

## 6. **How to Execute a Procedure**

* Always use **`CALL`** keyword.

```sql
CALL procedure_name(parameter_values);
```

---

## 7. **What Can a Stored Procedure Include?**

* ✅ **SQL Queries** (SELECT, INSERT, UPDATE, DELETE)
* ✅ **DML, DDL, DCL, TCL** commands

  * DML → Data Manipulation (`INSERT`, `UPDATE`, `DELETE`)
  * DDL → Data Definition (`CREATE`, `ALTER`, `DROP`)
  * DCL → Data Control (`GRANT`, `REVOKE`)
  * TCL → Transaction Control (`COMMIT`, `ROLLBACK`)
* ✅ **Cursors** (to iterate over query results)
* ✅ **Loops & Conditional Statements** (`IF`, `WHILE`, `FOR`)
* ✅ **Exception Handling** (`EXCEPTION WHEN OTHERS THEN ...`)
* ✅ **Multiple queries inside one logical unit**

---

## 8. **Procedure vs Function (Quick Compare)**

| Feature             | Procedure                           | Function                    |
| ------------------- | ----------------------------------- | --------------------------- |
| Returns Value       | ❌ No (but OUT params possible)      | ✅ Yes                       |
| Transaction Control | ✅ Allowed                           | ❌ Not Allowed               |
| Usage               | Data manipulation, batch operations | Computation, single value   |
| Called with         | `CALL`                              | `SELECT function_name(...)` |

---

### ✅ Example with Loops & Exception Handling

```sql
CREATE PROCEDURE process_employees()
LANGUAGE plpgsql
AS $$
DECLARE
    emp RECORD;
BEGIN
    FOR emp IN SELECT id, name FROM employees LOOP
        RAISE NOTICE 'Processing employee: %', emp.name;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'An error occurred!';
END;
$$;
```

Execution:

```sql
CALL process_employees();
```

---
