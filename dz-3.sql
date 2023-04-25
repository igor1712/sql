use dz_3;
-- таблица 1
create table SALESPEOPLE(
	snum int,
    sname varchar(25) not null,
    city varchar(25) not null
);

insert into SALESPEOPLE ( snum, sname, city)
values
		(1001, "Peel", "London"),
		(1002, "Serres", "San Jose"),
		(1004, "Motika", "London"),
		(1007, "Rifkin", "Barcelona"),
		(1003, "Axelrod", "New York");


        
-- таблица 2        
create table CUSTOMERS(
	cnum   int,
    cname   varchar(25) not null,
    city varchar(25) not null,
    rating int,
    snum int
);


insert into CUSTOMERS (cnum, cname, city, rating, snum )
values
		(2001,  "Giovanni", "Rome", 200, 1003),
		(2003,  "Liu", "SanJose", 200, 1002),
		(2004,  "Grass", "Berlin", 300, 1002),
		(2006,  "Clemens", "London", 100, 1001),
		(2008,  "Cisneros", "SanJose", 300, 1007),
		(2007,  "Pereira", "Rome", 100, 1004); 




        
-- таблица 3        
create table ORDERS(
	onum   int not null,
    amt double,
    odate date,
    cnum int,
    snum int
);

insert into ORDERS (onum, amt, odate, cnum, snum )
values
		(3001, 18.69, 19901003, 2008, 1007),
		(3003, 767.19, 19901003, 2001, 1001),
		(3002, 1900.10, 19901003, 2007, 1004),
		(3005, 5160.45, 19901003, 2003, 1002),
		(3006, 1098.16, 19901003, 2008, 1007),
		(3009, 1713.23, 19901004, 2002, 1003),
		(3007, 75.75, 19901004, 2004, 1002),
		(3008, 4723.00, 19901005, 2006, 1001),
		(3010, 1309.95, 19901006, 2004, 1002),
		(3011, 9891.88, 19901006, 2006, 1001); 
        
        
-- 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum. (к первой или второй таблице, используя SELECT)
select city, sname, snum from SALESPEOPLE;        
        
-- 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)

select rating, cname, city from CUSTOMERS where city = "SanJose"; 
      
-- 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
select distinct snum  from ORDERS;

-- 4 Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”)
select cname like"G%" as "name" from CUSTOMERS;

-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
select amt from ORDERS
where amt > 1000;

-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 -- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
 select min(amt) from ORDERS;
 
-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
select cname, city from CUSTOMERS
where rating > 100 and city != "Rome" ;



create table class_work(
	id  serial primary key,
    name varchar(25),
    sname varchar(25),
    speciality varchar(25),
    senior int,
    salary int,
    age int
);

insert into class_work (name, sname, speciality, senior, salary, age )
values
("Вася", "Васькин", "начальник", 40, 110000, 60 ),
("Петя", "Петькин", "начальник", 8, 105000, 30 ),
("Катя", "Катякина", "инженер", 2, 70000, 25 ),
("Саша", "Сашкин", "инженер", 12, 50000, 35 ),
("Иван", "Иванов", "рабочий", 40, 30000, 59 ),
("Петр", "Петров", "рабочий", 20, 25000, 40 ),
("Сидор ", "Сидоров", "рабочий", 10, 20000, 35);

-- 1 Отсортируйте поле “зарплата” в порядке убывания и возрастания
select sname, salary from class_work order by salary;
select sname, salary from class_work order by salary desc;
-- 2 ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
select sname, salary as "зп" from class_work order by salary 
limit  2, 5;

-- 3 Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
select speciality, sum(salary) as summa from class_work 
group by speciality
having summa > 100000;

