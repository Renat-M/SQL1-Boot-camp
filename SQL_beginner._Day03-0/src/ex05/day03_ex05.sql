WITH andrey_visits AS
    (SELECT pizzeria.name AS pizzeria_name
     FROM person_visits
     JOIN person ON person_id = person.id
     JOIN pizzeria ON pizzeria_id = pizzeria.id
     WHERE person.name = 'Andrey'),
    andrey_orders AS
    (SELECT pizzeria.name AS pizzeria_name
     FROM person_order
     JOIN person ON person_id = person.id
     JOIN menu ON menu_id = menu.id
     JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
     WHERE person.name = 'Andrey')

SELECT pizzeria_name FROM andrey_visits
EXCEPT
SELECT pizzeria_name FROM andrey_orders
ORDER BY 1