with cte as
(
select 
e.name as employee,
e.salary,
d.name  as department,
dense_rank() over(partition by d.name order by e.salary desc) as rn
from
employee e inner join department d
on e.departmentId=d.id
)
select department,employee,salary
from cte
where rn<4;