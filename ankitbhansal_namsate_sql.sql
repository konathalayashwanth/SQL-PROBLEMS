



select * from userevents


with cte as
(
select *,lag(event_time,1,event_time) over(partition by userid order by event_time) as prevevent_time,
datediff(minute,lag(event_time,1,event_time) over(partition by userid order by event_time),event_time) as timediff
from userevents
),cte2 as
(
select *,case when timediff<=30 then 0 else 1 end as sessionflag,
sum(case when timediff<=30 then 0 else 1 end ) over(partition by userid order by event_time) as sessiongroups
from cte
)
select userid,sessiongroups+1 as sessionid,min(event_time) as sesssionstarttime,max(event_time) as sessionendtime,count(*) as noofevents,
datediff(minute,min(event_time),max(event_time)) as sessionduration
from cte2
group by userid,sessiongroups
order by userid
