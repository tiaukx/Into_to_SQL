create database if not exists mcdonalds;
show databases;
use mcdonalds; 

create table McMenu (
menu_id int unique not null auto_increment,
menu_product varchar(100) not null,
menu_price decimal(6,2) not null,
menu_description varchar(255) default 'Doesnt matter, tastes good',
menu_availability boolean not null,
menu_nutritional_value decimal(6,2) not null,
primary key (menu_id)
);

insert into McMenu (menu_product, menu_price, menu_description, menu_availability, menu_nutritional_value)
values ('BigMac', 4.99, 'Its greasy but youre hungry', 1, 849.59),
('Fries', 1.99, 'Salty goodness', 1, 250.30),
('Apple Pie', 0.99, 'Sweet and crunchy', 0, 350.79),
('Lemonade', 1.29, 'Cool and refreshing', 1, 262.49),
('Ketchup', 0.69, 'Its ketchup, what else do you want', 1, 84.02);

#Accidentally creates all items twice
delete from McMenu where menu_id=1;
delete from McMenu where menu_id=6;
delete from McMenu where menu_id=7;
delete from McMenu where menu_id=8;
delete from McMenu where menu_id=9;
delete from McMenu where menu_id=10;

insert into McMenu (menu_product, menu_price, menu_availability, menu_nutritional_value)
values ('BigMac', 4.99, 1, 849.59);

describe McMenu;
select * from McMenu;

create table McOrders (
order_id int unique not null auto_increment,
#order_items int not null,
order_total decimal(6,2) not null,
order_timestamp datetime not null,
order_payment_method varchar(100) not null,
order_delivery boolean not null,
primary key(order_id)
);

insert into McOrders (order_total, order_timestamp, order_payment_method, order_delivery)
values (16.99, '2022/05/17 16:12:37', 'Cash', 0),
(24.50, '2022/05/17 16:12:37', 'Cash', 0),
(3.20, '2022/05/17 15:47:12', 'Card', 1),
(7.80, '2022/05/17 19:32:30', 'Card', 0),
(10.99, '2022/05/17 02:24:42', 'Cash', 1);

update McOrders set order_payment_method='Card' where supplier_id=1;
update McOrders set order_total=4.20 where supplier_id=3;

delete from McOrders where supplier_id=5;

describe McOrders;
select * from McOrders;

create table McStock (
supplier_id int unique not null auto_increment,
supplier_name varchar(100) not null,
supplier_product varchar(255) not null,
supplier_product_quantity int not null,
supplier_cost decimal(6,2) not null,
supplier_delivery date not null,
primary key (supplier_id)
);

insert into McStock(supplier_name, supplier_product, supplier_product_quantity, supplier_cost, supplier_delivery) 
values('Burger Place', 'BigMac', 10, 20.00, '2022/05/17'),
('Potato Land', 'Fries', 20, 18.95, '2022/05/19'),
('Apple Land', 'Apple Pies', 2, 5.00, '2022/05/19'),
('Lemonade Stand', 'Lemonade', 6, 7.50, '2022/05/18'),
('Sauce Land', 'Ketchup', 15, 8.45, '2022/05/20');

update McStock set supplier_delivery='2022/05/18' where supplier_id=1;
update McStock set supplier_delivery='2022/05/20' where supplier_id=3;

delete from McStock where supplier_id=2;

insert into McStock(supplier_name, supplier_product, supplier_product_quantity, supplier_cost, supplier_delivery) 
values('Potato Palace', 'Fries 2.0', 15, 25.00, '2022/05/22');

describe McStock;
select * from McStock;