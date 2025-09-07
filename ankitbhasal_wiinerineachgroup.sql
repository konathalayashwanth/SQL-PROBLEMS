select * from players1

select * from matches

with cte as
(
select first_player as player_id,first_score as score from matches
union all
select second_player,second_player from matches
),finalranking as
(
select p.group_id,c.player_id,sum(score) as totalscorebyplayer
from players1 p inner join cte c
on p.player_id=c.player_id
group by p.group_id,c.player_id
)
select * from 
(
select *,rank() over(partition by group_id order by totalscorebyplayer,player_id) as rn
from finalranking
) as k
where rn=1