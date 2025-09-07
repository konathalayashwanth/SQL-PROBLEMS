



select g2.mdate,
       g2.id,
       g2.team1,
	   g2.team2,
	   sum(case when g.teamid=g2.team1 then 1 else 0 end) as score1,
	   sum(case when g.teamid=g2.team2 then 1 else 0 end) as score2
from goal g right join game g2
on coalesce(g.matchid,0)=coalesce(g2.id,0)
group by g2.mdate,g2.id,g2.team1,g2.team2