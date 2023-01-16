SELECT * FROM total_cost
WHERE total_cost IN ((SELECT MIN(total_cost) FROM total_cost), (SELECT MAX(total_cost) FROM total_cost))
ORDER BY total_cost, tour;



-- WITH t AS
-- (
--     WITH RECURSIVE _n AS
--        (
--            SELECT
--                point1,
--                point2,
--                cost,
--                1 AS level,
--                array[point1] AS path,
--                FALSE AS cycle,
--                array[cost] AS costs
--             FROM tours
--             WHERE tours.point1 = 'a'
--             UNION ALL
--             SELECT
--                 tours.point1,
--                 tours.point2,
--                 tours.cost + _n.cost AS cost,
--                 _n.level + 1 AS level,
--                 _n.path || tours.point1 AS path,
--                 tours.point1 = ANY (_n.path) AS cycle,
--                 _n.costs || tours.cost AS costs
--             FROM tours
--             JOIN _n ON _n.point2 = tours.point1 AND NOT cycle
--         )
--     SELECT
--         cost - costs[5] AS total_cost,
--         path AS tour
--     FROM _n
--     WHERE level = 5 AND
--           'a' = ANY(path) AND
--           'b' = ANY(path) AND
--           'c' = ANY(path) AND
--           'd' = ANY(path) AND
--           path[1] = path[5]
--     ORDER BY cost, path
-- )
-- SELECT DISTINCT * FROM t
-- WHERE total_cost = (SELECT MIN(total_cost) FROM t) OR total_cost = (SELECT MAX(total_cost) FROM t)
-- ORDER BY total_cost, tour;