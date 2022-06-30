-- Given a demographics table in the following format:

-- ** demographics table schema **

--     id
--     name
--     birthday
--     race

-- you need to return the same table where all text fields 
-- (name & race) are changed to the ascii code of their first byte.

-- e.g. Verlie = 86 Warren = 87 Horace = 72 Tracy = 84
SELECT
  id,
  ascii(name) as name,
  birthday,
  ascii(race) as race
FROM demographics;

-- be careful about getting one char (i missed this when readig)
ascii(substring(a.name, 1,1)) as name,
ascii(substring(name FROM 1 FOR 1)) as name
ascii(left(name, 1)) AS name,

-- some folks is crazy
 CASE LEFT(name,1)
      WHEN 'A' THEN 65
      WHEN 'B' THEN 66
--
      WHEN 'Z' THEN 90
      END as name,
