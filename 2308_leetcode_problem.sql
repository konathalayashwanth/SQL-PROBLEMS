select * from genders

with cte as
(
select *,DENSE_RANK() over(partition by gender order by userid) as ar,
case	
	when  gender='female' then 1
	when gender='other' then 2
	when gender='male' then 3
	end as gr
	from genders
	)
select userid,gender
from cte
order by ar asc,gr asc