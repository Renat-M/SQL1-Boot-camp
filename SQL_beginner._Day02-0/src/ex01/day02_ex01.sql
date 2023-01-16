SELECT missing_date::date FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
FULL JOIN
(SELECT * FROM person_visits WHERE person_id = 1 OR person_id = 2 AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS tab
ON visit_date = missing_date  WHERE tab.person_id IS NULL ORDER BY missing_date