-- Given a table of random numbers as follows:
-- numbers table schema

--     id
--     number1
--     number2

-- Your job is to return table with similar structure and headings, where if the sum of a column is odd, the column shows the minimum value for that column, and when the sum is even, it shows the max value. You must use a case statement.
-- output table schema

--     number1
--     number2

SELECT 
CASE
WHEN SUM(number1) % 2 = 0 THEN MAX(number1)
ELSE MIN(number1)
END number1,
CASE
WHEN SUM(number2) % 2 = 0 THEN MAX(number2)
ELSE MIN(number2)
END number2
FROM numbers;

-- solution by FeNoM makes a fn
DROP FUNCTION IF EXISTS getValue(BIGINT, INTEGER, INTEGER);

CREATE FUNCTION getValue(sumValue BIGINT, minValue INTEGER, maxValue INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN
        CASE
            WHEN sumValue % 2 = 1 THEN minValue
            ELSE maxValue
        END;
END; 
$$ LANGUAGE plpgsql;

SELECT
    getValue(SUM(number1), MIN(number1), MAX(number1)) AS number1
    , getValue(SUM(number2), MIN(number2), MAX(number2)) AS number2
FROM
    numbers