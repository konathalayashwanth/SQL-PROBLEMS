use indianbank


select * from seats


update seats
set seats.id=newseats.new_id
from
(
select *,case  when id=(select max(id) from seats) and id%2=1 then id
			   when id%2=0 then id-1
			   else id+1
			   end as new_id
			   from seats
) as newseats
where seats.id=newseats.id


select * from seats