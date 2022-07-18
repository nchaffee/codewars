-- https://www.codewars.com/kata/580d08b5c049aef8f900007c
-- Overview

-- For this kata we will be using the DVD Rental database.

-- You are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that returns the top 10 customers by total amount spent ordered from highest to lowest. Total number of payments has also been requested.

-- The query should output the following columns:

--     customer_id [int4]
--     email [varchar]
--     payments_count [int]
--     total_amount [float]

-- and has the following requirements:
-- only returns the 10 top customers, ordered by total amount spent from highest to lowest
SELECT 
  customer.customer_id as customer_id, 
  customer.email as email, 
  COUNT(payment_id) as payments_count, 
  SUM(payment.amount)::float as total_amount 
FROM customer 
INNER JOIN payment ON customer.customer_id = payment.customer_id GROUP BY customer.customer_id
ORDER BY total_amount DESC
LIMIT 10;

-- nested select, more explicit
select customer_id, email, payments_count, total_amount from (
select
  customer.customer_id
  , customer.email
  , count(payment.payment_id) as payments_count
  , cast(sum(payment.amount) as float) as total_amount
  , rank() over (order by sum(payment.amount) desc) as ranking
from
  customer
  join
    payment
  on
    customer.customer_id = payment.customer_id
group by
  customer.customer_id) as t1 where t1.ranking <= 10;

-- use lateral
select 
  customer_id,
  email,
  payments_count,
  total_amount
from customer c,
lateral (
  select  
    count(payment_id) payments_count,
    sum(amount)::float as total_amount 
  from payment p
  where p.customer_id = c.customer_id
) _payment_query
order by total_amount desc
limit 10
