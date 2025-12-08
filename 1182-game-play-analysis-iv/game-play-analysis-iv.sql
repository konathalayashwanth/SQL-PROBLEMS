

with cte as
(
select 
player_id,
min(event_date) as firstlogin
from activity
group by player_id
),next as
(
select c.player_id
from cte c inner join activity a
on c.player_id=a.player_id
and datediff(day,c.firstlogin,a.event_date)=1
)
select 
round((count(distinct n.player_id)*1.0/count(distinct c.player_id)*1.0),2) as fraction from cte c left join next n
on c.player_id=n.player_id;