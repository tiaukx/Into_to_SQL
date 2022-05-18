create database if not exists amazon;
use amazon;

create table customer (
cust_id int unique not null auto_increment,
cust_name varchar(100) not null,
cust_addr varchar(200) not null,
card_no int unique not null,
primary key (cust_id)
);

show tables;

create table orders (
order_id int unique not null auto_increment,
fk_cust_id int not null, 
order_total decimal(6,2) default 0.00,
order_date datetime default current_timestamp,
primary key(order_id),
foreign key(fk_cust_id) references customer(cust_id)
);

describe customer;
describe orders;

insert into customer(cust_name, cust_addr, card_no)
values('Tia', '123 Easy Street', 1234),
('Moogle', '123 Easy Street', 4567),
('Mickey', '123 Easy Street', 7891);

insert into customer(cust_name, cust_addr, card_no)
values('Bob', '456 Lazy Street', 2345),
('Jim', '729 Confused Lane', 9678);

select * from customer;

insert into orders(fk_cust_id)
values(1), (2), (3), (4), (5);

select * from orders;

create table items (
item_id int unique not null auto_increment,
item_name varchar(200) not null,
price decimal(6,2) not null,
stock int not null default 0,
primary key (item_id)
);

insert into items(item_name, price, stock)
values('Mug', 5.00, 5),
('Pencil', 2.00, 10),
('Pen', 3.00, 8),
('Notepad', 7.00, 15);

insert into items(item_name, price)
values('Eraser', 1.00);

select * from items;

create table order_items (
oi_id int unique not null auto_increment,
fk_order_id int not null, 
fk_item_id int not null, 
quantity int default 0,
orderline_total decimal(6,2) default 00.00,
primary key(oi_id),
foreign key(fk_order_id) references orders(order_id),
foreign key(fk_item_id) references items(item_id)
);

select * from order_items;

insert into order_items (fk_order_id, fk_item_id, quantity, orderline_total)
values (1, 1, 2, 10.00);

insert into order_items (fk_order_id, fk_item_id)
values (1, 1);

insert into order_items (fk_order_id, fk_item_id)
values (2, 1);

insert into order_items (fk_order_id, fk_item_id, quantity, orderline_total)
values (2, 3, 2, 6.00);

insert into order_items (fk_order_id, fk_item_id, quantity, orderline_total)
values (3, 2, 3, 6.00),
(4, 4, 5, 28.00);

insert into order_items (fk_order_id, fk_item_id, quantity, orderline_total)
values (5, 1, 3, 15.00),
(4, 5, 0, 00.00);

insert into order_items (fk_order_id, fk_item_id, quantity, orderline_total)
values (3, 3, 4, 12.00);

insert into order_items (fk_order_id, fk_item_id)
values (5, 5);

select * from orders o join customer c on o.fk_cust_id join order_items oi on oi.fk_order_id=o.order_id join items i on oi.fk_item_id=i.item_id;

#select o.order_id, c.cust_name, c.cust_addr, i.item_name, i.price, oi.quantity, from orders o join customer c on o.fk_cust_id=c.cust_id join order_items oi on oi.fk_order_id;

#Aggregate functions
select sum(stock) from items;	#counts total number of items in stock
select min(stock) from items; 	#returns the smallest stock number we have
select max(stock) from items; 	#returns the maximum stock number we have
select avg(stock) from items; 	#returns the average for number of items in stock
select count(stock) from items; #counts the number of items we have stock for

#Nested queries - wuery within a query - select within a select
select fk_cust_id from orders where order_id=2;
select * from customer where cust_id=5;

#the above queries can be combined (2nd query + 1st query above)
select * from customer where cust_id=(select fk_cust_id from orders where order_id=2);

#States what the item from order_id number that equals 2
select fk_item_id from order_items where oi_id=2;
select * from items where item_id = 1;

select * from items where item_id =(select fk_item_id from order_items where oi_id=2);

#know customer id number but nothing else and wants to know what their item is
select * from customer where cust_id=1;
select * from orders where fk_cust_id=1;
select * from order_items where fk_order_id=2;
select * from items where item_id =3;

select * from items where item_id=(select fk_item_id from order_items where fk_order_id=(select order_id from orders where fk_cust_id=1) limit 1);


