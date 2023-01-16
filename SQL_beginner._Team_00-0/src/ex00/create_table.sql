CREATE TABLE tours
	(point1 varchar not null ,
 	point2 varchar not null ,
 	cost int not null);

INSERT INTO tours VALUES ('a', 'b', 10);
INSERT INTO tours VALUES ('b', 'a', 10);
INSERT INTO tours VALUES ('a', 'd', 20);
INSERT INTO tours VALUES ('d', 'a', 20);
INSERT INTO tours VALUES ('a', 'c', 15);
INSERT INTO tours VALUES ('c', 'a', 15);
INSERT INTO tours VALUES ('b', 'c', 35);
INSERT INTO tours VALUES ('c', 'b', 35);
INSERT INTO tours VALUES ('d', 'b', 25);
INSERT INTO tours VALUES ('b', 'd', 25);
INSERT INTO tours VALUES ('d', 'c', 30);
INSERT INTO tours VALUES ('c', 'd', 30);

-- DROP TABLE IF EXISTS tours;