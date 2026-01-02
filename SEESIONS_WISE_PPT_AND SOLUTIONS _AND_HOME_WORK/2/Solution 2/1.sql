
-- Create table
CREATE TABLE person (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

-- Insert data
INSERT INTO person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

DELETE FROM PERSON
WHERE ID IN(
SELECT P1.ID  FROM Person as p1
JOIN PERSON AS P2
ON P1.ID>P2.ID AND P1.EMAIL=P2.EMAIL
);

-- MYSQL

-- IF YOU DON'T YOU EXTRA DERIVED TABLE (SELECT STATEMENT)
-- OTHER WISE GIVES YOU AN ERROR ,You can't specify target table 'Person' for update in FROM clause

-- DELETE FROM Person
-- WHERE ID IN (
--     SELECT * FROM (
--         SELECT p1.ID
--         FROM Person p1
--         JOIN Person p2
--             ON p1.email = p2.email
--            AND p1.id > p2.id
--     ) AS temp
-- );



-- order by id is optional

--IT WOKRS IN MY SQL 	AND SQL SERVER ALSO 
DELETE FROM  PERSON
WHERE ID IN(
Select id FROM(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY EMAIl order by id ) AS R1
FROM PERSON
) AS temp
where r1>1
)


