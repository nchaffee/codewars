-- Given a table of random numbers as follows:

-- ** numbers table schema **

--     id
--     number1
--     number2
--     number3
--     number4
--     number5

-- Your job is to return a table in the following format, 
-- where each value is the number of bytes in the string 
-- representation of the number.

-- ** output table schema **

--     octnum1
--     octnum2
--     octnum3
--     octnum4
--     octnum5

-- See expected results for more clarity if required.
SELECT
LENGTH (CAST(number1 as text)) as octnum1,
LENGTH (CAST(number2 as text)) as octnum2,
LENGTH (CAST(number3 as text)) as octnum3,
LENGTH (CAST(number4 as text)) as octnum4,
LENGTH (CAST(number5 as text)) as octnum5
FROM numbers

-- many ways to get
octet_length(number1::text) as octnum1,
octet_length(number1::VARCHAR) AS octnum1,
length(number1||'') "octnum1",
ceil(log(number1+1))::int AS octnum1,
CHAR_LENGTH(SUBSTRING(TO_CHAR(number1, '9999999999') FROM '[0-9]{1,9}')) AS octnum1,
bit_length(number1::text)/8 AS octnum1
(floor(log10(number1))+1)::integer as octnum1,
(bit_length( quote_literal(number1) )/8)-2 AS octnum1,

-- make a whole fn
create or replace function numcon(holder float) returns int
as
$$
begin
return octet_length(cast(holder as varchar));
end;
$$ language plpgsql;

select 
numcon(number1) as octnum1,
