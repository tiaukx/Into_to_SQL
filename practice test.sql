#view all databases
show databases;

#create a database
create database McDonalds;
#creates a new database if it doesn't exist
create database if not exists McDonalds;

#use a specific database
use McDonalds;

#creating a table in database - DDL
#snake_case
create table items(
id int unique not null auto_increment,
item_name varchar(100) not null,
item_price decimal(6,2) not null,
#1234.56
item_description varchar(255) default 'Description TBC',
primary key (id)
);

#describes the tables definition
describe items;

#views what is inside a table - DML
# * selects all items from inside the table
select * from items;

#different types of SQL queries
# 		C 		R 		U		D
#DDL	Create	Show	Alter	Drop
#DML	Insert	Select	Update	Delete
# - DDL - Data Definition Language - Defining the Schema
# - DML - Data Manipulation Language - Manipulatings the contents of the data/records

#Add a new record - DML
insert into items(item_name, item_price, item_description) values('Fries', 1.99, 'Salty goodness');

#To add multiple items in one line, put a comma after the value brackets and add a new set of brackets - DML
insert into items(item_name, item_price, item_description) values('Coke', 1.49, 'Cool and refreshing'), ('Apple Pie', 0.99, 'Crunchy and sweet');

#Update a record - DML
update items set item_price=1.19 where id=2;

#Delete a record - DML
delete from items where id=3;

#updating the schema (table/database layout)
#add another column to a table
alter table item add item_description varchar(255);

#removing a column from a table
alter table items drop column item_description;

#modifying existing columns
alter table items modify item_name varchar(150) not null;

#selects certain columns to look at
select item_name, item_price from items; 

#only displays item names whose price is above a certain value
select item_name from items where item_price > 1;

#searches table for results where the string in item_name matches the stated value
select * from items where item_name='Fries';

