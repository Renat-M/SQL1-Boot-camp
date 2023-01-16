INSERT INTO person_visits
VALUES
    ((SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'),
    ((SELECT MAX(id) + 2 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24')

-- DELETE FROM person_visits Where visit_date = '2022-02-24'