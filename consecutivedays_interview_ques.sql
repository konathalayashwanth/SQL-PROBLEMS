
select * from stadium;



with cte as
(
select *,row_number() over(order by visit_date asc) as rn,
			id-row_number() over(order by visit_date asc) as diff from stadium
where people>=100
),cte2 as
(
select *,count(*) over(partition by diff) as consecutivedays
from cte
)
select id,visit_date,people,consecutivedays from cte2
where consecutivedays>=3