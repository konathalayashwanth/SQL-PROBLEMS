select * from teampoints

select * from pointschange


select a.teamid,name,
DENSE_RANK() over(order by points desc,name asc) - dense_rank() over(order by a.points+b.pointschange desc,name asc) as rank_diff
from teampoints a inner join pointschange b
on a.teamid=b.teamid
