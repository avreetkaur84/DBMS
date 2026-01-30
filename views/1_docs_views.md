<!-- Creating and updating views, WITH CHECK OPTION  -->
<!-- Scaler, Vector, self-contained and Co-related sub queries with IN, ANY, EXISTS operators  -->

> Notes from [NEON](https://neon.com/postgresql/postgresql-views)

*View is a named query stored in the PostgreSQL database server*

### 1. Create View
```
        CREATE VIEW view_name
        AS
        query;
```

- Creating a contact view
```
        CREATE VIEW contact AS
        SELECT
            first_name,
            last_name,
            email
        FROM
            customer;
```

- Running a view
```
        SELECT * FROM contact;
```

### 2. Drop View
```
        DROP VIEW [IF EXISTS] view_name
        [CASCADE | RESTRICT];
```

- Use **CASCADE** option to remove dependent objects along with the view. 
- Use **RESTRICT** option to reject the removal of the view if other objects depend on the view. The RESTRICT option is the default.

```
        DROP VIEW comedy_film;
```

```
        DROP VIEW film_info
        CASCADE;
```

### 3. Insert, Update and Delete in Views

- *Here city_us is a view*

```
        INSERT INTO city_us(name, population, country)
        VALUES ('San Jose', 983459, 'US');
```

```
        UPDATE city_us
        SET population = 1000000
        WHERE name = 'New York';
```

```
        DELETE FROM city_us
        WHERE id = 21;
```

### 4. With Check Option

When you create a view *WITH CHECK OPTION*, PostgreSQL will ensure that you can only modify data of the view that satisfies the condition in the view’s defining query

```
        CREATE VIEW view_name AS
        query
        WITH CHECK OPTION;
```

```
        CREATE OR REPLACE VIEW fte AS
        SELECT
                id,
                first_name,
                last_name,
                department_id,
                employee_type
        FROM
                employees
        WHERE
                employee_type = 'FTE'
        WITH CHECK OPTION;
```

- Here, we can only update the view, like insert the values where employee type is FTE as with check option ensures that things are going according to query condition.
- For example, the following INSERT statement will fail with an error:

```
        INSERT INTO fte(first_name, last_name, department_id, employee_type)
        VALUES ('John', 'Snow', 1, 'Contractor');
```

```
        ERROR:  new row violates check option for view "fte"
        DETAIL:  Failing row contains (12, John, Snow, 1, Contractor).
```

- I have not studied in detail the two more types of with check views:
   -  WITH LOCAL CHECK OPTION
   -  WITH CASCADED CHECK OPTION

