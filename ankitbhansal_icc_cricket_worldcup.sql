

with cte as
(
select Team_1 as team,COUNT(*) as noofmatchesplayed,
SUM(case when Team_1=winner then 1 else 0 end) as wins,
COUNT(*)-SUM(case when Team_1=winner then 1 else 0 end) as losses
from icc_world_cup
group by Team_1
union all
select Team_2,COUNT(*) as noofmatchesplayed,
SUM(case when Team_2=winner then 1 else 0 end) as wins,
COUNT(*)-SUM(case when Team_2=winner then 1 else 0 end) as losses
from icc_world_cup
group by Team_2
)
select team,SUM(noofmatchesplayed) as noofmatches,
SUM(wins) as won,
SUM(losses) as loss,
SUM(wins)*2 as pts
from cte
group by team
order by SUM(wins)*2 desc