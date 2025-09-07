select * from users45

select * from events45


--

select count(distinct e.user_id) as totalusers,
	   count(case when datediff(day,u.join_date,e.access_date)<=30 then e.user_id end) as fractionofusers,
	   count(case when datediff(day,u.join_date,e.access_date)<=30 then e.user_id end)*1.0/count(distinct e.user_id)*100.0 as fraction
from users45 u left join events45 e
on u.user_id=e.user_id and type='p'

