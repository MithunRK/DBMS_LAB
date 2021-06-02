create database banking;
use banking;
show tables;
create table branch(
branch_name varchar(20),
branch_city varchar(20),
assets real,
primary key(branch_name));
create table account(
acc_no int,
branch_name varchar(20),
balance real,
primary key (acc_no),
foreign key(branch_name) references branch(branch_name) on update cascade);
create table depositor(
cust_name varchar(20),
acc_no int,
foreign key(cust_name) references customer(cust_name) on update cascade,
foreign key(acc_no) references account(acc_no) on update cascade);
create table customer(
cust_name varchar(20),
cust_street varchar(20),
city varchar(20),
primary key(cust_name));
create table loan(
loan_no int,
branch_name varchar(20),
amount real,
primary key(loan_no),
foreign key(branch_name) references branch(branch_name) on update cascade);
create table borrower(
cust_name varchar(20),
loan_no int,
foreign key(cust_name) references customer(cust_name) on update cascade,
foreign key(loan_no) references loan(loan_no) on update cascade);

insert into branch values('SBI PD NAGAR','BANGALORE',20000);
insert into branch values('SBI RAJAJI NAGAR','BANGALORE',500000);
insert into branch values('SBI JAYANAGAR','BANGALORE',660000);
insert into branch values('SBI VIJAY NAGAR','BANGALORE',870000);
insert into branch values('SBI HOSAKEREHALLI','BANGALORE',550000);
select * from branch;

insert into account values(1234602,'SBI HOSAKEREHALLI',5000);
insert into account values(1234603,'SBI VIJAY NAGAR',5000);
insert into account values(1234604,'SBI JAYANAGAR',5000);
insert into account values(1234605,'SBI RAJAJI NAGAR',10000);
insert into account values(1234503,'SBI VIJAY NAGAR',40000);
insert into account values(1234504,'SBI PD NAGAR',4000);
commit;
select *from account;

insert into loan(loan_no,branch_name,amount) values (10011,'SBI JAYANAGAR',10000),
(10012,'SBI VIJAY NAGAR',5000),(10013,'SBI HOSAKEREHALLI',20000),
(10014,'SBI PD NAGAR',15000),(10015,'SBI RAJAJI NAGAR',25000);
select * from loan;

insert into borrower (cust_name,loan_no) values ('KEZAR',10011),
('LAL KRISHNA',10012), ('RAHUL',10013), ('LALLU',10014), ('LAL KRISHNA',10015);
commit;
select * from borrower;

insert into customer (cust_name,cust_street,city) values ('KEZAR','MG ROAD','BANGALORE'),
('LAL KRISHNA','ST MKS ROAD','BANGALORE'), ('RAHUL','AUGSTEN ROAD','BANGALORE'),
('LALLU','VS ROAD','BANGALORE'), ('FAIZAL','RESIDENCY ROAD','BANGALORE'),
('RAJEEV','DICKENSEN ROAD','BANGALORE');
select * from customer;



/*3*/
select d.customer_name from depositor d,accounts a where
d.accno=a.accno and a.branch_name = "D"
group by d.customer_name having count(d.customer_name)
>=2;

/*4*/
select customer_name from depositor
join accounts on accounts.accno = depositor.accno
join branch on branch.branch_name = accounts.branch_name
where branch.branch_city = "Bangalore"
GROUP BY depositor.customer_name
having count(DISTINCT branch.branch_name) = (SELECT
COUNT(branch_name)
FROM branch
WHERE branch_city = 'Bangalore');

/*5*/
delete from accounts where branch_name in
(select branch_name from branch where
branch_city="Delhi");
select * from accounts;


