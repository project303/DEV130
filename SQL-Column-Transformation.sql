-- Hands-On
-- SQL Column Transformation




-- 01. Use your own schema /database
USE bob;



-- 02. Convert STRING to INTEGER values data type
SELECT CAST('10' as INT);



-- 03. Convert INTEGER to STRING values data type
SELECT CAST(10 as CHAR);



-- 04. Convert STRING to Date data type
SELECT CAST('2015-01-01' AS DATE), 
       YEAR( CAST('2015-01-01' AS DATE)), 
       DAYNAME(CAST('2015-01-01' AS DATE));



-- 05. CAST function can be used for fixing data type in creating a new table
SELECT release_date FROM movies limit 10;

-- Create new table with 3 column/field: movie_id, movie_title and release year
CREATE TABLE tmp_movies
AS
SELECT movie_id, movie_title, rating, metascore,
       CAST( substr(release_date, 8, 4) AS INT)  AS release_year,
       SUBSTR(release_date, 4, 3)  AS release_month
FROM   movies;


SELECT * FROM tmp_movies
LIMIT 10;


DESC tmp_movies;



-- 06. Getting the length of the string
SELECT LENGTH('Ace Ventura: Pet Detective');


SELECT LENGTH(movie_title) 
FROM tmp_movies
LIMIT 10;



-- 07. Converting all characters to lowercase
SELECT LOWER('Ace Ventura: Pet Detective');


SELECT movie_title, 
       LOWER(release_month),
       release_year
FROM tmp_movies
LIMIT 10;



-- 08. Trimming spaces at the beginning and at the end
SELECT TRIM(' Ace Ventura: Pet Detective ');



-- 09. Concatenating the strings or bytes passed in as parameters in order
SELECT CONCAT('2020-04-01', ' ', '16:52:40');


SELECT movie_title, 
       CONCAT(release_month, '-', release_year)
FROM tmp_movies
LIMIT 10;



-- 10. Substring or slice of the byte array of a string starting from start position with specified length
SELECT SUBSTR('2020-04-01', 6, 2);



-- 11. Show all records which metascore value is NULL
SELECT movie_id, movie_title, rating
FROM   tmp_movies
WHERE  metascore is null;



-- 12. Use COALESCE function to set null value with specified value
SELECT  movie_title, release_date,
        COALESCE(metascore, 0) metascore
FROM  tmp_movies
WHERE metascore is null;



-- 13. The CASE statement goes through conditions and return a value when the first condition is met (like an IF-THEN-ELSE statement)
SELECT  movie_title, rating,
        CASE WHEN rating = 'EXCELENT' THEN 5
             WHEN rating = 'GOOD'     THEN 4
             WHEN rating = 'AVERAGE'  THEN 3
             WHEN rating = 'BAD'      THEN 2
             ELSE 1
        END star
FROM tmp_movies
WHERE metascore IS NOT NULL
LIMIT 10;



-- 14. Get number of day different between date
SELECT DATEDIFF('2012-12-31', '2012-01-01');



-- 15. Get current date
SELECT CURRENT_DATE;



-- Get day of week
-- Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday
SELECT WEEKDAY("2021-01-19") day_of_week, DAYNAME('2021-01-19') full_name, DATE_FORMAT('2021-01-19', '%a') short_name;




-- Get month name
SELECT MONTH('2021-01-19'), MONTHNAME('2021-01-19'), DATE_FORMAT('2021-01-19', '%b');






