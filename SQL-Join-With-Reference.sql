-- Hands-On
-- SQL Join With Reference




-- 01. Use your own schema /database
USE bob;



-- 02. Create reference table
DROP TABLE IF EXISTS ref_rating;


CREATE TABLE ref_rating (
    rating varchar(12),
    star   int
);


SHOW tables;



-- 03. Insert content to ref_rating table, based on rating column value
SELECT distinct(rating) from tmp_movies;

INSERT INTO ref_rating VALUES ('WORST', 1);
INSERT INTO ref_rating VALUES ('BAD', 2);
INSERT INTO ref_rating VALUES ('AVERAGE', 3);
INSERT INTO ref_rating VALUES ('GOOD', 4);
INSERT INTO ref_rating VALUES ('EXCELLENT', 5);

select * from ref_rating;



-- 04. Inner join
SELECT m.movie_title, m.rating, r.star
FROM tmp_movies m
JOIN ref_rating r ON m.rating = r.rating

-- count number of record after join
SELECT count(*) from (
SELECT m.movie_title, m.rating, r.star
FROM tmp_movies m
JOIN ref_rating r ON m.rating = r.rating
) a;

select count(*) from tmp_movies;



-- 05. Left join
SELECT m.movie_title, m.rating, r.star
FROM tmp_movies m
LEFT JOIN ref_rating r ON m.rating = r.rating;


SELECT count(*) from (
SELECT m.movie_title, m.rating, r.star
FROM tmp_movies m
LEFT JOIN ref_rating r ON m.rating = r.rating
) a;



