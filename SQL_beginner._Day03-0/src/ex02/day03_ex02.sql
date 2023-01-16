WITH notordered AS (SELECT id AS menu_id FROM menu
EXCEPT SELECT menu_id FROM person_order ORDER BY menu_id)

SELECT pizza_name, price, p.name as pizzeria_name FROM notordered
JOIN menu ON menu_id = menu.id
JOIN pizzeria p ON menu.pizzeria_id = p.id
ORDER BY 1, 2