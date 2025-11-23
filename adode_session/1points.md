1. Primary key and foreign key data types need to be same.
2. Minimum one table is required to implement a foreign key.
3. Base table and child table -> if something is deleted from the base table then it needs to be deleted from the child table also and for this cascade is used. If something is deleted from child table,  there is no need to delete it from the base table.
4. We can't drop the  child table if it had foreign key -> it will give error. Try this
5. If you wrote ON DELETE SET DEFAULT, and if the table does not have default value while initializing and you wrote set default, tehn it will give error. By default null value won't be defined.
6. If we define foreign key in teh table then sql will by default give the naem to teh foreign key. If you want to personally  name the  foreign key then you have to use the DDL command. After table creation, you can write commmand to alter table and its contraint. 
7. In group by we use having --- something to cover and for rows we use where

<!-- Questions -->
<!-- 1 -->
8. Null is a garbage value, so if you will write null==null, then it will give false as garbage value can never be same.
9. Inner join is also natural join.
10. Cross join is cartesian product, means every row of tablw1 will be mapped to every row of table 2.
11. In case, it is mandatory to give alias. In if else, it is optional


## Functional dependency
1. Super keys: all possible combinations of the columns -> 2^n - 1
2. A key which is minimal in nature (in terms of length), will be choosen as candidate key from super keys set.
3. Frm candidate key we use primary key, which is not null and unique
4. Unique keys -> can be null aslo but unique, like, adhar card no, email address
5. Alternate keys -> candidate and primary key ko exclude karke jo bakki reh jatti hai.

## Closure
In reation, the col that is not present on the right hand side is definetely goign to be the part f candidate key
1. BCNF : We take candidate keys as the super keys and if all the determinants are super keys then table is in BCNF
2. 3NF : Either determinant 

## Transactions

