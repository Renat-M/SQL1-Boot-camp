WITH pepperoni_cte(name) AS
    (SELECT name FROM person_order
                 JOIN person ON person_id = person.id
                 JOIN menu ON menu_id = menu.id
                 WHERE gender = 'female' AND pizza_name = 'pepperoni pizza'),

    cheese_cte(name) AS
    (SELECT name FROM person_order
                 JOIN person ON person_id = person.id
                 JOIN menu ON menu_id = menu.id
                 WHERE gender = 'female' AND pizza_name = 'cheese pizza')

SELECT name FROM pepperoni_cte WHERE name IN (SELECT name FROM cheese_cte)
ORDER BY name