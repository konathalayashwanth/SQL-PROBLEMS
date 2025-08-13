select * from matches

with hosts as
(
select host_team,
case when host_goals>guest_goals then 3 
     when host_goals=guest_goals then 1
	 when host_goals<guest_goals then 0
	 end as noofpoints
	 from matches
	 ),guests as
	 (
select guest_team,
case when guest_goals>host_goals then 3 
     when guest_goals=host_goals then 1
	 when guest_goals<host_goals then 0
	 end as noofpoints
	 from matches
	 ),final_result as
	 (
select teamid,sum(noofpoints) as no_of_points
from
(
select host_team as teamid,noofpoints
from hosts
union all
select guest_team,noofpoints
from guests
) as k
group by teamid
)
select t.team_id,t.team_name,coalesce(f.no_of_points,0) as num_points 
from teams t left join final_result f
on t.team_id=f.teamid
order by 3 desc;