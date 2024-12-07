use indianbank



create table points
(
	id      int     primary key,
	xvalue    int    not null,
	yvalue    int    not null
)
go



insert into points values(1,2,7)
insert into points values(2,4,8)
insert into points values(3,2,10)


select a.id as p1,b.id as p2,abs(a.xvalue-b.xvalue)*abs(a.yvalue-b.yvalue) as area from points a inner join points b
on a.id<b.id
where abs(a.xvalue-b.xvalue)*abs(a.yvalue-b.yvalue)<>0
order by area desc,p1 asc,p2 asc;


