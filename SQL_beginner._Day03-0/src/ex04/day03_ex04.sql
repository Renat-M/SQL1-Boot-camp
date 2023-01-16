WITH women AS
    (SELECT pizzeria.name AS pizzeria_name FROM person_order
     JOIN person ON person_id = person.id
     JOIN menu ON menu_id = menu.id
     JOIN pizzeria ON pizzeria_id = pizzeria.id
     WHERE gender = 'female'),

    men AS
    (SELECT pizzeria.name AS pizzeria_name FROM person_order
     JOIN person ON person_id = person.id
     JOIN menu ON menu_id = menu.id
     JOIN pizzeria ON pizzeria_id = pizzeria.id
     WHERE gender = 'male')

(SELECT pizzeria_name FROM women
 EXCEPT SELECT pizzeria_name FROM men)
UNION
(SELECT pizzeria_name FROM men
 EXCEPT SELECT pizzeria_name FROM women)
ORDER BY 1