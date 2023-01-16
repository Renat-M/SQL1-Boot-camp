CREATE SEQUENCE seq_person_discounts
MINVALUE 1 START WITH 1 INCREMENT BY 1;

SELECT SETVAL('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');