-- Simple, remove the spaces from the string, then return the resultant string.
SELECT x, REPLACE(x, ' ', '') as res FROM nospace;

--
TRIM(REPLACE(x, ' ', ''))

--
trim(regexp_replace(x, '[\s+]', '', 'g'))
