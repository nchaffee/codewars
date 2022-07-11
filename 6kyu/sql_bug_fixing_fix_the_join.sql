-- Oh no! Timmys been moved into the database divison of his software 
-- company but as we know Timmy loves making mistakes. Help Timmy 
-- keep his job by fixing his query...

-- Timmy works for a statistical analysis company and has been given 
-- a task of calculating the highest average salary for a given job, 
-- the sample is compiled of 100 applicants each with a job and a 
-- salary. Timmy must display each unique job, the total average 
-- salary, the total people and the total salary and order by highest 
-- average salary. Timmy has some bugs in his query, help Timmy fix 
-- his query so he can keep his job!
-- people table schema

--     id
--     name

-- job table schema

--     id
--     people_id
--     job_title
--     salary

-- resultant table schema

--     job_title (unique)
--     average_salary (float, 2 dp)
--     total_people (int)
--     total_salary (float, 2 dp)
SELECT 
  j.job_title,
  ROUND(SUM(j.salary) / COUNT(p.id), 2)::FLOAT as average_salary,
  COUNT(p.id) as total_people,
  ROUND(SUM(j.salary), 2)::FLOAT as total_salary
  FROM people p
    JOIN job j ON p.id = j.people_id
  GROUP BY j.job_title
  ORDER BY average_salary DESC
  LIMIT 100
-- https://www.postgresql.org/docs/8.3/tutorial-join.html

-- fn for avg
ROUND(AVG(j.salary),2)::FLOAT as average_salary,

-- can order by returned column
 order by 2 desc

-- can cast this way too
CAST(... as FLOAT) 

-- can use to_char instead of rounding
TO_CHAR(AVG(j.salary), 'FM999999999.00')::FLOAT average_salary,

-- don't need to pick anything to count
COUNT(*)

-- don't need to specify tables when no overlap
round(avg(salary), 2)::float as average_salary,

-- ::real is float4 single precision floating-point number (4 bytes)
-- A floating-point variable can represent a wider range of numbers 
-- than a fixed-point variable of the same bit width at the cost of 
-- precision.
-- https://en.wikipedia.org/wiki/Single-precision_floating-point_format
round(SUM(salary) / COUNT(salary) * 100) / 100::real as average_salary,
