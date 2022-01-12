-- Hands-On
-- SQL Data Exploration



-- 01. Use your own schema/database
USE bob;



-- 02. Use bob schema/database
SHOW tables;



-- 03. Count total records
SELECT count(*) as num_record FROM movies;



-- 04. Show all records
SELECT * FROM movies;



-- 05. Limit number of output record to 10
SELECT * FROM movies
LIMIT 20;



-- 06. Show table description
DESC movies;



-- 07. Show specific columns in the table
SELECT 
    movie_id,
    movie_title,
    release_date,
    rating
FROM movies limit 10;



-- 08. Show all unique value of country column
SELECT DISTINCT(country) FROM movies;



-- 09. Show specific columns with transformation in the table
SELECT movie_title AS 'Movie Title',
       substr(release_date, 8, 4) Year
FROM movies
LIMIT 10;



-- ORDER BY Statement

-- 10. ORDER BY is used to sort records based on specify column
SELECT movie_id,
       movie_title,
       substr(release_date, 8, 4) release_year 
FROM movies
ORDER BY movie_id DESC;



-- 11. Show records order by release year and movie title
SELECT substr(release_date, 8, 4) release_year,
       movie_title,
       rating
FROM movies
ORDER BY  substr(release_date, 8, 4),
          movie_title;
          


-- GROUP BY Statement
         
-- 12. Count number of movies group by rating
SELECT rating, count(*) num_movie FROM movies
GROUP BY rating



-- 13. Multiple column aggregation
SELECT rating, sci_fi_type, count(*) num_movie, min(metascore), max(metascore) 
FROM movies
GROUP BY rating, sci_fi_type;



-- HAVING clause

-- 14. Show all director who has more than 2 films
SELECT directors, count(*) num_movie
FROM movies
GROUP BY directors 
HAVING count(*) > 2
ORDER BY count(*) DESC



-- WHERE clause

-- 15. Numerical selection - show sci fi movie that has good rating
SELECT * FROM movies
WHERE metascore > 70 and sci_fi_type = 1



-- 16. Numerical selection - show sci fi movie that has good rating
SELECT * FROM movies
WHERE rating = 'GOOD' and substr(release_date, 8, 4) = '1990'



-- 17. show all Tom Hanks movies using LIKE
SELECT *  FROM movies
WHERE actors LIKE '%Tom Hanks%';



-- 18. Show all recommended movie to watch using IN
SELECT movie_title FROM movies
WHERE rating IN ('GOOD', 'EXCELLENT');






