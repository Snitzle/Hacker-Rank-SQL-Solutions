-- A median is defined as a number separating the higher half of a data set from the lower half. 
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to decimal places. 

-- Input Format

-- The STATION table is described as follows:

-- Field, Type
-- ID, NUMBER
-- CITY, VARCHAR2(21)
-- STATE, VARCHAR2(2)
-- LAT_N, NUMBER
-- LONG_W, NUMBER

SELECT ROUND( LAT_N, 4 )  
FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N ASC) RowNumber
    FROM STATION
    ) DerivedTable
WHERE DerivedTable.RowNumber = ( SELECT CEIL( COUNT( * ) / 2 ) FROM STATION );