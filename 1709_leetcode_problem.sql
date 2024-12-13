select * from uservisits


with cte as
(
select *,lead(visitdate) over(partition by userid order by visitdate) as nextdate 
from uservisits
)
,cte2 as
(
	select userid,
	case when nextdate is not null then datediff(dd,visitdate,nextdate)
	else datediff(dd,visitdate,(cast('2021-01-1' as date))) end as window
	from cte
)
select userid,max(window) as biggestwindow from cte2
group by userid