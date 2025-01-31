use indianbank


select * from seats


with cte as
( 
  select count(id) as totalseats from seats
)
select case
		 when id%2!=0 and id!=totalseats
		 then id+1	
		 when id%2!=0 and id=totalseats
		 then id
		 else id-1 end as id,
		 student
from seats cross join cte
order by id asc