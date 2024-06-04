USE youtube_db
GO
/*
Data Quality tests
1. The Data needs to be 100 recods of youtube channels(row count tests) ------------------------------------------------- PASSED
2. The data needs to 4 fields(column count test) ------------------------------------------------------------------------ PASSED
3. The channel name column must be string fromat, and the other coulmn must be numerical data types(data type check)----- PASSED
4. Each records must be unique in the datset(duplicate count check)------------------------------------------------------ PASSED

Row count = 100
Column count = 4

Data types
channel_name =  VARCHAR
total_subscribers = INT
total_views = INT
total_videos = INT

Duplicate count = 0
*/


--1. Row count check
SELECT COUNT(*) as no_of_rows
FROM view_uk_youtubers_2024


--2. Column count check

SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_uk_youtubers_2024'


--3. Data type check

SELECT COLUMN_NAME,
	   DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_uk_youtubers_2024'	


--4. DUPLICATE record check

SELECT channel_name,
	   COUNT(*) AS duplicate_count
FROM view_uk_youtubers_2024
GROUP BY channel_name
HAVING COUNT(*) >1