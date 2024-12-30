create table passenger
(
	rideid		int			primary key,
	driverid	int			not null,
	passengerid		int		not null
)
go


----------

insert into passenger values(1,7,1)
insert into passenger values(2,7,2)
insert into passenger values(3,11,1)
insert into passenger values(4,11,7)
insert into passenger values(5,11,7)
insert into passenger values(6,11,3)



with cte as
(
select passengerid as driverid,count(*) as cnt from passenger
group by passengerid
),cte2 as
(
	select  distinct driverid from passenger
)
select a.driverid, coalesce(cnt,0) as cnt from cte2 a left join cte b
on a.driverid=b.driverid



select * from passenger