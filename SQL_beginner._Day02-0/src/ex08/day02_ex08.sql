SELECT person.name FROM person_order
JOIN person ON person_id = person.id
JOIN menu ON menu_id = menu.id
WHERE (address = 'Moscow' OR address = 'Samara') AND (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza')
AND gender = 'male'
ORDER BY name DESC