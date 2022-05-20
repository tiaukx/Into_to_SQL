USE movielens;

#1
SELECT title, release_date from movies where release_date between '1981-01-01' and '1993-12-31' order by release_date desc;

#2
select  m.title, avg(r.rating) as average_rating from ratings r 
join movies m
on m.id=r.movie_id
where rating < min(average_rating)
group by r.movie_id order by average_rating;

#3
select distinct r.movie_id 
from ratings r
join genres_movies gm on r.movie_id=gm.movie_id
join users u on r.user_id=u.id
where u.gender='M' and u.age=24 and u.occupation_id=19 and r.rating=5 and gm.genre_id=15
group by r.movie_id;

SELECT m.title
FROM users u
JOIN occupations o ON u.occupation_id = o.id
JOIN ratings r ON u.id = r.user_id
JOIN movies m ON r.movie_id = m.id
JOIN genres_movies gm ON gm.movie_id = m.id
JOIN genres g ON g.id = gm.genre_id
WHERE gender = 'M' 
AND g.name = 'Sci-Fi'
AND o.name = 'Student'
AND rating = 5
AND age = 24;

#4
select distinct title from movies 
where release_date=
(select release_date
from movies
group by release_date
order by count(release_date) desc limit 1);

#5
select j.name, ount(i.movie_id) as count
from genres_movie i
join genres j 
on j.id=i.genre_id
group by genre_id order by coutn asc;