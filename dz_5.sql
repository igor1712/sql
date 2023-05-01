use dz_5;

CREATE TABLE  cars
( 
	id int PRIMARY KEY, 
	name VARCHAR(25), 
	cost int	
);
INSERT INTO cars (id, name,	cost)
VALUES
(1, 'Audi', 52642), 
(2, 'Mercedes', 57127), 
(3, 'Skoda', 9000), 
(4, 'Volvo', 29000), 
(5, 'Bentley', 350000), 
(6, 'Citroen', 21000), 
(7, 'Hummer', 41400), 
(8, 'Volkswagen', 21600);

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

create view car as select *
from cars
where cost < 25000;


-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

alter view car as select *
from cars
where cost < 30000;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

create view car_1 as select *
from cars
where name ='Skoda' or name ='Audi';




CREATE TABLE  Analysis
( 
	an_id int PRIMARY KEY, 
	an_name VARCHAR(25), 
	an_cost int,
    an_price int, 
    an_group VARCHAR(25)
	
);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES
(1, 'Audi', 52642, 120000, 'один'), 
(2, 'Mercedes', 57127, 12000, 'два'), 
(3, 'Skoda', 9000, 105000, 'три'), 
(4, 'Volvo', 29000,11000, 'три'), 
(5, 'Bentley', 350000, 150000, 'один'), 
(6, 'Citroen', 21000,60000, 'три'), 
(7, 'Hummer', 41400, 105000, 'два'), 
(8, 'Volkswagen', 21600, 50000, 'один');

CREATE TABLE  Groupss
( 
	gr_id int PRIMARY KEY, 
	gr_name VARCHAR(25), 
    gr_temp double
	
);
INSERT INTO Groupss (gr_id, gr_name, gr_temp)
VALUES
(1, 'один', 20.0), 
(2, 'два', 20.0), 
(3, 'три', 15.0), 
(4, 'семь', 20.0), 
(5, 'пять', 20.0), 
(6, 'восемь', 15.0), 
(7, 'шесть', 15.0), 
(8, 'четыре', 10.0);

CREATE TABLE  Orders
( 
	ord_id int PRIMARY KEY, 
	ord_datetime datetime, 
    ord_an int
	
);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES
(1, '2008-02-05 10:37:22', 1), 
(2, '2008-02-05 12:37:22', 2), 
(3, '2008-02-05 14:30:22', 3), 
(4, '2008-02-06 10:37:22', 4), 
(5, '2008-02-06 19:40:22', 5), 
(6, '2008-02-07 10:37:22', 6), 
(7, '2008-02-07 13:30:22', 7), 
(8, '2008-02-07 15:35:22', 8);


select an_name, an_price, ord_datetime
from Analysis
join Orders
on Analysis.an_id = Orders.ord_id
and Orders.ord_datetime >= '2008-02-05'
and Orders.ord_datetime <= '2008-02-12';














CREATE TABLE  trip
( 
	train_id int, 
	station VARCHAR(25),
    time_station time
	
);
INSERT INTO trip (train_id, station, time_station)
VALUES
(110, 'san francisco', '10:00:00'), 
(110, 'redwoo city', '10:54:22'), 
(110, 'palo alta', '11:02:22'), 
(110, 'san jose', '12:35:00'), 
(120, 'san francisco', '11:00:00'), 
(120, 'palo alta', '12:49:00'), 
(120, 'san jose', '13:30:00');

select *,
subtime(lead(time_station) over(partition by train_id order by train_id), time_station) 
AS time_to_next_station
from trip;