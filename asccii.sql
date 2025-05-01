
with cte as
(
select *,ASCII(email_id) as ascii1,lower(email_id) as lwcase,rank() over(partition by lower(email_id) order by ASCII(email_id) desc) as rn
from employees4
)
select * from cte 
where rn=1