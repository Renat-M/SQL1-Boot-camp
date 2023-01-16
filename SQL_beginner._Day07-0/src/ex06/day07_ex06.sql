SELECT pizzeria.name,
       COUNT (pizzeria.name) AS count_of_orders,
       ROUND(AVG(menu.price), 2) AS average_price,
       MAX(menu.price) AS max_price,
       MIN(menu.price) AS min_price
FROM person_order
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 1;