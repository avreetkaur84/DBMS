### DATEDIFF ( datepart , startdate , enddate )
    - DATEDIFF(day, yest.recordDate, cur.recordDate)=1

### ROUND(number, decimals, operation)
    - operation is optional. This function is used to round a number upto certain decimal points

### OFFSET
    - Think of OFFSET in SQL as saying “skip the first N rows” before you start returning results.
    - It’s usually used with ORDER BY, because SQL doesn’t guarantee order unless you explicitly specify it.

### CASE
```
    UPDATE Salary
    SET sex=CASE
        WHEN sex='m' THEN 'f'
        WHEN sex='f' THEN 'm'
        END;
```