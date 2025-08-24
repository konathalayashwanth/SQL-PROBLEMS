

select a.phone_number,a.start_time,b.end_time,datediff(minute,a.start_time,b.end_time) as duration
from
(select * ,row_number() over(partition by phone_number order by start_time) as rn1
from call_start_logs) as a
inner join
(select *,row_number() over(partition by phone_number order by end_time) as rn2
from call_end_logs) as b
on a.phone_number=b.phone_number and a.rn1=b.rn2




