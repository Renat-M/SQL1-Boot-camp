COMMENT ON TABLE person_discounts IS
    'This is a table with person discount for each pizzeria';
COMMENT ON COLUMN person_discounts.id IS
    'This is the primary key of the table';
COMMENT ON COLUMN person_discounts.person_id IS
    'This is the person id';
COMMENT ON COLUMN person_discounts.pizzeria_id IS
    'This is the pizzeria id';
COMMENT ON COLUMN person_discounts.discount IS
    'This is the discount for every person in every pizzeria, where he ordered';

