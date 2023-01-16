WITH age_stats AS
    (SELECT  address,
             ROUND(MAX(age) - CAST(MIN(age) AS DEC(5, 2)) / MAX(age), 2) AS formula,
             ROUND(AVG(age), 2) AS average
     FROM person
     GROUP BY address)

SELECT address,
       formula,
       average,
       formula > average AS comparison
FROM age_stats
ORDER BY address;

SELECT person.address,
       ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
       ROUND(AVG(age::numeric), 2) AS average,
       (CASE --comparison
           WHEN ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) > ROUND(AVG(age::numeric), 2)
           THEN TRUE ELSE FALSE END) AS comparison
        FROM person
        GROUP BY address
ORDER BY address;
