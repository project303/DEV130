-- Hands-On
-- SQL Create Database and Table



-- 01. Show all databases/schemas
SHOW databases;



-- 02. Create database called bob
CREATE DATABASE IF NOT exists bob;



-- 03. Use bob schema/database
USE bob;


-- Show all tables in bob database
show tables;



-- 04. Create movies table
CREATE TABLE movies (
    movie_id         int(11)     DEFAULT NULL,
    movie_title      varchar(100) DEFAULT NULL,
    release_date     varchar(12) DEFAULT NULL,
    published_date   varchar(12) DEFAULT NULL,
    duration         smallint    DEFAULT NULL,
    rating           varchar(12) DEFAULT NULL,
    metascore        smallint    DEFAULT NULL,
    action_type      smallint    DEFAULT NULL,
    adventure_type   smallint    DEFAULT NULL,
    animation_type   smallint    DEFAULT NULL,
    children_type    smallint    DEFAULT NULL,
    comedy_type      smallint    DEFAULT NULL,
    crime_type       smallint    DEFAULT NULL,
    documentary_type smallint    DEFAULT NULL,
    drama_type       smallint    DEFAULT NULL,
    fantasy_type     smallint    DEFAULT NULL,
    horror_type      smallint    DEFAULT NULL,
    musical_type     smallint    DEFAULT NULL,
    mystery_type     smallint    DEFAULT NULL,
    romance_type     smallint    DEFAULT NULL,
    sci_fi_type      smallint    DEFAULT NULL,
    thriller_type    smallint    DEFAULT NULL,
    war_type         smallint    DEFAULT NULL,
    western_type     smallint    DEFAULT NULL,
    num_country      smallint    DEFAULT NULL,
    country          varchar(50) DEFAULT NULL,
    budget_num       varchar(30) DEFAULT NULL,
    worlwide_gross_income varchar(30)    DEFAULT NULL,
    directors        varchar(30) DEFAULT NULL,
    actors           varchar(300) DEFAULT NULL,
    language         varchar(55) DEFAULT NULL    
);



-- Show all tables in bob database
SHOW tables;




-- 05. Download movies.tsv file and load to the movies table
-- https://www.dropbox.com/s/kcdglwwhb54stma/movies.tsv



-- 06. Count total uploaded records
SELECT count(*) FROM movies;



-- 07. Show all record in movies table
select * from movies;



-- 08. Drop bob schema/database
-- DROP DATABASE bob;














