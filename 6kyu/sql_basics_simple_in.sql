-- SQL Basics: Simple IN

-- For this challenge you need to create a SELECT statement, this SELECT statement will use an IN to check whether a department has had a sale with a price over 98.00 dollars.
-- departments table schema

--     id
--     name

-- sales table schema

--     id
--     department_id (department foreign key)
--     name
--     price
--     card_name
--     card_number
--     transaction_date

-- resultant table schema

--     id
--     name

SELECT * FROM departments
WHERE id IN (
  SELECT department_id FROM sales WHERE price >= 98.00
)

-- using single letter abbreviations for tables

SELECT *
  FROM departments d
  WHERE d.id IN (
      SELECT s.department_id
        FROM sales s
          WHERE s.price > 98.00
  )

-- https://www.sqltutorial.org/sql-subquery/
