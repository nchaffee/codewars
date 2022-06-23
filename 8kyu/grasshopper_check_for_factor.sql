-- This function should test if the factor is a factor of base.

-- Return true if it is a factor or false if it is not.
-- About factors

-- Factors are numbers you can multiply together to get another number.

-- 2 and 3 are factors of 6 because: 2 * 3 = 6

--     You can find a factor by dividing numbers. If the remainder is 0 
-- then the number is a factor.
--     You can use the mod operator (%) in most languages to check for 
-- a remainder

-- For example 2 is not a factor of 7 because: 7 % 2 = 1

-- Note: base is a non-negative number, factor is a positive number.
SELECT id, (base % factor = 0) as res FROM kata

-- cast to boolean
select id,
case
  when base % factor = 0 then 'true'::boolean
  else 'false'::boolean
end as res from kata

-- make an entire fn
CREATE OR REPLACE FUNCTION is_divisible(factor1 INT, base1 INT)
RETURNS BOOLEAN AS $$
BEGIN
  IF base1 % factor1 = 0 THEN RETURN TRUE;
  ELSE RETURN FALSE;
  END IF;
END $$ LANGUAGE plpgsql;

SELECT id, is_divisible(factor,base) AS res
FROM kata
