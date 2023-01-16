SELECT name, COUNT (name) AS count_of_visits
FROM person_visits
JOIN person ON person_id = person.id
GROUP BY name HAVING COUNT(name) > 3