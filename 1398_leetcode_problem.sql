create table customers4
(
	customerid   int    not null,
	customername    varchar(10)   not null
)
go


create table orders1
(
 orderid     int     not null,
 customerid   int    not null,
 productname  varchar(10)   not null
)
go



insert into customers4 values(1,'Daniel')
insert into customers4 values(2,'Diana')
insert into customers4 values(3,'Elizabeth')
insert into customers4 values(4,'Jhon')

select * from customers4

select * from orders1

insert into orders1 values(10,1,'A')
insert into orders1 values(20,1,'B')
insert into orders1 values(30,1,'D')
insert into orders1 values(40,1,'C')
insert into orders1 values(50,2,'A')
insert into orders1 values(60,3,'A')
insert into orders1 values(70,3,'B')
insert into orders1 values(80,3,'D')
insert into orders1 values(90,4,'C')




select * from customers4


select * from orders1





with cte as
(
 select customerid from orders1
 where productname='A'
)
,cte2 as
(
	 select customerid from orders1
 where productname='B'
)
,cte3 as
(
 select customerid from orders1
 where productname='C'
 )
 select customerid,customername from customers4
 where customerid in(select customerid from cte)
 and
 customerid in (select customerid from cte2)
 and
 customerid not in(select customerid from cte3);
