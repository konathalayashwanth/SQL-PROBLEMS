create table data
(
	firstcol	int    not null,
	secongcol   int    not null
)
go



----

insert into data values(4,2)
insert into data values(2,3)
insert into data values(3,1)
insert into data values(1,4)

with cte1 as
(
select *,rank() over(order by firstcol) as r1 from data
),cte2 as
(
	select *,rank() over(order by secongcol desc) r2 from data
)
select a.firstcol,b.secongcol from cte1 a inner join cte2 b
on a.r1=b.r2