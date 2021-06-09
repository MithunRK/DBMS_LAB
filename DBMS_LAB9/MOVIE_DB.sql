create database movie;
use movie;
show tables;
create table actor(
act_id int primary key,
act_name varchar(20),
act_gender varchar(10));
desc actor;
create table director(
dir_id int primary key,
dir_name varchar(20),
dir_phone int);
create table movies(
mov_id int primary key,
mov_title varchar(20),
mov_year year,
mov_lang varchar(20),
dir_id int,
foreign key(dir_id) references director (dir_id));
create table movie_cast(
act_id int,
mov_id int,
roles varchar(20),
foreign key(act_id) references actor(act_id),
foreign key(mov_id) references movies(mov_id));
drop table movie_cast;
create table rating(
mov_id int,
rev_star int,
foreign key(mov_id) references movies(mov_id));

insert into actor(act_id,act_name,act_gender) values
(1,"srh","male"),
(2,"tom","male"),
(3,"rr","male"),
(4,"nat","female"),
(5,"sal","male");
select * from actor;
insert into director(dir_id,dir_name,dir_phone) values
(10,"raj",3223234),
(20,"maan",8776544),
(30,"JJ",2223234),
(40,"rrr",2323455),
(50,"dj",4423234);
select * from director;
insert into movies(mov_id ,mov_title ,mov_year ,mov_lang ,dir_id) values
(111,"xmen",2001,"eng",50),
(222,"ymen",2016,"eng",40),
(333,"zmen",1999,"eng",30),
(444,"amen",2020,"eng",10),
(555,"crumen",1997,"eng",20),
(666,"XYZ",1998,"hindi",10),
(777,"zen",1992,"hindi",30);
select * from movies;

insert into movie_cast(act_id,mov_id,roles) values
(1,222,"hero"),
(2,222,"side_actor"),
(3,111,"hero"),
(4,333,"hero"),
(4,555,"villen"),
(5,222,"dancer"),
(5,444,"side_actor"),
(2,444,"hero");
select * from movie_cast;


insert into rating(mov_id,rev_star) values
(111,4),
(222,3),
(333,4),
(444,2),
(555,5),
(666,1),
(777,1);
select * from rating;



-- SQLqueries
-- 1)
select mv.mov_title from movies mv,director d 
where d.dir_id=mv.dir_id and d.dir_name='raj';
 
-- 2)
SELECT m.mov_title FROM actor a,movie_cast c,movies m 
WHERE a.act_id=c.act_id AND c.mov_id=m.mov_id 
AND a.act_id IN(SELECT act_id FROM movie_cast GROUP BY act_id HAVING COUNT(*)>=2);

-- 3)
select distinct a.act_name,m.mov_id from actor a,movies m 
where m.mov_year<2000 or m.mov_year>2015;


-- 4)
SELECT m.mov_title,MAX(R.rev_star) FROM movies m,rating r 
WHERE m.mov_id=r.mov_id  GROUP BY r.mov_id HAVING COUNT(*)>0;

-- 5)



