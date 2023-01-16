SELECT name, rating
FROM (SELECT * FROM pizzeria
LEFT JOIN person_visits AS pv on pizzeria.id = pv.pizzeria_id) AS tab
WHERE pizzeria_id IS NULL