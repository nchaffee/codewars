-- to hexYou have access to a table of monsters as follows:
-- monsters table schema

--     id
--     name
--     legs
--     arms
--     characteristics

-- Your task is to turn the numeric columns (arms, legs) into equivalent hexadecimal values.
-- output table schema

--     legs
--     arms
SELECT to_hex(arms) as arms, to_hex(legs) as legs from monsters;

-- someone made a whole function
create or replace function hex(number integer)returns varchar(8) language plpgsql as $$
declare s varchar(8);
BEGIN
  s:=substr('0123456789abcdef',1+(number % 16),1);
  if number>=16 then return concat(hex(number/16),s);end if;
  return s;
END
$$
;
select hex(legs) as legs,hex(arms) as arms from monsters

-- refine with cast
CAST(to_hex(legs) AS varchar(8))  AS legs, 
