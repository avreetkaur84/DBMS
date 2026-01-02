

SELECT * FROM 



-- Create Activity table
CREATE TABLE Activity (
    machine_id     INT,
    process_id     INT,
    activity_type  VARCHAR(10),
    timestamp      DECIMAL(10, 3)
);

-- Insert data into Activity table
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end',   1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end',   4.120),

(1, 0, 'start', 0.550),
(1, 0, 'end',   1.550),
(1, 1, 'start', 0.430),

(1, 1, 'end',   1.420),

(2, 0, 'start', 4.100),
(2, 0, 'end',   4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end',   5.000);

drop table activity

Select * From Activity;

--postgre
SELECT   machine_id ,round((sum(timestamp) Filter(where activity_type='end')-
sum(timestamp) Filter(where activity_type='start'))/count(*) filter(Where  activity_type='end') ,3) 
as Processing_Time
FROM Activity
group by machine_id 
order by machine_id;

-- my sql and  sql server
-- SELECT 
--     machine_id,
--     ROUND(
--         ( SUM(CASE WHEN activity_type = 'end' THEN timestamp ELSE 0 END)
--         - SUM(CASE WHEN activity_type = 'start' THEN timestamp ELSE 0 END) )
--         / COUNT(CASE WHEN activity_type = 'end' THEN 1 END)
--     , 3) AS Processing_Time
-- FROM Activity
-- GROUP BY machine_id
-- ORDER BY machine_id;

-- 2
-- 5
-- 6
-- 7

-- (3+1)/2




