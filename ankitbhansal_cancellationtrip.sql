select * from trips


select * from users2



select t.request_at,
     count(case when status in ('cancelled_by_driver','cancelled_by_client') then 1 else null end) as cancelledtripcount, 
	 count(*) as totaltripcount,
	 count(case when status in ('cancelled_by_driver','cancelled_by_client') then 1 else null end)*1.0/count(*)*100.0 as cancelledtrippercent
from trips t inner join users2 u
on t.client_id=u.users_id
inner join users2 u2 
on u2.users_id=t.driver_id
where u.banned='no' and u2.banned='no'
group by t.request_at