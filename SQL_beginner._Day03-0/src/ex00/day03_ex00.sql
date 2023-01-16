SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM person_visits
JOIN person ON person_id = person.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
WHERE person.name = 'Kate' AND menu.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3