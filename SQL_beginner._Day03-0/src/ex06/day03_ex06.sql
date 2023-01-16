WITH full_menu AS
(SELECT pizza_name, name, price, pizzeria_id
 FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)

SELECT m1.pizza_name AS pizza_name, m1.name AS pizzeria_name1, m2.name AS pizzeria_name2, m1.price AS price
FROM full_menu m1
JOIN full_menu m2 on m1.pizzeria_id > m2.pizzeria_id AND m1.pizza_name = m2.pizza_name AND m1.price = m2.price
ORDER BY pizza_name;
