-- SQL Basics: Simple FULL TEXT SEARCH

-- For this challenge you need to create a simple SELECT statement. 
-- Your task is to create a query and do a FULL TEXT SEARCH. 
-- You must search the product table on the field name for the 
-- word Awesome and return each row with the given word. 
-- Your query MUST contain to_tsvector and to_tsquery 
-- PostgreSQL functions.

-- The main building blocks for FTS in PG (Postgres) are:

--     tsvector, which represents a searchable document
--     tsquery, which is the search query to perform against a document

SELECT * 
FROM product
WHERE to_tsquery('Awesome') @@ to_tsvector(product.name);

-- seems the order is usually query last
SELECT * 
  FROM product
  WHERE TO_TSVECTOR(name) @@ TO_TSQUERY('Awesome');

-- you can also specify the lang
select * from product
where to_tsvector('english', product.name) @@ to_tsquery('english', 'awesome')

-- use tilda
select * from product where name ~ 'Awesome' -- to_tsvector to_tsquery

-- say the silent part out loud
SELECT *
FROM product 
WHERE to_tsvector(name) @@ to_tsquery('Awesome')=true

-- use fancy structure, subquery
SELECT 
      x.id
      ,x.name
      ,x.price
FROM
(
  SELECT 
    id
    ,name
    ,price
    ,to_tsvector(name) @@ to_tsquery('awesome') ContainsAwesome
  FROM Product
)x
Where ContainsAwesome = true

-- example using rank
SELECT 
    courses.id,
    courses.title,
    courses.description,
    ts_rank(to_tsvector(courses.title), query) as rank_title,
    ts_rank(to_tsvector(courses.description), query) as rank_description
FROM 
    courses, 
    to_tsvector(courses.title || courses.description) document,
    to_tsquery('sales') query
WHERE query @@ document
ORDER BY rank_description, rank_title DESC
