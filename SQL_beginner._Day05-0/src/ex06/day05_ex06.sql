CREATE INDEX idx_1 ON pizzeria (rating);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

Drop index if exists idx_menu_pizzeria_id, idx_person_visits_person_id, idx_person_visits_pizzeria_id,
    idx_person_order_person_id, idx_person_order_menu_id, idx_person_name, idx_person_order_multi,
    idx_menu_unique, idx_person_order_order_date, idx_1;