CREATE OR REPLACE FUNCTION fnc_fibonacci (pstop integer = 10)
       RETURNS TABLE (fibonacci integer) AS $table1$
        BEGIN
            RETURN QUERY
            WITH RECURSIVE t(a,b) AS (
            VALUES(0,1)
            UNION ALL
            SELECT greatest(a,b), a + b as b from t
            WHERE b < pstop
            )
SELECT a FROM t;
        END;
$table1$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

DROP FUNCTION fnc_fibonacci(pstop integer);