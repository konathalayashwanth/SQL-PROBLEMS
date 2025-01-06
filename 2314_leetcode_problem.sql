select * from weather2



with cte as
(
select *,max(degree) over(partition by cityid order by degree desc) degree2
from weather2
)
select cityid,day,degree2 from cte
where day in(select min(day) from weather2 group by cityid)


---or


with cte as
(
	select *,rank() over(partition by cityid order by degree desc,day asc) as rk from weather2
)
select cityid,day,degree from cte
where rk=1
order by cityid