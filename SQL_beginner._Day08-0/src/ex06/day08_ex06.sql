BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; --session1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; --session2
SELECT SUM(rating) FROM pizzeria; --session1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; --session2;
COMMIT; --session2
SELECT SUM(rating) FROM pizzeria; --session1
COMMIT; --session1
SELECT SUM(rating) FROM pizzeria; --session1
SELECT SUM(rating) FROM pizzeria; --session2