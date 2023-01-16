WITH tab1(id1, person_name1, address1, id2, person_name2, address2) AS
    (SELECT * FROM
        (SELECT id, name, address FROM person) AS tab2
         FULL JOIN
        (SELECT id, name, address FROM person) AS tab3
         ON tab2.address = tab3.address AND tab2.name != tab3.name
    )

SELECT person_name1, person_name2, address1 AS common_address
FROM tab1
WHERE id1 > id2
ORDER BY person_name1, person_name2