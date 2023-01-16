WITH TAB_CTE (pizza_name, pizzeria_name) AS
    (SELECT pizza_name, pizzeria.name AS pizzeria_name
     FROM person_order
     JOIN person ON person_id = person.id
     JOIN menu ON menu_id = menu.id
     JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
     WHERE person.name = 'Anna' OR person.name = 'Denis')

SELECT pizza_name, pizzeria_name
FROM TAB_CTE
ORDER BY pizza_name, pizzeria_name