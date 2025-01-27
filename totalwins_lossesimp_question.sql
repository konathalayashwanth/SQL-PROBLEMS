


select * from cricket_match

with cte as
(
select team1 as teamname,
		case when team1=result then 1 else 0 end as winflag
		from cricket_match
union all
select team2 as teamname,
		case when team2=result then 1 else 0 end as winflag
		from cricket_match
)
select teamname,
count(*) as noofmatchesplayed,
sum(case when winflag=1 then 1 else 0 end) as totalwins,
count(*)-sum(case when winflag=1 then 1 else 0 end) as nooflosses
from cte
group by teamname