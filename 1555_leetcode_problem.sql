create table users
(
   userid      int       primary key,
   username    varchar(20)   not null,
   credit     int			not null
)
go



create table   transactions
(
  tranid       int     primary key,
  paidby       int      not null,
  paidto	int			not null,
  amount	int			not null,
  transactedon     date   not null
)
go



insert into users values(1,'moustafa',100)
insert into users values(2,'jonathan',200)
insert into users values(3,'winston',10000)
insert into users values(4,'luis',800)



----
insert into   transactions values(1,1,3,400,'2020-08-01')
insert into   transactions values(2,3,2,500,'2020-08-02')
insert into   transactions values(3,2,1,200,'2020-08-03')


select * from users


select * from transactions



with cte1 as
(
  select paidby,sum(amount) totalpaidby from transactions
  group by paidby
),
cte2 as
(
  select paidto,sum(amount) as totalpaidto from transactions
	group by paidto
),
cte3 as
(
select *,coalesce(totalpaidby,0) as t1,coalesce(totalpaidto,0) as t2 from users a left join cte1 b
on a.userid=b.paidby
left join cte2 c
on a.userid=c.paidto
)
select userid,username,credit-t1+t2 as credit1,
case  when credit-t1+t2<0 then 'yes'
		else  'No' end as creditlimitbreached
from cte3

