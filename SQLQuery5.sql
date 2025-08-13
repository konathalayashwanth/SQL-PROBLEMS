
select  * from project

select * from employee10

with cte as
(
select p.project_id,e.employee_id,rank() over(partition by p.project_id order by experience_years desc) as rn
from project p inner join employee10 e
on p.employee_id=e.employee_id
)
select project_id,employee_id
from cte
where rn=1;