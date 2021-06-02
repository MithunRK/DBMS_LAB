create database order_p;
show databases;
use order_p;
show tables;
create table customer(
cust_no int,
cname varchar(20),
city varchar(30),
primary key(cust_no));
create table order_p(
order_no int,
odate date,
cust_no int,
order_amt int,
primary key(order_no),
foreign key(cust_no) references customer(cust_no) on delete cascade);
create table item(
item_no int,
price int,
primary key(item_no));
create table order_item(
order_no int,
item_no int,
qty int,
foreign key(item_no) references item(item_no) on delete cascade,
foreign key(order_no) references order_p(order_no) on delete cascade);
create table warehouse(
warehouse_no int,
city varchar(20),
primary key(warehouse_no));
create table shipment(
order_no int,
warehouse_no int,
ship_date date,
foreign key(order_no) references order_p(order_no) on delete cascade,
foreign key(warehouse_no) references warehouse(warehouse_no) on delete cascade);
insert into customer values(771,'PUSHPA K','BANGALORE');
insert into customer values(772,'MUMBAI','MUMBAI');
insert into customer values(773,'SOURAV','CALICUT');
insert into customer values(774,'LAILA','HYDERABAD');
insert into customer values(775,'FAIZAL','BANGALORE');
commit ;
select * from customer;
insert into item values(5001,503);
insert into item values(5002,750);
insert into item values(5003,150);
insert into item values(5004,600);
insert into item values(5005,890)
commit ;
select * from item;
insert into order_p values(111,'2002-01-22',771,18000);
insert into order_p values(112,'2002-07-30',774,6000);
insert into order_p values(113,'2003-04-03',775,9000);
insert into order_p values(114,'2003-11-03',775,29000);
insert into order_p values(115,'2003-12-10',773,29000);
insert into order_p values(116,'2004-08-19',772,56000);
insert into order_p values(117,'2004-09-10',771,20000);
insert into order_p values(118,'2004-11-20',775,29000);
insert into order_p values(119,'2005-02-13',774,29000);
insert into order_p values(120,'2005-10-13',775,29000);
commit;
select * from order_p;
insert into order_item values(111,5001,50);
insert into order_item values(112,5003,20);
insert into order_item values(113,5002,50);
insert into order_item values(114,5005,60);
insert into order_item values(115,5004,90);
insert into order_item values(116,5001,10);
insert into order_item values(117,5003,80);
insert into order_item values(118,5005,50);
insert into order_item values(119,5002,10);
insert into order_item values(120,5004,45);
commit;
select * from order_item;
insert into warehouse values(1,'DELHI');
insert into warehouse values(2,'BOMBAY');
insert into warehouse values(3,'CHENNAI');
insert into warehouse values(4,'BANGALORE');
insert into warehouse values(5,'BANGALORE');
insert into warehouse values(6,'DELHI');
insert into warehouse values(7,'BOMBAY');
insert into warehouse values(8,'CHENNAI');
insert into warehouse values(9,'DELHI');
insert into warehouse values(10,'BANGALORE');
commit;
select * from warehouse;
insert into shipment values(111,1,'2002-02-10');
insert into shipment values(112,5,'2002-09-10');
insert into shipment values(113,8,'2003-02-10');
insert into shipment values(114,3,'2003-12-10');
insert into shipment values(115,9,'2004-01-19');
insert into shipment values(116,1,'2004-09-20');
insert into shipment values(117,5,'2004-09-10');
insert into shipment values(118,7,'2004-11-04');
insert into shipment values(119,7,'2005-04-30');
insert into shipment values(120,6,'2005-12-21');
commit;
select * from shipment;


/*3*/
SELECT C.cname,COUNT(O.order_no),AVG(O.order_amt)
FROM customer C,order_p O 
WHERE C.cust_no=O.cust_no GROUP BY O.cust_no;


/*4*/
select o.order_no from order_p o, warehouse w, shipment s 
where o.order_no=s.order_no and s.warehouse_no=w.warehouse_no and w.city='BANGALORE';


/*5*/
delete from item where item_no=5003 ;
