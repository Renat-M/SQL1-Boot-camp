WITH dmitriy_visited AS
        (SELECT menu.pizzeria_id AS pizzeria_id FROM person_visits
        JOIN person ON person.id = person_id
        JOIN pizzeria on pizzeria_id = pizzeria.id
        JOIN menu on pizzeria.id = menu.pizzeria_id
        WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800)

INSERT INTO person_visits VALUES (
       (SELECT MAX(id) + 1 FROM person_visits),
       (SELECT id FROM person WHERE name ='Dmitriy'),
       (SELECT pizzeria_id FROM menu JOIN pizzeria on menu.pizzeria_id = pizzeria.id WHERE price < 800
        AND pizzeria_id NOT IN (SELECT pizzeria_id FROM dmitriy_visited) LIMIT 1),
       '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- DELETE FROM person_visits WHERE id = 20