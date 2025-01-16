select * from flights1


select * from passengers1

with cte as
(
select a.*,passenger_id,count(passenger_id) over(partition by a.flight_id order by passenger_id) as bookingcount
from flights1 a left join passengers1 b
on a.flight_id=b.flight_id
)
select flight_id,sum(case when bookingcount<=capacity then 1 else 0 end) as bookedcnt,
				sum(case when bookingcount>capacity then 1 else 0 end) as waitinglist
				from cte
	group by flight_id