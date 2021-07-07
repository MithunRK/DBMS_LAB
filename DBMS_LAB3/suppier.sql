create database supply;
use supply;
show tables;
create table suppliers(
sid int,
sname varchar(20),
address varchar(20),
primary key (sid));
create table parts(pid int,
pname varchar(20),
color varchar(20),
primary key(pid));
create table catalog(
sid int,
pid int,
cost real,
foreign key (sid) references suppliers(sid) on update cascade,
foreign key (pid) references parts(pid)on delete cascade);



insert into suppliers values(1,"jeevan","jainagar");
insert into suppliers values(2,"manoj","ramnagar");
insert into suppliers values(3,"mani","ashrama nagar");

insert into parts values(1,"laptop","red");
insert into parts values(2,"desktop","blue");
insert into parts values(3,"pen","black");

insert into catalog values(1,1,1000);
insert into catalog values(2,2,6000);
insert into catalog values(3,3,20);
insert into catalog values(1,3,30);
insert into catalog values(2,3,10);
insert into catalog values(2,1,1000);


select *from suppliers;
select *from parts;
select *from catalog;


/*1*/
alter table suppliers add column mobnumber int;
/*2*/
delete from parts where pid=3;
/*3*/
select sname from suppliers s, catalog c, parts p where s.sid=c.sid and p.pid=c.pid and p.color="red" and c.cost <= 10000;