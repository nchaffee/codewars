-- Calculating Batting Average
-- n baseball, the batting average is a simple and most common way to measure a hitter's performace. Batting average is calculated by taking all the players hits and dividing it by their number of at_bats, and it is usually displayed as a 3 digit decimal (i.e. 0.300).

-- Given a yankees table with the following schema,

-- -player_id STRING

-- -player_name STRING

-- -primary_position STRING

-- -games INTEGER

-- -at_bats INTEGER

-- -hits INTEGER

-- return a table with player_name, games, and batting_average.

-- We want batting_average to be rounded to the nearest thousandth, since that is how baseball fans are used to seeing it. Format it as text and make sure it has 3 digits to the right of the decimal (pad with zeroes if neccesary).

-- Next, order our resulting table by batting_average, with the highest average in the first row.

-- Finally, since batting_average is a rate statistic, a small number of at_bats can change the average dramatically. To correct for this, exclude any player who doesn't have at least 100 at bats.

-- Expected Output Table

-- -player_name STRING

-- -games INTEGER

-- -batting_average STRING
SELECT player_name,
  games,
  TRIM( -- bizarrely it puts a whitespace that must be trim-med
        to_char(cast(hits as numeric) / cast(at_bats as NUMERIC), '0D000')
      ) as batting_average
FROM yankees
WHERE at_bats > 99
ORDER BY batting_average DESC

-- use round, :: to convert
select player_name,
       games,
       round(hits::numeric / at_bats, 3)::text as batting_average
from yankees
where at_bats > 100
order by 3 desc -- 3rd field?

-- cast away
cast(cast((hits * 1.0 / at_bats) as decimal(3, 3)) as text) as batting_average

-- FM prefix	fill mode (suppress trailing zeroes and padding blanks)
to_char(hits::numeric/at_bats, 'FM0.000') AS batting_average

-- make a string, then pad
rpad(round(hits/at_bats::numeric, 3)::float::text, 5, '0') AS batting_average
