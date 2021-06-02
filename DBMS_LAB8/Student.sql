create database student_enrollment;
use student_enrollment;

SHOW TABLES;
create table student(
regno varchar(20),
sname varchar(30),
major varchar(20),
bdate date,
primary key(regno));


create table course(
course_no int,
cname varchar(30),
dept varchar(30),
primary key(course_no));



create table enroll(
regno varchar(30),
course_no int,
sem int,
marks int,
foreign key(regno) references student(regno) on update cascade,
foreign key(course_no) references course(course_no) on update cascade);



create table book_adoption(
course_no int,
sem int,
book_ISBN int,
primary key(book_ISBN),
foreign key(course_no) references course(course_no) on update cascade);




create table text(
book_ISBN int,
book_title varchar(30),
publisher varchar(30),
author varchar(30),
foreign key(book_ISBN) references book_adoption(book_ISBN) on update cascade);




insert into student values("CS01","RAM","DS","1986-03-12");
insert into student values("IS02","SMITH","USP","1987-12-23");
insert into student values("EC03","AHMED","SNS","1985-04-17");
insert into student values("CS03","SNEHA","DBMS","1987-01-01");
insert into student values("TC05","AKHILA","EC","1986-10-06");


insert into course values(11,"DS","CS");
insert into course values(22,"USP","IS");
insert into course values(33,"SNS","EC");
insert into course values(44,"DBMS","CS");
insert into course values(55,"EC","TC");

insert into enroll values("cs01","11",4,85);
insert into enroll values("IS02","22",6,80);
insert into enroll values("EC03","33",2,80);
insert into enroll values("CS03","44",6,75);
insert into enroll values("TC05","55",2,8);


insert into text value(1,"DS AND C ","PRINCETON","PADMA REDDY");
insert into text value(2,"FUNDAMENTALS OF DS","PRINCETON","GODSE");
insert into text value(3,"FUNDAMENTALS OF DBMS","PRINCETON","NAVATHE");
insert into text value(4,"SQL","PRINCETON","FOLEY");
insert into text value(5,"ELECTRONIC CIRCUITS","TMH","ELMASRI");
insert into text value(6,"ADV UNIX PROG","TMH","STEVENS");



insert into book_adoption values(11,4,1);
insert into book_adoption values(11,4,2);
insert into book_adoption values(44,6,3);
insert into book_adoption values(44,6,4);
insert into book_adoption values(55,2,5);
insert into book_adoption values(22,6,6);
insert into book_adoption values(55,2,7);



select * from student;
select * from course;
select * from enroll;
select * from book_adoption;
select * from text;

/*3*/
  -- Demonstrate how you add a new text book to the database and make this book be adopted by some department.
INSERT INTO TEXT VALUES(7, "TREES & GRAPHS", "PRINCETON", "SADGE");
INSERT INTO BOOK_ADOPTION VALUES(11, 4, 8); 


/*4*/

SELECT C.COURSE_NO,T.BOOK_ISBN,T.BOOK_TITLE FROM TEXT T,COURSE C,BOOK_ADOPTION B WHERE T.BOOK_ISBN=B.BOOK_ISBN AND B.COURSE_NO=C.COURSE_NO AND C.DEPT="CS" AND (SELECT COUNT(B.BOOK_ISBN) FROM BOOK_ADOPTION B WHERE C.COURSE_NO=B.COURSE_NO)>=2 ORDER BY T.BOOK_TITLE;                     



/*5*/
select c.dept from course c,text t,book_adoption b where t.book_ISBN=b.book_ISBN and
b.course_no=c.course_no and t.publisher="TMH";


