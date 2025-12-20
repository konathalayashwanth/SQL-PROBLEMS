select
p.project_id,
round(sum(e.experience_years) * 1.0/count(*),2) as average_years
from employee e inner join project p
on e.employee_id=p.employee_id
group by p.project_id;