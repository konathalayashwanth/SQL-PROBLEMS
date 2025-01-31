select * from order_details


with cte as
(
select *,datediff(minute,order_time,deliver_time) as totaltime
from order_details
)

select del_partner,
		count(case when totaltime>predicted_time then 1 
		end) as totalcnt
		from cte
		group by del_partner
		


