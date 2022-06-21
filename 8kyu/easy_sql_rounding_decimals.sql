-- Given the following table 'decimals':

-- ** decimals table schema **

--     id
--     number1
--     number2

-- Return a table with two columns (number1, number2), 
-- the value in number1 should be rounded down and the 
-- value in number2 should be rounded up.
SELECT 
  FLOOR(d.number1) as number1,
  CEILING(d.number2) as number2
FROM decimals d

