CREATE TABLE person_audit (
id SERIAL primary key,
created timestamp with time zone NOT NULL DEFAULT now() ,
type_event char(1) DEFAULT 'I',
row_id bigint not null,
name varchar not null,
age integer,
gender varchar,
address varchar,
constraint ch_type_event CHECK (type_event in ('I', 'D', 'U'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $trg_person_insert_audit$
    BEGIN
       INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            SELECT now(), 'I', NEW.*;
       RETURN NULL;
    END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');