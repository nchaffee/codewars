SELECT 
  customer.customer_id as customer_id, 
  customer.email as email, 
  COUNT(payment_id) as payments_count, 
  SUM(payment.amount)::float as total_amount 
FROM customer 
INNER JOIN payment ON customer.customer_id = payment.customer_id GROUP BY customer.customer_id
ORDER BY total_amount DESC
LIMIT 10;