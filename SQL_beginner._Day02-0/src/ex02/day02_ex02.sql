SELECT COALESCE(person_name, '-') AS person_name, visit_date, COALESCE(pizzeria_name, '-') AS pizzeria_name
FROM (SELECT person.name AS person_name, visit_date, p.name AS pizzeria_name
      FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') as tab
      FULL JOIN person ON tab.person_id = person.id
      FULL JOIN pizzeria AS p ON tab.pizzeria_id = p.id) AS taball
ORDER BY person_name, visit_date, pizzeria_name