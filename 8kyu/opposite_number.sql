-- Very simple, given an integer or a floating-point number, find its opposite.

-- Examples:

-- 1: -1
-- 14: -14
-- -34: 34

-- You will be given a table: opposite, with a column: number. 
-- Return a table with a column: res.
SELECT number * -1 as res FROM opposite;

-- #
-number

-- #
ALTER TABLE opposite ADD COLUMN res INT;

UPDATE opposite SET res = (number * -1);

SELECT res
FROM opposite;

-- #
SELECT 100-(100+number) res FROM opposite

-- #
SELECT number/-1 AS res FROM opposite;
