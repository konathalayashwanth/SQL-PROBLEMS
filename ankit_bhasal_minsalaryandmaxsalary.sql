with cte as
(
select dep_id,min(salary) as minsalary,max(salary) as maxsalary
from employee0
group by dep_id
)
select e.dep_id,
max(case when e.salary=cte.minsalary then e.emp_name else null end) as min_emp_name,
max(case when e.salary=cte.maxsalary then e.emp_name else null end) as  max_emp_name
from employee0 e inner join cte
on e.dep_id=cte.dep_id
group by e.dep_id




