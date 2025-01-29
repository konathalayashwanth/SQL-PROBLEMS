create table students2(sname varchar(50), sid varchar(50), marks int)


insert into students2 values('A','X',75),('A','Y',75),('A','Z',80),('B','X',90),('B','Y',91),('B','Z',75)

select * from students2

with cte as
(
select *,row_number() over(partition by sname order by marks desc) as rn
from students2
)
select sname,sum(marks) as totalmarks
from cte 
where rn<=2
group by sname