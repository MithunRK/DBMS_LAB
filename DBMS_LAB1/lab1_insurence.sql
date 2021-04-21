create database incurence;
show databases;
use incurence;
show tables;
create table person(driver_id varchar(10),name varchar(10),address varchar(20),primary key(driver_id));
desc person;
create table car(regno varchar(10),model varchar(20),year date,primary key(regno));
create table accident(report_no int,adate date,location varchar(15),primary key(report_no));
create table owns(driver_id varchar(10),regno varchar(10),primary key(driver_id,regno),
foreign key(driver_id) references person (driver_id) on delete cascade ,
foreign key(regno) references car(regno)on delete cascade);
show tables;
create table participants(driver_id varchar(10),regno varchar(10),report_no int,damage_amount float,foreign key(driver_id,regno) references owns(driver_id,regno) on delete cascade,
foreign key(report_no) references accident(report_no) on delete cascade);
desc participated;
show tables;
insert into person values(1111,'ramu', 'k.s.layout');
insert into person values(2222,'john','indiranagar');
insert into person values(3333,'priya','jayanagar');
insert into person values(4444,'gopal','whitefield');
insert into person values(5555,'latha','vijaynagar');
commit;
select * from person;
insert into car values('KA04Q2301','MARUTHI-DX','2001-01-20');
insert into car values('KA05P1000','FORDICON','2014-04-20');
insert into car values('KA03L1234','ZEN-VXI','2003-01-19');
insert into car values('KA03L9999','MARUTHI-DX','2003-4-22');
insert into car values('KA01P4020','INDICA-VX','2005-06-21');
COMMIT;

SELECT * FROM CAR;
insert into accident values(12,'01-2-20','mg road');
insert into accident values(200,'01-2-23','doubleroad');
insert into accident values(600,'01-2-22','mg road');
insert into accident values(25000,'02-2-22','residency road');
insert into accident values(265400,'02-2-21','richmond road');
commit;

select * from accident;
insert into owns VALUES('1111','KA04Q2301');
insert into owns VALUES('2222','KA05P1000');
insert into owns VALUES('3333','KA03L1234');
insert into owns VALUES('4444','KA03L9999');
insert into owns VALUES('5555','KA01P4020');
COMMIT;
SELECT * FROM OWNS;
insert into participants values('1111','KA04Q2301',12,'76435');
insert into participants values('2222','KA05P1000',200,'76987');
insert into participants values('3333','KA03L1234',600,'7735');
insert into participants values('4444','KA03L9999',25000,'773584');
insert into participants values('5555','KA01P4020',265400,'38746');
commit;
select * from participants;
UPDATE participants
SET damage_amount=25000
WHERE REPORT_NO =12 AND REGNO='KA04Q2301';
SELECT COUNT(*) FROM ACCIDENT
WHERE ADATE LIKE '__-___-01';