-- Given the following table 'decimals':

-- ** decimals table schema **

--     id
--     number1
--     number2

-- Return a table with two columns (root, log) where the values in root are the square root of those provided in number1 and the values in log are changed to a base 10 logarithm from those in number2.
SELECT
  SQRT(number1) as root,
  LOG(number2) as log
FROM decimals;

-- leaning tower of pipa and other alternatives
|/ number1 as root,
(number1 ^ .5) as root,
power(number1, 0.5) as root,
sqrt(number1)::FLOAT as root

-- i guess dividing by log(10) resolves something
LOG(number2)/LOG(10) as log
log10(number2) as log


