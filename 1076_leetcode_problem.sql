

----Q-write a query that reports all the proejects with highest employees



with cte as
(select project_id,count(employee_id) as cnt
from project
group by project_id
)
select project_id from cte
where cnt = (select max(cnt) as highcount from cte)