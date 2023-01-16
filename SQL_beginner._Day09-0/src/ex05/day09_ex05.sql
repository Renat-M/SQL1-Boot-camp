CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar = 'female')
RETURNS TABLE (id bigint,
name varchar,
age integer,
gender varchar,
address varchar)
    AS $$ SELECT *
    FROM person WHERE pgender = gender
   $$
LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();