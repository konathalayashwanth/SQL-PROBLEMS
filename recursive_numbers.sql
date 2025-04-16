create table numbers (n int);
insert into numbers values (1),(2),(3),(4),(5)



select * from numbers


--recursive cte

with cte as
(
select n as num,1 as level from numbers
union all
select num,level+1 from cte 
where level+1<=num
)
select * from cte
order by num,level asc