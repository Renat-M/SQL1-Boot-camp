BEGIN; --session1
BEGIN; --session2
UPDATE pizzeria SET name = 'ASDF' WHERE id = 1; --session1
UPDATE pizzeria SET name = 'ASDF!' WHERE id = 2; --session2
UPDATE pizzeria SET name = 'ASDF!!!' WHERE id = 2; --session1
UPDATE pizzeria SET name = 'ASDF!!!!!' WHERE id = 1; --session2
COMMIT; --session1
COMMIT; --session2