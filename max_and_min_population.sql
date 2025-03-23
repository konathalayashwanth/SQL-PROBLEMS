



select * from city_population




with cte as
(
select *,
row_number() over(partition by state order by population asc) as rn1,
row_number() over(partition by state order by population desc) as rn2
from city_population
)
select state,max(case when rn2=1 then population else null end) as maxpopulation,
	min(case when rn1=1 then population else null end) as minpopulation
from cte
group by state


