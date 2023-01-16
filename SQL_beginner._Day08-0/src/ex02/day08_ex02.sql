BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; --session1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; --session2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --session1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --session2
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; --session1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --session2
COMMIT; --session1
COMMIT; --session2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --session1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --session2