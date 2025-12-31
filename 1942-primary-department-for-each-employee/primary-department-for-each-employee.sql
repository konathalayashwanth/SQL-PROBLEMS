
with cte as
(
select *,
row_number() over(partition by employee_id order by primary_flag desc) as rn
from employee
) 
select employee_id,department_id from cte
where rn=1