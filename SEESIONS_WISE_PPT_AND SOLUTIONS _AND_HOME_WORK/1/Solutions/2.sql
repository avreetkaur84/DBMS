-- SQL SERVER IDENTITY(1,1) 
-- MY sql
-- CREATE TABLE student (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(50),
--     age INT
-- ) AUTO_INCREMENT = 1001;


-- CREATE TABLE customer (
--     cust_id INT GENERATED ALWAYS AS IDENTITY (START WITH 1001) PRIMARY KEY,
--     cust_name VARCHAR(50),
--     age INT
-- );

CREATE TABLE customer (
    cust_id INT  PRIMARY KEY,
    cust_name VARCHAR(50),
    age INT
);

drop table customer
drop table orders


INSERT INTO CUSTOMER( cust_id,Cust_name,age) VALUES(101,'Shalabh Bhatiya',25);

INSERT INTO CUSTOMER( cust_id,Cust_name,age) VALUES(102,'Vikas Sharma',22);

select * from customer




CREATE TABLE ORDERS(
ORDER_ID INT GENERATED ALWAYS AS IDENTITY(START WITH 121) PRIMARY KEY,
CUST_ID INT,
AMOUNT NUMERIC(100,2),
FOREIGN KEY (CUST_ID) REFERENCES Customer(CUST_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

-- drop table orders


INSERT INTO ORDERS (CUST_ID,AMOUNT)VALUES(101, 500);
INSERT INTO ORDERS (CUST_ID,AMOUNT)VALUES(102, 600);

(i)

select * from Orders

-- cust_id 1005 not exist
INSERT INTO ORDERS (CUST_ID,AMOUNT)VALUES(1005, 500);

-- (ii)
-- Automatically Handle Updates/Deletions
(1)
Update CUSTOMER
SET cust_id=99
Where cust_id=101;

-- Now cust_id=101 change to cust_id=99 
Select * from Orders;

-- (2)
DELETE FROM Customer
Where cust_id=102;
-- Customer Id 102 also remove From Order table by usin above Query
select * from Orders



