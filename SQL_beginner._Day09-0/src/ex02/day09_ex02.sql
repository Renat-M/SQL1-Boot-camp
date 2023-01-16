CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS $trg_person_delete_audit$
    BEGIN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
                SELECT now(), 'D', OLD.*;
       RETURN NULL;
    END;
$trg_person_delete_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
--DROP TRIGGER trg_person_delete_audit ON person;