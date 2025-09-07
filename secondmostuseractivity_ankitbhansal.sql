select * from useractivity


--find the second useractivity and if its only one then return one..


select [username], [activity], [startDate], [endDate]
from
(
select  *,rank() over(partition by username order by startdate) as rn,
		  count(1) over(partition by username order by (select null)) as cnt
from useractivity
) as k
where rn=2 or cnt=1





