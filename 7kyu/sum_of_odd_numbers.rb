# Given the triangle of consecutive odd numbers:

#              1
#           3     5
#        7     9    11
#    13    15    17    19
# 21    23    25    27    29
# ...

# Calculate the sum of the numbers in the nth row of this triangle (starting at index 1) e.g.: (Input --> Output)

# 1 -->  1
# 2 --> 3 + 5 = 8
# i have no idea but i must have just worked it out from the row numbers & length
SELECT (
    ((n * (n - 1) + 1) * n) + (((n*(n+1)/2) - n) * 2)
)
as res
FROM nums

# if you know the math conceptually
SELECT POWER(n, 3)::int as res from nums;
select (n^3)::int as res

# create a fn
CREATE FUNCTION rowSumOddNumbers(n integer)
 RETURNS integer AS $$
DECLARE
   i INTEGER := 0 ; 
   j INTEGER := 0 ; 
BEGIN
   FOR counter IN REVERSE n..2 LOOP
     i =  (counter - 1) + i ;
   END LOOP;
   
  FOR counter IN i+1..i+n LOOP
     j =  (2*counter - 1) + j ;
   END LOOP;
   RETURN j;
END;
$$ LANGUAGE plpgsql;

SELECT rowSumOddNumbers(n) AS res
FROM nums

# use variables? labels
with start_end as
(
select
  n as n,
  (n-1)*(n) + 1 as starting_number,
  (n-1)*(n) + 1 + (n-1)*2 as end_number
from nums
)
select 
  (end_number + starting_number)/2 * n as res 
from start_end

