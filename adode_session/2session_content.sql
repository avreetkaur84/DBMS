


CREATE TABLE Table1 (
    Id INT
);

-- Insert data into Table1
INSERT INTO Table1 (Id) VALUES (1);
INSERT INTO Table1 (Id) VALUES (1);
INSERT INTO Table1 (Id) VALUES (2);
INSERT INTO Table1 (Id) VALUES (NULL);
INSERT INTO Table1 (Id) VALUES (NULL);

-- Create Table 2
CREATE TABLE Table2 (
    Id INT
);

-- Insert data into Table2
INSERT INTO Table2 (Id) VALUES (1);
INSERT INTO Table2 (Id) VALUES (3);
INSERT INTO Table2 (Id) VALUES (NULL);



--Q2:
CREATE TABLE Employee (
    empid INT,
    ename VARCHAR(50),
    salary INT,
    managerid INT
);


-- Insert data into Employee
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (1, 'aman', 50000, NULL);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (2, 'shreya', 40000, 1);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (3, 'piyush', 70000, 1);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (4, 'neha', 55000, NULL);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (5, 'nitika', 65000, 4);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (6, 'manish', 50000, 4);



---Q3
CREATE TABLE Employee (
    eid INT,
    email VARCHAR(100)
);

-- Insert data into Employee
INSERT INTO Employee (eid, email) VALUES (1, 'aman@gmail.com');
INSERT INTO Employee (eid, email) VALUES (2, 'shreya@outlook.com');
INSERT INTO Employee (eid, email) VALUES (3, 'piyush@hotmail.com');






CREATE TABLE Students (
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Class INT
);


INSERT INTO Students (Name, Age, Class)
VALUES
('Aarav', 17, 8),
('Vikram', 16, 4),
('Priya', 15, 6),
('Rohan', 16, 7),
('Sita', 17, 8),
('Kiran', 15, 6);



















------------------------------------CODESHARE----------------------
/*
		1. PRODCUT_INTERN
				- ANALYSIS - 
				- SYSTEM DESIGN
				- CORE: CN & OS
				- DSA

		2. JOINS
			

		1. COMMANDS: DDL (CREATE, ALTER, DROP, TRUNCATE, RENAME), 
					 DML (INSERT, UPDATE, DELETE (RUD)), 
					 DCL (GRANT & REVOKE), 
					 TCL (COMMIT, ROLLBACK, SAVEPOINTS), 
					 DQL (SELECT)

		2. CONSTRAINTS:(RULES)
				1. DEFAULT
					CREATE TABLE TBL_EMPLOYEE (
								EMPID INT UNIQUE NOT NULL IDENTITY(101, 5) DEFAULT 101 
								CHECK (EMPID > 100)
								) 
				2. UNIQUE
				3. NOT NULL
				4. CHECK
				5. FK: CUSTOMER(C_ID (PK), C_NAME, QTY)    ORDERS (O_ID, O_NAME, PRICE, C_ID (FK))
						FOREIGN KEY ORDER_ID REFERENCES EMP(EMP_ID)
						1. CASCADING: ON DELETE CASCADE
								   ON UPDATE CASCADE

						2. SET NULL: 
								ON DELETE SET NULL

						3. SET DETAULT
								ON DELETE SET DEFAULT

						4. NO ACTION


						PS: FK INSIDE A SINGLE TABLE

						SYNTAX:
							FK INSIDE CREATE TABLE
							CREATE TABLE ORDERS (
								O_ID INT,
								O_NAME VARCHAR(100),
								QTY INT,
								C_ID INT
								FOREIGN KEY (C_ID) REFERNCES CUSTOMER (C_ID)
							)

							DDL:
							ALTER TABLE ORDERS
							ADD CONSTRAINT FK_ON_ORDERS
							FOREIGN KEY (C_ID) REFERENCES CUSTOMER (C_ID)


							ON A SINGLE TABLE: FK APPLICATION
								- SELF-JOIN
								- SINGLE 

								TABLE EMPLOYEE (EMP_ID (PK), EMP_NAME, MANAGER_ID (FK))
													1            A			2
													2			 B			1


													EMP_NAME    MANAGER_NAME
														A				B
														B				A

				6. PK

*/
ALTER TABLE ORDERS
-----------JOINS-----------
--SYNTAX:
	SELECT E.*, D.*
	FROM EMPLOYEE AS E
	INNER JOIN
	DEPARTMENT AS D
	ON
	E.EMPID = D.EMP_ID
	


	CREATE DATABASE ADOBE_PRACTICE
	USE ADOBE_PRACTICE


	CREATE TABLE Table1 (
    Id INT
);

-- Insert data into Table1
INSERT INTO Table1 (Id) VALUES (1);
INSERT INTO Table1 (Id) VALUES (1);
INSERT INTO Table1 (Id) VALUES (2);
INSERT INTO Table1 (Id) VALUES (NULL);
INSERT INTO Table1 (Id) VALUES (NULL);

-- Create Table 2
CREATE TABLE Table2 (
    Id INT
);

-- Insert data into Table2
INSERT INTO Table2 (Id) VALUES (1);
INSERT INTO Table2 (Id) VALUES (3);
INSERT INTO Table2 (Id) VALUES (NULL);


SELECT *FROM TABLE1
SELECT *FROM TABLE2

--WHAT IS THE DIFF BTW CROSS JOIN (CATRESIAN PRODUCT) & NATURAL JOIN
--INNER JOIN = NATURAL JOIN
SELECT T1.*,T2.*
FROM TABLE1 AS T1
INNER JOIN
TABLE2 AS T2
ON
T1.Id = T2.Id


SELECT * FROM TABLE1
CROSS JOIN
TABLE2



CREATE TABLE Employee (
    empid INT,
    ename VARCHAR(50),
    salary INT,
    managerid INT
);

-- Insert data into Employee
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (1, 'aman', 50000, NULL);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (2, 'shreya', 40000, 1);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (3, 'piyush', 70000, 1);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (4, 'neha', 55000, NULL);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (5, 'nitika', 65000, 4);
INSERT INTO Employee (empid, ename, salary, managerid) VALUES (6, 'manish', 50000, 4);



SELECT *FROM EMPLOYEE

--SELF JOIN
SELECT E1.*, E2.*
FROM EMPLOYEE E1
LEFT JOIN
EMPLOYEE E2
ON
E1.managerid = E2.empid
WHERE E1.salary > E2.salary

DROP  TABLE Employee

CREATE TABLE Employee (
    eid INT,
    email VARCHAR(100)
);

-- Insert data into Employee
INSERT INTO Employee (eid, email) VALUES (1, 'aman@gmail.com');
INSERT INTO Employee (eid, email) VALUES (2, 'shreya@outlook.com');
INSERT INTO Employee (eid, email) VALUES (3, 'piyush@hotmail.com');


SELECT *FROM EMPLOYEE

--LEN()
SELECT LEN('aman@gmail.com') AS LENGTH_STRING

---TO FIND INDEX OF ANY STRING IN SQL
SELECT CHARINDEX('@', 'aman@gmail.com') AS INDEX_STRING


SELECT SUBSTRING(EMAIL, CHARINDEX('@', EMAIL)+1, 
LEN(EMAIL)) AS OUTPUT_STRING
FROM EMPLOYEE

--CASE STATEMENTS AND CONDITIONAL STATEMENTS

--CASE: WITH JOIN, SUB-QUERIES
SELECT 
CASE 
	WHEN 10 < 20 THEN '10 < 20'
	WHEN 20 < 10 THEN '20 < 10'
	ELSE 'NO CONDITION MATCHED'
	END AS EXPECTED_OUTPUT


IF 10<20 
PRINT '10 < 20'
ELSE IF '20 = 20'
PRINT '20 = 20'
ELSE
PRINT '20 IS GREATER'






/*
		1. SUPER KEYS: SET OF ALL POSSIBLE COMBINATION USED TO IDENTIFY RELATION R
			R(A,B,C,D) : 2^N -1
			DM: POWER SET: {PHI}
			SK: {A,B,C,D, AB,BC,BD,AC, ABC, ABD,BCD,ABCD}

			CK: CANIDATE KEY (IS A PARTICIPANT TO BECOME PK)
			    (MINIMALIST)
				{A,B,C,D, AB, BC}

			PK: {A - U + NOT NULL}

			ALTERNATE KEYS: 

			UNIQUE KEYS: ADHAR CARD, EMAIL ADDRESS


			CLOSURE: USED TO FIND THE CK:


*/


CREATE TABLE Students (
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Class INT
);


INSERT INTO Students (Name, Age, Class)
VALUES
('Aarav', 17, 8),
('Vikram', 16, 4),
('Priya', 15, 6),
('Rohan', 16, 7),
('Sita', 17, 8),
('Kiran', 15, 6);


SELECT *FROM STUDENTS

UPDATE STUDENTS 
SET NAME = 'KIRAN' 
WHERE ID = 6

------------TRANSACTION IN PICTURE------
/*
		--HOW TO CREATE A TRANSACTION
			BEGIN TRANSACTION
				//DML STATEMENTS
*/

BEGIN TRANSACTION
UPDATE STUDENTS SET NAME = 'XYZ' WHERE NAME = 'KIRAN'
ROLLBACK TRANSACTION



COMMIT TRANSACTION

ROLLBACK TRANSACTION






















---------------------------TRANSACTION IN SQL---------------------------
/*
	- Whenever we perform any operation (CRUD) inside the database, these operations are treated as 
	  TRANSACTIONS.
	- Also known as T-SQL.
*/
-- 1. T-SQL - transaction is a single unit of work.
-- 2.  TCL - TCL commands COMMIT and ROLLBACK
-- 3. ACID Properties
-- 4. Transactions are merged at Connection(Query File is known as connection) Level.


CREATE TABLE Students (
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Class INT
);


INSERT INTO Students (Name, Age, Class)
VALUES
('Aarav', 17, 8),
('Vikram', 16, 4),
('Priya', 15, 6),
('Rohan', 16, 7),
('Sita', 17, 8),
('Kiran', 15, 6);


use batch_2021
select *from Students;

--For normal statements like update, if i am updating some data in the table then it cannot be undone.
--eg: 
	update Students set Name = 'Ayush' where Id = 6;        --IMPLICIT TRANSACTION
--Now if i want to rollback/undo this command i cannot do it.
--I should have some UNDO mechanism. for that we have TRANSACTION in SQL

-- CASE 1: Without Commit
-- We can write that update command inside a Transaction
Begin Transaction                              --EXPLICIT TRANSACTION
	update Students set Name = 'Ayush' where Id = 6; 

/*
NOTE: If i open a new query tab (new connection) and try to do select * from Students in it. It will not
	  run as we have not commited the transaction. So we have to commit it.
*/


-- CASE 2: With Commit
Begin Transaction
	update Students set Name = 'Ayush' where Id = 6; 
Commit Transaction -- it will commit the changes done by update command inside the transaction.



--Suppose I want to rollback the transaction.
-- CASE 2: With Rollback
Begin Transaction
	update Students set Name = 'Ayush' where Id = 6; 

Rollback Transaction; -- UNDO

Commit Transaction ; -- Permanent Commit in table

--NOTE: Either you should do the commit OR rollback to the transaction. (MUST ACTION)


-- We can have multiple operations inside a transaction. The condition is all the commands
-- should be correct and working. If any of the command fails, transaction will  be rollbacked.

Begin Transaction
	update Students set Name = 'Ayush' where Id = 5; 
	delete from Students where Id = 6;

-- after doing this transaction I have two options, either i can rollback the transaction or i can commit the changes permanently.

Rollback Transaction; -- UNDO

Commit Transaction ;


--Setting the ISOLATION LEVEL to READ UNCOMMITED by defaultt it is READ COMMITED.
/*
NOTE: If i open a new query tab (new connection) and try to do select * from Students in it. It will not
	  run as we have not commited the transaction. So we have to commit it.

	  we can make it visible in another connection

	  if we want to see the uncommited data in another connection, in that case we have to use :
*/
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;   --In  a seperate connection file, if we write this then we can se uncommited data.

--ACID

--WITH TRANASACTION, WE USE EXCEPTION HANDLING
BEGIN TRY
	BEGIN TRANSACTION
	SELECT 10 / 0 AS RESULT

	SAVE SAVEPOINT_01

	COMMIT
END TRY

BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT 'ERROR NUMBER AS : '+ CAST(ERROR_NUMBER() AS VARCHAR(MAX))
		SELECT 'AN ERROR HAS OCCURED'
		SELECT 'SEVERITY OF ERROR '+ CAST(ERROR_SEVERITY() AS VARCHAR(MAX))
END CATCH

--SAVEPOINT (HOMEWORK)


---------------INDEXING---------------

CREATE TABLE Employees (
    Id INT ,  
    Name VARCHAR(50),
    Salary INT,
    Gender VARCHAR(10)
);

-- Insert the initial 5 entries from the table image
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (1, 'Sam', 2500, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (2, 'Pam', 6500, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (3, 'John', 4500, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (4, 'Sara', 5500, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (5, 'Todd', 3100, 'Male');

-- Insert additional 1000 entries (generated with random names, salaries between 2000-10000, and genders)
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (6, 'Charlie', 2697, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (7, 'Pam', 5581, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (8, 'Sara', 3142, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (9, 'Pam', 9424, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (10, 'Bob', 2966, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (11, 'Bob', 4607, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (12, 'Pam', 4062, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (13, 'Charlie', 4025, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (14, 'Bob', 9859, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (15, 'Sara', 7721, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (16, 'Todd', 9336, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (17, 'Charlie', 8167, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (18, 'Pam', 6757, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (19, 'Alice', 7698, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (20, 'Sam', 3242, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (21, 'David', 9805, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (22, 'Eve', 6577, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (23, 'Bob', 7236, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (24, 'John', 3037, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (25, 'Alice', 6208, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (26, 'Bob', 3789, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (27, 'Todd', 5940, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (28, 'Bob', 6950, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (29, 'Charlie', 3987, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (30, 'Charlie', 5441, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (31, 'Pam', 9505, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (32, 'Bob', 4888, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (33, 'Alice', 7799, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (34, 'Todd', 5994, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (35, 'Pam', 2266, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (36, 'Pam', 5105, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (37, 'Sam', 4099, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (38, 'Eve', 2146, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (39, 'Pam', 3199, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (40, 'Sara', 6528, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (41, 'David', 7496, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (42, 'Sam', 2727, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (43, 'John', 7841, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (44, 'Eve', 7067, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (45, 'Bob', 9747, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (46, 'Todd', 2459, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (47, 'Alice', 5665, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (48, 'Bob', 2230, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (49, 'Pam', 6756, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (50, 'Eve', 8141, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (51, 'Todd', 6005, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (52, 'Bob', 7448, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (53, 'Charlie', 4852, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (54, 'David', 6907, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (55, 'Alice', 5683, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (56, 'Eve', 4785, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (57, 'Pam', 8782, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (58, 'Eve', 4961, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (59, 'Alice', 7409, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (60, 'Pam', 5016, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (61, 'Eve', 7654, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (62, 'Alice', 2696, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (63, 'Pam', 8348, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (64, 'Sara', 3717, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (65, 'Eve', 4857, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (66, 'Sam', 4834, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (67, 'Todd', 3033, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (68, 'Todd', 2787, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (69, 'Todd', 9004, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (70, 'Sam', 4944, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (71, 'Eve', 6841, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (72, 'Pam', 4430, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (73, 'Todd', 4898, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (74, 'John', 3326, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (75, 'Sara', 6469, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (76, 'Todd', 5546, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (77, 'Charlie', 2065, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (78, 'Bob', 3497, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (79, 'Alice', 5683, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (80, 'Eve', 9263, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (81, 'Todd', 4166, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (82, 'Eve', 6970, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (83, 'Charlie', 8977, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (84, 'Sam', 3277, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (85, 'Pam', 7427, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (86, 'Todd', 9189, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (87, 'Todd', 4431, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (88, 'Sara', 5462, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (89, 'David', 8038, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (90, 'Pam', 9055, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (91, 'Todd', 5422, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (92, 'Todd', 4336, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (93, 'Sara', 3114, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (94, 'John', 4614, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (95, 'Charlie', 4919, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (96, 'Todd', 3499, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (97, 'Eve', 2037, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (98, 'Alice', 7573, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (99, 'Todd', 6207, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (100, 'Eve', 3559, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (101, 'Eve', 7782, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (102, 'Sam', 7468, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (103, 'Sam', 3988, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (104, 'Sam', 5477, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (105, 'David', 7721, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (106, 'John', 3749, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (107, 'Eve', 2645, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (108, 'Alice', 6460, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (109, 'Bob', 5037, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (110, 'John', 4208, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (111, 'Bob', 2758, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (112, 'Sara', 8707, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (113, 'David', 2193, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (114, 'Pam', 5415, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (115, 'David', 6449, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (116, 'Todd', 7267, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (117, 'Eve', 9486, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (118, 'Charlie', 8944, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (119, 'Bob', 7971, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (120, 'Charlie', 8194, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (121, 'Alice', 9429, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (122, 'David', 7918, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (123, 'Todd', 9802, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (124, 'Charlie', 4494, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (125, 'Sam', 9680, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (126, 'Sam', 2319, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (127, 'Todd', 3403, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (128, 'Alice', 2811, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (129, 'Pam', 7144, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (130, 'David', 6813, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (131, 'Eve', 8789, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (132, 'Todd', 5236, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (133, 'Charlie', 4856, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (134, 'David', 3571, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (135, 'Pam', 9592, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (136, 'Eve', 7107, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (137, 'Sara', 3489, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (138, 'Charlie', 3410, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (139, 'Todd', 5134, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (140, 'Pam', 3178, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (141, 'John', 2327, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (142, 'John', 5791, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (143, 'Todd', 6206, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (144, 'Charlie', 5449, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (145, 'Alice', 6361, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (146, 'Alice', 2551, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (147, 'Todd', 6792, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (148, 'Pam', 3617, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (149, 'Eve', 4364, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (150, 'Charlie', 3364, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (151, 'Sara', 3835, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (152, 'Pam', 6353, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (153, 'Sam', 3527, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (154, 'Bob', 3158, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (155, 'Charlie', 4198, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (156, 'Todd', 8821, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (157, 'Bob', 5408, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (158, 'David', 7339, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (159, 'Sam', 7999, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (160, 'Pam', 5425, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (161, 'Sam', 2784, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (162, 'Pam', 7659, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (163, 'John', 6605, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (164, 'David', 6441, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (165, 'Todd', 6951, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (166, 'Charlie', 7817, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (167, 'David', 3140, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (168, 'Pam', 3676, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (169, 'John', 3640, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (170, 'Bob', 3786, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (171, 'Alice', 8629, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (172, 'David', 3519, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (173, 'Sam', 4821, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (174, 'Todd', 9462, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (175, 'Bob', 4843, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (176, 'Todd', 9873, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (177, 'Bob', 2003, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (178, 'Bob', 7360, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (179, 'John', 5431, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (180, 'Bob', 7859, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (181, 'Alice', 9800, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (182, 'Todd', 5295, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (183, 'Eve', 2577, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (184, 'Todd', 8743, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (185, 'Sam', 7086, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (186, 'Sam', 2767, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (187, 'John', 7204, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (188, 'Eve', 2552, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (189, 'David', 8776, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (190, 'Sam', 7580, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (191, 'Alice', 2281, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (192, 'Pam', 9193, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (193, 'Pam', 3579, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (194, 'Charlie', 2239, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (195, 'Eve', 4940, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (196, 'Charlie', 2008, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (197, 'Pam', 5999, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (198, 'Bob', 5500, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (199, 'Bob', 5325, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (200, 'Pam', 4899, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (201, 'David', 3170, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (202, 'David', 9711, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (203, 'David', 2929, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (204, 'Sam', 7018, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (205, 'David', 6741, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (206, 'Charlie', 5814, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (207, 'David', 5683, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (208, 'David', 9788, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (209, 'Eve', 6314, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (210, 'Todd', 2241, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (211, 'Todd', 5091, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (212, 'Eve', 4497, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (213, 'Bob', 4375, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (214, 'Charlie', 3315, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (215, 'John', 7524, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (216, 'Alice', 5336, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (217, 'Alice', 5890, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (218, 'John', 2697, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (219, 'John', 5096, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (220, 'David', 6466, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (221, 'Alice', 4226, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (222, 'Bob', 7748, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (223, 'Charlie', 4191, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (224, 'Sam', 5195, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (225, 'Charlie', 4587, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (226, 'David', 6832, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (227, 'Pam', 8818, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (228, 'Sara', 2018, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (229, 'Pam', 3061, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (230, 'Bob', 3477, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (231, 'Charlie', 6894, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (232, 'Bob', 9596, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (233, 'Eve', 8190, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (234, 'Alice', 3403, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (235, 'David', 8937, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (236, 'Alice', 4507, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (237, 'Eve', 5661, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (238, 'Bob', 9877, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (239, 'Charlie', 7363, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (240, 'Todd', 5351, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (241, 'Charlie', 9934, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (242, 'David', 8389, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (243, 'Eve', 3858, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (244, 'Bob', 5408, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (245, 'David', 9452, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (246, 'Sam', 9671, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (247, 'Charlie', 8080, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (248, 'Alice', 7896, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (249, 'Todd', 8093, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (250, 'John', 3106, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (251, 'Charlie', 6179, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (252, 'Alice', 8556, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (253, 'Alice', 4390, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (254, 'David', 5357, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (255, 'Alice', 9350, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (256, 'Todd', 2843, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (257, 'Alice', 4206, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (258, 'Pam', 9674, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (259, 'Alice', 5779, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (260, 'Alice', 7265, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (261, 'Alice', 2060, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (262, 'David', 6339, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (263, 'Eve', 3970, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (264, 'David', 8179, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (265, 'Pam', 8960, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (266, 'Todd', 8537, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (267, 'Charlie', 9764, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (268, 'David', 6438, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (269, 'Todd', 5718, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (270, 'Charlie', 6359, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (271, 'David', 8096, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (272, 'Alice', 5291, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (273, 'Sam', 5008, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (274, 'Bob', 2575, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (275, 'John', 9652, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (276, 'Eve', 6744, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (277, 'Alice', 3162, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (278, 'Sara', 2476, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (279, 'Alice', 5565, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (280, 'Alice', 2880, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (281, 'David', 4071, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (282, 'Bob', 3343, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (283, 'David', 5231, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (284, 'Sam', 4757, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (285, 'John', 4474, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (286, 'Alice', 5205, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (287, 'Charlie', 3267, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (288, 'Sara', 2269, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (289, 'Pam', 3249, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (290, 'Pam', 7608, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (291, 'Eve', 2692, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (292, 'Eve', 4363, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (293, 'Sara', 8125, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (294, 'Eve', 4742, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (295, 'Pam', 7720, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (296, 'John', 9486, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (297, 'Pam', 5684, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (298, 'Alice', 4715, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (299, 'Eve', 5786, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (300, 'Pam', 7894, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (301, 'Bob', 4747, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (302, 'John', 2010, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (303, 'Sara', 5771, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (304, 'David', 9977, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (305, 'Pam', 8725, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (306, 'Bob', 9124, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (307, 'Eve', 7071, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (308, 'David', 3365, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (309, 'David', 7928, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (310, 'David', 9208, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (311, 'Pam', 3941, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (312, 'Bob', 9200, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (313, 'Pam', 6321, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (314, 'John', 4914, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (315, 'John', 8521, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (316, 'David', 2835, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (317, 'John', 4385, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (318, 'John', 8818, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (319, 'Bob', 6314, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (320, 'Pam', 4494, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (321, 'Charlie', 5103, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (322, 'Bob', 5534, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (323, 'Alice', 4732, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (324, 'Todd', 8338, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (325, 'Todd', 7947, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (326, 'Sara', 5631, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (327, 'Sam', 7639, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (328, 'John', 2265, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (329, 'Alice', 6663, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (330, 'David', 5978, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (331, 'Todd', 5980, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (332, 'Sara', 5424, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (333, 'Sara', 4021, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (334, 'John', 3343, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (335, 'Sara', 9245, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (336, 'Sam', 3853, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (337, 'Sam', 4896, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (338, 'Charlie', 6409, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (339, 'Charlie', 2593, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (340, 'Charlie', 9982, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (341, 'Bob', 9518, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (342, 'John', 8370, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (343, 'Sara', 9371, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (344, 'Charlie', 8866, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (345, 'Eve', 2771, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (346, 'Pam', 2820, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (347, 'Todd', 7478, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (348, 'Eve', 5459, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (349, 'Bob', 4877, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (350, 'Pam', 4073, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (351, 'Sam', 9185, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (352, 'Alice', 6111, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (353, 'Todd', 4799, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (354, 'Pam', 8198, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (355, 'Bob', 7962, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (356, 'Todd', 2396, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (357, 'David', 7038, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (358, 'John', 2902, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (359, 'Sam', 8912, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (360, 'Alice', 6083, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (361, 'Alice', 3958, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (362, 'Sam', 9533, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (363, 'Alice', 3022, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (364, 'Alice', 6715, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (365, 'Pam', 2242, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (366, 'Eve', 8493, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (367, 'Alice', 3983, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (368, 'Sara', 2978, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (369, 'John', 5496, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (370, 'Charlie', 2224, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (371, 'Bob', 8137, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (372, 'Charlie', 2099, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (373, 'David', 9157, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (374, 'Eve', 8743, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (375, 'John', 4869, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (376, 'Charlie', 5807, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (377, 'Todd', 4553, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (378, 'Sam', 5895, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (379, 'Eve', 4212, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (380, 'Pam', 6507, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (381, 'Sam', 5172, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (382, 'Pam', 7130, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (383, 'Sam', 6050, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (384, 'Eve', 8808, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (385, 'John', 3800, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (386, 'Pam', 3577, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (387, 'Sam', 3920, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (388, 'Bob', 5075, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (389, 'Todd', 4320, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (390, 'Bob', 2122, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (391, 'Sara', 4953, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (392, 'Bob', 4598, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (393, 'Pam', 6476, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (394, 'John', 6578, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (395, 'Charlie', 3982, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (396, 'Sam', 3969, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (397, 'Todd', 4425, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (398, 'Pam', 5063, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (399, 'Sara', 5692, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (400, 'Pam', 2378, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (401, 'Eve', 3889, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (402, 'John', 4134, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (403, 'Eve', 5736, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (404, 'David', 4582, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (405, 'Bob', 2033, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (406, 'Sara', 8732, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (407, 'Sara', 4868, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (408, 'Sam', 3295, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (409, 'John', 4828, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (410, 'Eve', 5644, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (411, 'Eve', 4228, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (412, 'Sam', 6661, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (413, 'Bob', 7686, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (414, 'Alice', 2828, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (415, 'John', 9271, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (416, 'Todd', 8549, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (417, 'Charlie', 9216, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (418, 'Charlie', 3529, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (419, 'John', 2115, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (420, 'Eve', 5814, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (421, 'Todd', 8196, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (422, 'Sara', 7411, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (423, 'Bob', 4923, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (424, 'Sara', 3181, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (425, 'John', 7100, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (426, 'Charlie', 7225, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (427, 'Pam', 7344, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (428, 'Pam', 8135, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (429, 'David', 8226, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (430, 'David', 6772, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (431, 'Todd', 2630, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (432, 'Sam', 8856, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (433, 'Pam', 8351, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (434, 'Sara', 4773, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (435, 'Pam', 5398, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (436, 'Sara', 9127, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (437, 'Todd', 4461, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (438, 'John', 9271, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (439, 'Pam', 8131, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (440, 'Pam', 4672, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (441, 'John', 4184, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (442, 'Eve', 4622, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (443, 'David', 4897, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (444, 'Sam', 6920, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (445, 'Charlie', 5460, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (446, 'John', 7199, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (447, 'Sam', 6919, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (448, 'Todd', 8906, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (449, 'Sam', 3147, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (450, 'Charlie', 4797, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (451, 'John', 4998, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (452, 'Alice', 4832, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (453, 'David', 3768, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (454, 'Alice', 4242, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (455, 'Eve', 6420, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (456, 'John', 9490, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (457, 'Bob', 4011, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (458, 'Pam', 6578, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (459, 'David', 9291, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (460, 'Bob', 4546, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (461, 'Pam', 9930, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (462, 'Sam', 5408, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (463, 'David', 3146, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (464, 'Todd', 4355, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (465, 'Bob', 2266, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (466, 'Bob', 2930, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (467, 'Sara', 6246, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (468, 'Eve', 9936, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (469, 'Alice', 7331, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (470, 'John', 2143, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (471, 'Pam', 8886, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (472, 'Eve', 5136, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (473, 'Sam', 7281, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (474, 'David', 2323, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (475, 'Charlie', 2269, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (476, 'Sara', 2970, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (477, 'Eve', 2632, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (478, 'David', 8384, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (479, 'John', 7136, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (480, 'Alice', 7620, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (481, 'John', 9496, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (482, 'Eve', 2802, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (483, 'John', 4674, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (484, 'Alice', 3162, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (485, 'David', 8608, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (486, 'Todd', 2099, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (487, 'David', 8666, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (488, 'Todd', 5142, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (489, 'Todd', 9452, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (490, 'Charlie', 8678, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (491, 'Bob', 5338, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (492, 'Sara', 3676, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (493, 'Pam', 6993, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (494, 'Pam', 9785, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (495, 'Bob', 6051, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (496, 'Sam', 6787, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (497, 'John', 5567, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (498, 'John', 2932, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (499, 'Eve', 5949, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (500, 'Sam', 8827, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (501, 'Pam', 3929, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (502, 'Alice', 7672, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (503, 'John', 7554, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (504, 'Todd', 7114, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (505, 'Todd', 6377, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (506, 'Eve', 8767, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (507, 'Todd', 9161, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (508, 'Sam', 2374, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (509, 'Eve', 9878, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (510, 'Eve', 6360, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (511, 'Charlie', 3238, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (512, 'Sara', 9450, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (513, 'Eve', 2076, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (514, 'Charlie', 5941, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (515, 'John', 7240, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (516, 'David', 3749, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (517, 'John', 6480, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (518, 'Eve', 3595, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (519, 'Sam', 7238, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (520, 'David', 2586, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (521, 'Pam', 2649, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (522, 'Sam', 2028, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (523, 'Pam', 6150, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (524, 'David', 2726, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (525, 'David', 4017, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (526, 'Bob', 8348, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (527, 'David', 4432, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (528, 'Pam', 4733, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (529, 'Todd', 7705, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (530, 'Todd', 2310, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (531, 'Alice', 5683, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (532, 'David', 3615, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (533, 'Eve', 6332, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (534, 'Sam', 5291, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (535, 'Todd', 9204, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (536, 'Charlie', 9392, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (537, 'Sara', 5338, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (538, 'David', 2435, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (539, 'Charlie', 7335, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (540, 'Sara', 3759, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (541, 'Charlie', 2659, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (542, 'John', 5757, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (543, 'Sam', 8586, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (544, 'John', 2278, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (545, 'Bob', 7372, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (546, 'Alice', 4974, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (547, 'Pam', 4762, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (548, 'Bob', 5536, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (549, 'John', 9102, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (550, 'John', 4751, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (551, 'David', 7659, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (552, 'Charlie', 2408, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (553, 'Todd', 3548, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (554, 'Bob', 9299, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (555, 'Todd', 2190, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (556, 'Pam', 7054, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (557, 'Alice', 3572, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (558, 'Todd', 3506, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (559, 'Pam', 3906, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (560, 'John', 9514, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (561, 'Bob', 6275, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (562, 'Alice', 6066, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (563, 'Sara', 4648, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (564, 'Charlie', 2744, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (565, 'Pam', 9503, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (566, 'Pam', 4542, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (567, 'Sara', 4820, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (568, 'Todd', 3638, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (569, 'Charlie', 7480, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (570, 'Eve', 5284, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (571, 'Alice', 4527, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (572, 'John', 5293, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (573, 'Pam', 5851, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (574, 'Alice', 2573, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (575, 'Alice', 2141, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (576, 'David', 5390, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (577, 'Eve', 7714, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (578, 'Bob', 7311, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (579, 'Todd', 9185, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (580, 'Bob', 6319, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (581, 'Sam', 5407, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (582, 'Eve', 8057, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (583, 'John', 9102, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (584, 'Sara', 3591, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (585, 'John', 7327, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (586, 'Eve', 3703, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (587, 'John', 5637, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (588, 'Bob', 8073, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (589, 'David', 8897, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (590, 'Sam', 9734, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (591, 'Alice', 5935, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (592, 'Sam', 4960, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (593, 'Todd', 6101, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (594, 'Eve', 4352, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (595, 'Alice', 6191, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (596, 'Alice', 2451, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (597, 'John', 8067, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (598, 'Sara', 6687, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (599, 'Pam', 7432, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (600, 'Todd', 4740, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (601, 'Bob', 7881, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (602, 'David', 3166, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (603, 'Todd', 8570, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (604, 'Alice', 3067, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (605, 'Pam', 9416, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (606, 'David', 8145, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (607, 'Todd', 7556, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (608, 'John', 3679, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (609, 'Alice', 6985, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (610, 'John', 3517, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (611, 'Sara', 4502, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (612, 'Sara', 8412, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (613, 'Alice', 6566, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (614, 'David', 5556, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (615, 'Charlie', 4037, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (616, 'Alice', 4070, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (617, 'John', 3040, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (618, 'Eve', 5477, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (619, 'Alice', 7893, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (620, 'Charlie', 7898, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (621, 'Bob', 6005, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (622, 'Bob', 9999, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (623, 'David', 8646, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (624, 'Sam', 6947, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (625, 'David', 6893, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (626, 'John', 4135, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (627, 'Bob', 2013, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (628, 'Bob', 7973, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (629, 'Sam', 8054, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (630, 'Sam', 9555, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (631, 'Pam', 8850, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (632, 'John', 3528, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (633, 'Alice', 4644, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (634, 'Eve', 2681, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (635, 'Sam', 2567, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (636, 'Alice', 5007, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (637, 'Charlie', 2187, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (638, 'Sam', 9775, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (639, 'Bob', 4362, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (640, 'Pam', 7933, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (641, 'David', 7744, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (642, 'Alice', 5330, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (643, 'Pam', 7114, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (644, 'Bob', 3507, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (645, 'Sam', 2607, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (646, 'Eve', 5139, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (647, 'David', 5192, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (648, 'Pam', 6375, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (649, 'Charlie', 7859, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (650, 'Charlie', 6686, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (651, 'Alice', 6110, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (652, 'Alice', 2832, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (653, 'Sam', 3175, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (654, 'Eve', 9724, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (655, 'Todd', 9784, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (656, 'David', 3421, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (657, 'Charlie', 5308, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (658, 'Bob', 9271, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (659, 'Pam', 7462, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (660, 'Alice', 2711, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (661, 'Bob', 9018, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (662, 'Charlie', 9696, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (663, 'Todd', 3041, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (664, 'Eve', 3927, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (665, 'Sam', 3728, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (666, 'Alice', 7999, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (667, 'Charlie', 4123, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (668, 'John', 4321, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (669, 'Alice', 6259, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (670, 'Sam', 4693, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (671, 'Alice', 2505, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (672, 'John', 7906, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (673, 'Eve', 4235, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (674, 'Eve', 3074, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (675, 'John', 6131, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (676, 'John', 7850, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (677, 'Pam', 2273, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (678, 'Todd', 3438, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (679, 'Sam', 6430, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (680, 'Sara', 4693, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (681, 'Alice', 3781, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (682, 'John', 7237, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (683, 'Alice', 4391, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (684, 'Sam', 8413, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (685, 'Todd', 4602, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (686, 'Charlie', 4738, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (687, 'Eve', 7019, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (688, 'David', 9774, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (689, 'Sam', 6285, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (690, 'Alice', 2846, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (691, 'Charlie', 5936, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (692, 'John', 5383, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (693, 'Charlie', 4615, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (694, 'John', 9687, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (695, 'Bob', 7184, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (696, 'Sam', 5741, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (697, 'John', 2400, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (698, 'Alice', 2912, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (699, 'Todd', 4676, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (700, 'David', 4123, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (701, 'Eve', 2140, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (702, 'Pam', 4894, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (703, 'Bob', 4573, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (704, 'Eve', 5323, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (705, 'David', 5544, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (706, 'David', 6943, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (707, 'John', 7665, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (708, 'Sam', 2859, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (709, 'Bob', 5619, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (710, 'Charlie', 3536, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (711, 'Charlie', 6533, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (712, 'Alice', 4002, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (713, 'John', 6800, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (714, 'Charlie', 6480, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (715, 'Charlie', 9217, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (716, 'Pam', 5208, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (717, 'David', 6911, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (718, 'Sara', 3787, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (719, 'David', 6687, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (720, 'David', 7205, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (721, 'Bob', 8645, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (722, 'Sam', 3535, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (723, 'Pam', 5675, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (724, 'David', 5263, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (725, 'Eve', 8375, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (726, 'David', 4310, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (727, 'Eve', 2221, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (728, 'Sara', 8330, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (729, 'Alice', 4958, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (730, 'Bob', 8966, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (731, 'Sam', 7858, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (732, 'Charlie', 3201, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (733, 'John', 8143, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (734, 'Alice', 7092, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (735, 'Charlie', 7543, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (736, 'Sam', 3882, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (737, 'Alice', 6545, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (738, 'Eve', 4936, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (739, 'Todd', 6533, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (740, 'John', 8454, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (741, 'Pam', 3756, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (742, 'Bob', 7791, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (743, 'David', 5101, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (744, 'Eve', 7083, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (745, 'Sam', 6325, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (746, 'Bob', 5776, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (747, 'Sara', 6866, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (748, 'Charlie', 9307, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (749, 'Pam', 3463, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (750, 'David', 7513, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (751, 'Charlie', 6333, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (752, 'Alice', 7583, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (753, 'Bob', 8188, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (754, 'Alice', 9744, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (755, 'Alice', 4019, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (756, 'Sam', 5171, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (757, 'John', 2291, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (758, 'Pam', 9461, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (759, 'Pam', 3128, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (760, 'Eve', 7091, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (761, 'Sam', 3031, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (762, 'David', 4575, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (763, 'Todd', 6258, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (764, 'Sam', 7959, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (765, 'Charlie', 6818, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (766, 'Eve', 9677, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (767, 'Eve', 9456, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (768, 'Sara', 6022, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (769, 'Sam', 5992, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (770, 'John', 7206, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (771, 'Alice', 3096, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (772, 'Todd', 9609, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (773, 'Sara', 2744, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (774, 'Sam', 2516, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (775, 'Charlie', 7051, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (776, 'Todd', 3157, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (777, 'Bob', 2934, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (778, 'Pam', 9071, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (779, 'Charlie', 4720, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (780, 'Todd', 6700, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (781, 'Alice', 5105, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (782, 'Alice', 8132, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (783, 'Charlie', 4579, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (784, 'Alice', 4975, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (785, 'Pam', 9436, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (786, 'David', 3834, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (787, 'Sara', 9372, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (788, 'Alice', 2560, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (789, 'Sam', 4731, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (790, 'Eve', 7935, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (791, 'Alice', 9141, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (792, 'Eve', 2076, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (793, 'Bob', 3715, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (794, 'Alice', 7265, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (795, 'Sara', 2755, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (796, 'Charlie', 6745, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (797, 'Sara', 2677, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (798, 'Pam', 3565, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (799, 'Sara', 6229, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (800, 'Pam', 2085, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (801, 'Pam', 7199, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (802, 'Alice', 7364, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (803, 'David', 5297, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (804, 'John', 2071, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (805, 'Sam', 3298, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (806, 'David', 3481, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (807, 'Alice', 8657, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (808, 'John', 7745, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (809, 'Bob', 2636, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (810, 'David', 4528, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (811, 'Charlie', 9064, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (812, 'Bob', 5157, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (813, 'David', 6748, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (814, 'Alice', 5170, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (815, 'Sam', 8485, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (816, 'Pam', 9748, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (817, 'David', 5195, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (818, 'Todd', 3618, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (819, 'David', 5460, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (820, 'David', 2666, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (821, 'Bob', 6401, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (822, 'Bob', 7582, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (823, 'Eve', 7422, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (824, 'Alice', 7658, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (825, 'Bob', 5397, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (826, 'Sam', 7894, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (827, 'John', 5406, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (828, 'Charlie', 6608, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (829, 'Bob', 6663, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (830, 'David', 9452, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (831, 'Sam', 8895, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (832, 'Charlie', 6311, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (833, 'Sara', 2346, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (834, 'David', 8512, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (835, 'John', 2259, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (836, 'Sam', 7359, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (837, 'Sam', 3513, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (838, 'Todd', 7316, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (839, 'Sara', 9657, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (840, 'Bob', 2573, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (841, 'John', 8315, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (842, 'Alice', 2762, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (843, 'Todd', 4421, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (844, 'Todd', 3581, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (845, 'Pam', 6466, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (846, 'Charlie', 6959, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (847, 'Sara', 3216, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (848, 'Pam', 5779, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (849, 'Sara', 8662, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (850, 'Alice', 3311, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (851, 'Sam', 9248, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (852, 'Sam', 4061, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (853, 'Sam', 4944, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (854, 'Sam', 4986, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (855, 'Charlie', 5266, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (856, 'Alice', 2096, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (857, 'Sam', 9400, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (858, 'Sara', 6946, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (859, 'Bob', 7234, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (860, 'John', 6384, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (861, 'Sara', 2402, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (862, 'Bob', 4776, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (863, 'Alice', 4566, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (864, 'Pam', 7834, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (865, 'Sam', 3496, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (866, 'John', 2299, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (867, 'Charlie', 5706, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (868, 'Todd', 6595, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (869, 'Eve', 8473, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (870, 'Alice', 9755, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (871, 'Alice', 3707, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (872, 'David', 8273, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (873, 'John', 2379, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (874, 'Eve', 3028, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (875, 'Bob', 8918, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (876, 'David', 8507, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (877, 'Sam', 5231, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (878, 'Eve', 6240, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (879, 'Pam', 9732, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (880, 'Eve', 7006, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (881, 'John', 9401, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (882, 'Sam', 7206, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (883, 'Charlie', 3603, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (884, 'Sam', 2071, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (885, 'Alice', 5955, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (886, 'Sara', 9418, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (887, 'Eve', 6800, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (888, 'Bob', 2836, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (889, 'David', 6155, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (890, 'Todd', 9867, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (891, 'John', 2355, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (892, 'Alice', 8185, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (893, 'Eve', 6712, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (894, 'Eve', 9768, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (895, 'Sara', 9781, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (896, 'John', 8580, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (897, 'John', 8073, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (898, 'Pam', 9477, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (899, 'John', 8157, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (900, 'Bob', 7106, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (901, 'Todd', 2886, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (902, 'David', 5927, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (903, 'Pam', 4524, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (904, 'Eve', 9436, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (905, 'Eve', 3020, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (906, 'Alice', 9213, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (907, 'Todd', 7986, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (908, 'John', 2764, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (909, 'Sara', 4429, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (910, 'David', 8716, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (911, 'David', 9144, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (912, 'Pam', 5210, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (913, 'Bob', 6931, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (914, 'Sam', 8682, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (915, 'Sara', 5294, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (916, 'Charlie', 5692, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (917, 'Bob', 2742, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (918, 'Sam', 3684, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (919, 'Pam', 5899, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (920, 'John', 8701, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (921, 'John', 5461, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (922, 'John', 9983, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (923, 'John', 5121, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (924, 'David', 9131, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (925, 'Charlie', 9274, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (926, 'Eve', 5788, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (927, 'Pam', 5425, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (928, 'Alice', 8744, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (929, 'Charlie', 7646, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (930, 'Pam', 6404, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (931, 'Eve', 2462, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (932, 'Todd', 3879, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (933, 'Alice', 5751, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (934, 'Charlie', 6257, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (935, 'Pam', 3414, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (936, 'Charlie', 9465, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (937, 'Todd', 2182, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (938, 'Todd', 4451, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (939, 'John', 8707, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (940, 'David', 2303, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (941, 'Charlie', 2997, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (942, 'Todd', 6333, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (943, 'Pam', 7206, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (944, 'Sam', 9337, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (945, 'Eve', 2747, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (946, 'Sam', 2557, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (947, 'Todd', 8707, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (948, 'Pam', 5021, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (949, 'Bob', 3592, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (950, 'Pam', 9886, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (951, 'Bob', 6086, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (952, 'John', 8382, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (953, 'Sam', 9567, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (954, 'Alice', 7259, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (955, 'David', 3310, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (956, 'Bob', 7480, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (957, 'Charlie', 9110, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (958, 'Alice', 4120, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (959, 'Sam', 5522, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (960, 'Bob', 8038, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (961, 'Todd', 4134, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (962, 'Sara', 9248, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (963, 'David', 7948, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (964, 'Bob', 6942, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (965, 'Bob', 9818, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (966, 'Bob', 5595, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (967, 'John', 8432, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (968, 'Todd', 6409, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (969, 'Sam', 3599, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (970, 'David', 7650, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (971, 'Sara', 5541, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (972, 'Eve', 9916, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (973, 'Pam', 3471, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (974, 'Pam', 2631, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (975, 'Sara', 5782, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (976, 'Pam', 5900, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (977, 'John', 5315, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (978, 'Todd', 8031, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (979, 'Alice', 5414, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (980, 'Pam', 9877, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (981, 'Charlie', 4545, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (982, 'Bob', 7373, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (983, 'Sam', 2505, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (984, 'Eve', 2234, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (985, 'David', 3788, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (986, 'Sara', 5880, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (987, 'Pam', 3733, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (988, 'David', 5729, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (989, 'Eve', 3317, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (990, 'Todd', 7949, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (991, 'Charlie', 5653, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (992, 'Alice', 7679, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (993, 'David', 5078, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (994, 'John', 3823, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (995, 'Todd', 7273, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (996, 'Sara', 9657, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (997, 'John', 2016, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (998, 'Bob', 9778, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (999, 'Pam', 4910, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (1000, 'John', 3932, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (1001, 'Todd', 5009, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (1002, 'Eve', 8957, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (1003, 'Eve', 8284, 'Male');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (1004, 'Pam', 7144, 'Female');
INSERT INTO Employees (Id, Name, Salary, Gender) VALUES (1005, 'Todd', 4142, 'Male');


SELECT *FROM Employees

--1. CLUSTERED INDEX: WHICH MAINTAINS PHYSICAL ORDER OF TABLE.

--MANUALLY CREATING INDEX (CLUSTERED)
CREATE CLUSTERED INDEX IX_EMPLOYEE_SALARY
ON Employees(SALARY ASC)


--
DROP INDEX EMPLOYEES.IX_EMPLOYEE_SALARY


SELECT *FROM EMPLOYEES 
WHERE SALARY > 2000 AND SALARY < 8000


--NON CLUSTERED INDEX
CREATE INDEX IX_EMPLOYEE_SALARY
ON Employees(SALARY ASC)

CREATE INDEX IX_EMPLOYEE_SALARY
ON Employees(GENDER ASC)

--TO CHECK IF INDEX IS PRESENT OR NOT
 SP_HELPINDEX EMPLOYEES


EXEC SP_HELP IX_EMPLOYEE_SALARY


















-------------------------------WINDOW FUNCTIONS (COMPLETE)---------------------------------------
CREATE TABLE Employee_01 (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(20),
    Salary INT
);


INSERT INTO Employee_01 (EmpID, EmpName, Department, Salary)
VALUES
(1, 'John Doe', 'Admin', 45000),
(2, 'Jane Smith', 'Finance', 52000),
(3, 'Alice Johnson', 'HR', 48000),
(4, 'Bob Lee', 'Accounts', 50000),
(5, 'Charlie Brown', 'Admin', 46000),
(6, 'Daisy Miller', 'Finance', 55000),
(7, 'Ethan Hunt', 'HR', 47000),
(8, 'Fiona Scott', 'Accounts', 51000),
(9, 'George Blake', 'Admin', 44000),
(10, 'Hannah Moore', 'Finance', 60000),
(11, 'Ivan Perez', 'HR', 49000),
(12, 'Julia White', 'Accounts', 52000),
(13, 'Kevin Thomas', 'Admin', 43000),
(14, 'Laura Davis', 'Finance', 53000),
(15, 'Mike Brown', 'HR', 46000),
(16, 'Nina Carter', 'Accounts', 54000),
(17, 'Oscar King', 'Admin', 41000),
(18, 'Paula Adams', 'Finance', 58000),
(19, 'Quentin Hill', 'HR', 47000),
(20, 'Rachel Green', 'Accounts', 50000),
(21, 'Steve Martin', 'Admin', 47000),
(22, 'Tina Hall', 'Finance', 56000),
(23, 'Uma Watson', 'HR', 48000),
(24, 'Victor Young', 'Accounts', 53000),
(25, 'Wendy Reed', 'Admin', 45000),
(26, 'Xander Lewis', 'Finance', 62000),
(27, 'Yvonne Brooks', 'HR', 45500),
(28, 'Zack Bell', 'Accounts', 51000),
(29, 'Alan Grant', 'Admin', 42000),
(30, 'Betty Allen', 'Finance', 60000),
(31, 'Carl Ross', 'HR', 47000),
(32, 'Dora Nash', 'Accounts', 52500),
(33, 'Eli Carter', 'Admin', 48000),
(34, 'Faith Owens', 'Finance', 59000),
(35, 'Gary Fox', 'HR', 46000),
(36, 'Helen Ward', 'Accounts', 55000),
(37, 'Ian Kim', 'Admin', 49000),
(38, 'Jenny Park', 'Finance', 57000),
(39, 'Kyle Neal', 'HR', 49500),
(40, 'Lena Paul', 'Accounts', 54000);






SELECT *FROM Employee_01

SELECT MAX(SALARY) FROM Employee_01

SELECT E.*,
MAX(SALARY) OVER() AS MAX_SALARY
FROM Employee_01 AS E

--NOW I WANT THE MAX SALARY DEPARTMENT WISE + ALL DATA
SELECT E.*,
MAX(SALARY) OVER(PARTITION BY DEPARTMENT) AS MAX_SALARY
FROM Employee_01 AS E

--ROW_NUMBER, RANK, DENSE_RANK, LEAD, LAG
--ROW_NUMBER = ASSIGNS UNIQUE NUMBER TO EACH RECORD

SELECT E.*,
ROW_NUMBER() OVER() AS RN
FROM Employee_01 AS E;
--NOW IN SSMS IT IS MANDATORY TO USE ORDER BY WITH THESE FUNCTIONS
--INSIDE THE OVER CLAUSE
SELECT E.*,
ROW_NUMBER() OVER(ORDER BY EMPID) AS RN
FROM Employee_01 AS E;

--LET SAY I WANT TO ASSIGN THE NUMBER BASED ON DEPT_NAME
--PARTION THE TABLE DEPARTMENT WISE
SELECT E.*,
ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY EMPID) AS RN
FROM Employee_01 AS E;

--SIMILARLY LET'S SAY YOU WANT TO FIND THE 1ST TWO EMP WHO JOINED
SELECT *FROM
(SELECT E.*,
ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY EMPID) AS RN
FROM Employee_01 AS E) AS X
WHERE X.RN<3;




------------------RANK()-----------------
--IF IT FINDS DUPLICATE RECORDS->GIVES SAME RANK AND INCREMENTS
--TOP 3 EMPLOYEES FROM EACH DEPARTMENT WHO EARNS MORE

SELECT E.*,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK
FROM Employee_01 AS E

SELECT * FROM(
SELECT E.*,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK
FROM Employee_01 AS E) AS X
WHERE X.RNK<4;



------------------DENSE_RANK()-----------------
--IF IT FINDS DUPLICATE RECORDS->GIVES SAME RANK AND MAINTAINS SEQUENCE
--DOES'NT SKIP THE VALUE


SELECT E.*,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK,

DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DNS_RNK
FROM Employee_01 AS E


--ROW_NUMBER AGAIN
SELECT E.*,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK,

DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DNS_RNK,

ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RN

FROM Employee_01 AS E






--LEAD AND LAG
--YOU WANT TO CHECK WHETHER SALARY OF CURRENT EMPLOYEE IS HIGHER OR LOWER
--THAN THE PREVIOUS OR NEXT EMPLOYEE - LEAD AND LAG()
--FOR PREVIOUS -  WE USE LAG
--FOR NEXT - WE USE LEAD

SELECT E.*,
LAG(SALARY) OVER(PARTITION BY DEPARTMENT ORDER BY EMPID) AS PREVIOUS_EMPLOYEE
FROM Employee_01 AS E;


SELECT E.*,
LAG(SALARY,2,0) OVER(PARTITION BY DEPARTMENT ORDER BY EMPID) AS PREVIOUS_EMPLOYEE
FROM Employee_01 AS E;
--IT WILL CHECK TWO ROWS PREVIOUS

SELECT E.*,
LAG(SALARY,1,0) OVER(PARTITION BY DEPARTMENT ORDER BY EMPID) AS PREVIOUS_EMPLOYEE
FROM Employee_01 AS E;




SELECT E.*,
LEAD(SALARY) OVER(PARTITION BY DEPARTMENT ORDER BY EMPID) AS PREVIOUS_EMPLOYEE
FROM Employee_01 AS E;


--WRITE A QUERY TO DISPLAY IF THE SALARY OF AN EMPLOYEE IS HIGHER, LOWER
-- OR EQUAL TO THE PREVIOUS EMPLOYEE

SELECT 
    E.*,
    LAG(SALARY) OVER (PARTITION BY DEPARTMENT ORDER BY EMPID) AS PREVIOUS_EMPLOYEE,
    CASE 
        WHEN E.SALARY > LAG(SALARY) OVER (PARTITION BY DEPARTMENT ORDER BY EMPID)
            THEN 'HIGHER THAN PREVIOUS EMPLOYEE'
        WHEN E.SALARY < LAG(SALARY) OVER (PARTITION BY DEPARTMENT ORDER BY EMPID)
            THEN 'LOWER THAN PREVIOUS EMPLOYEE'
        WHEN E.SALARY = LAG(SALARY) OVER (PARTITION BY DEPARTMENT ORDER BY EMPID)
            THEN 'SAME AS PREVIOUS EMPLOYEE'
        ELSE 'NO PREVIOUS EMPLOYEE'
    END AS SALARY_RANGE
FROM Employee_01 AS E;