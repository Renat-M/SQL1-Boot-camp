CREATE VIEW amount AS (WITH tab1 AS (SELECT person_id, pizzeria_id
FROM person_order JOIN menu ON menu.id = person_order.menu_id ORDER BY 1)

SELECT person_id, pizzeria_id, COUNT(*) AS amount_of_orders
FROM tab1 GROUP BY person_id, pizzeria_id ORDER BY 1);

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER(ORDER BY 1) AS id, person_id, pizzeria_id,
    CASE
        WHEN amount_of_orders = 1 THEN 10.5
        WHEN amount_of_orders = 2 THEN 22
        ELSE 30
    END AS discount
FROM amount;