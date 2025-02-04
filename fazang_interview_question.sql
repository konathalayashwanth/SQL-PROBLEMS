


create table puzzle(id int,rules varchar(10),value int)

insert into puzzle values(1,'1+3',10)
insert into puzzle values(2,'2*5',12)
insert into puzzle values(3,'3-1',14)
insert into puzzle values(4,'4/1',15)
insert into puzzle values(5,'5+4',18)


select * from puzzle


with cte as
(
select *,
		left(rules,1) as l,
		right(rules,1) as r,
		substring(rules,2,1) as mid
		from puzzle
)
select c.id,c.rules,c.mid,c.value,p.value,
case when c.mid='+' then c.value+p.value
	 when c.mid='*' then c.value*p.value
	 when c.mid='-' then c.value-p.value
	 when c.mid='/' then c.value/p.value
	 end as output
from cte c inner join puzzle p
on c.r=p.id