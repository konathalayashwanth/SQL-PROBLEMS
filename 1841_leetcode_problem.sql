select * from teams1


select * from matches1

with cte as
(
select *,
		case
			when hometeamgoals>awatteamgoals then 3
			when hometeamgoals<awatteamgoals then 0
			else 1 
			end as homepoints,
		case when awatteamgoals>hometeamgoals then 3
		     when awatteamgoals<hometeamgoals then 0
			 else 1
			 end as awaypoints
			 from matches1
),cte2 as
(
select hometeamid as teamid,hometeamgoals,awatteamgoals,homepoints from cte

union all

select awayteamid as teamid,awatteamgoals,hometeamgoals,awaypoints from cte
),cte3 as
(
select teamid,
		count(*) as matchesplayed,
		sum(homepoints) as points,
		sum(hometeamgoals) as goalsfor,
		sum(awatteamgoals) as goalsagainst,
		sum(hometeamgoals)-sum(awatteamgoals) as goaldiff
		from cte2
		group by teamid
)
select teamname,matchesplayed,points,goalsfor,goalsagainst,goaldiff from cte3 a inner join teams1 b
on a.teamid=b.teamid
order by 2 asc;

