-- GROCERY STORE: Support Local Products
-- You care about local market, and want to check how many products come from United States of America or Canada.

-- Please use SELECT statement and IN to filter out other origins.

-- In the results show how many products are from United States of America and Canada respectively.

-- Order by number of products, descending.
-- products table schema

--     id
--     name
--     price
--     stock
--     producer
--     country

-- results table schema

--     products
--     country

SELECT 
COUNT(id) as products,
country
FROM products
WHERE country IN ('Canada', 'United States of America')
GROUP BY country
ORDER BY products DESC;