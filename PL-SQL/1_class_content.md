## Conditional Statements

$$ -> delimeters -> $$
    1. fix the area of execution for pl-sql. In postgress
    2. Everything inside delimeters when written for string, they will be passed as it is.

## Case Statements


### PL-SQL

## Views
1. Simple views
Client can corrupt the data easily if we provide the direct name, so by providing the data by storing in views, we provide extra layer of security. 
CRUD operations are performed on views and table both, insert, (delete and update). Menas any changes in views will be reflected in base table also.


2. Complex views

views dont take any space except teh merterialized views as they store the data on the hard drive
Normal veiws re-rum the sql query again, as they dont store them anywhere

- why we don't use materialsed views-
Meterialised

Refreshing in views - need to write explicitly to refresh the materlised view
Only materialed view needs refreshing

we cant update view directly, if we have used group by with it.



