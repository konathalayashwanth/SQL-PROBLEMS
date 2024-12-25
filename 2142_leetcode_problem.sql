-----

with cte as
(
select *,lag(arrivaltime,1) over(order by arrivaltime) as previoustime
from buses
)
select busid,sum(case when a.arrivaltime>=b.arrivaltime  and b.arrivaltime>coalesce(a.previoustime,0) then 1 else 0 end) as passengerscount	
	from cte a left join passengers b
on a.arrivaltime>=b.arrivaltime
group by busid



----------busid,sum(case when a.arrivaltime>=b.arrivaltime  and b.arrivaltime>coalesce(a.previoustime,0) then 1 else 0 end) as passengerscount	