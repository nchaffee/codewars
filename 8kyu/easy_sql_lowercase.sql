-- Given a demographics table in the following format:

-- ** demographics table schema **

--     id
--     name
--     birthday
--     race

-- you need to return the same table where all letters are lowercase in the race column.
SELECT 
  id,
  name,
  birthday,
  lower(race) as race
FROM demographics;

-- mess with table to get better output (boo)
UPDATE demographics SET race = LOWER(race);
SELECT * FROM demographics;

-- overwrite result is better
SELECT *, 
LOWER(race) AS race  
FROM demographics
