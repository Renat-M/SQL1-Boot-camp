SELECT pizzeria.name FROM person_visits
JOIN person ON person_id = person.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND menu.price < 800
