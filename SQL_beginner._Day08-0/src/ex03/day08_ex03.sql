BEGIN; -- session1
BEGIN; -- session2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- session1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --session2;
COMMIT; --session2;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- session1
COMMIT; --session1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- session1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- session2