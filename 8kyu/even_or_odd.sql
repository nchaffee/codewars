-- You will be given a table, numbers, with one column number.

-- Return a table with a column is_even containing "Even" or "Odd" depending on number column values.
-- numbers table schema

--     number INT

-- output table schema

--     is_even STRING
SELECT
  CASE n.number % 2
    WHEN 0 THEN 'Even'
    ELSE 'Odd'
    END as is_even
FROM numbers n

-- #
CASE WHEN Mod(number,2) = 0 THEN 'Even'

--
CREATE OR REPLACE FUNCTION even (i int)
RETURNS text AS $$
DECLARE
tmp int;
BEGIN
tmp := i % 2;
IF tmp = 0 THEN RETURN 'Even';
ELSE RETURN 'Odd';
END IF;
END;
$$ LANGUAGE plpgsql;
Select even(number) as is_even from numbers;

-- <> means not equal to
WHEN MOD(number, 2) <> 0 THEN 'Odd'

--
WHEN mod(abs(number),2)= 0 THEN 'Even'
