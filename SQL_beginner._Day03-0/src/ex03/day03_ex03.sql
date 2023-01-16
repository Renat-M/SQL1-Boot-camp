WITH women AS
    (SELECT pizzeria.name AS pizzeria_name FROM person_visits
     JOIN person ON person_id = person.id
     JOIN pizzeria ON pizzeria_id = pizzeria.id
     WHERE gender = 'female'),

    men AS
    (SELECT pizzeria.name AS pizzeria_name FROM person_visits
     JOIN person ON person_id = person.id
     JOIN pizzeria ON pizzeria_id = pizzeria.id
     WHERE gender = 'male')

(SELECT pizzeria_name FROM women
 EXCEPT ALL SELECT pizzeria_name FROM men)
UNION ALL
(SELECT pizzeria_name FROM men
 EXCEPT ALL SELECT pizzeria_name FROM women)
ORDER BY 1