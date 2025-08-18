
with cte as
(
select dept_id,salary,count(*) as cnt
from emp_salary
group by dept_id,salary
having count(*)>1

)
select e1.*
from emp_salary e1 left join cte c
on e1.dept_id=c.dept_id
where e1.salary=c.salary