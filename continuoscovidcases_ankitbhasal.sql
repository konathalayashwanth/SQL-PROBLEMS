--find the which city is increasing continuos covid cases


select * from covid

with cte as
(
select *,
rank() over(partition by city order by days) as rn1,
rank() over(partition by city order by cases) as rn2,
rank() over(partition by city order by days)-rank() over(partition by city order by cases) as diff
from covid
)
select city
from cte
group by city
having count(distinct diff)=1 and min(diff)=0;