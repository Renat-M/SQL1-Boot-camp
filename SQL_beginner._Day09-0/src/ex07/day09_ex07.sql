create or replace function fnc_minimum (VARIADIC arr numeric[])
    RETURNS numeric AS $$
        SELECT min($1[i]) FROM generate_subscripts($1, 1) g(i);
$$ LANGUAGE SQL;

SELECT fnc_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

DROP FUNCTION fnc_minimum(arr numeric[]);