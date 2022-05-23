USE sakila;

#1 - List all actors
select first_name, last_name from actor;

#2 - find the surname of the actor with the forename 'John'
select last_name from actor
where first_name = 'John';

#3 - Find all the actors with surname 'Neeson'
select first_name, last_name from actor
where last_name = 'Neeson';

#4 - find all actors with ID numbers divisible by 10
select actor_ID, first_name, last_name 
from actor
where actor_ID % 10 = 0;
#the % operator gives the remainder after division by 10, the remainder has been set to 0 so can only give numbers that have no remainder

#5 - What is the description of the movie with an ID of 100
select description from film
where film_id = 100;

#6 - Find every R-rated movie
select title from film
where rating = 'R';

#7 - Find every non R-rated movie
select title from film
where rating != 'R';

#8 - Find the ten shortest movies
select title, `length` from film
order by `length` asc limit 10;

#9 - Find the movies with the longest run time without using limit
select title, `length` from film
order by `length` desc;

#10 - Find all movies that have deleted scenes
select title, special_features from film
where special_features like '%Deleted Scenes';

#11 - Using HAVING, reverse-alphabetically list the last names that are not repeated
select last_name from actor
group by last_name
having count(last_name) < 1;

#12 - Using HAVING list the names that appear more than once from highest to lowest frequency
select last_name from actor
group by last_name
having last_name = count(last_name) < 1
order by last_name desc;