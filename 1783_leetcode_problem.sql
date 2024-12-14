select * from player

select * from championshps

with cte as
(
(select wimbledon as id from championshps)

union all

(select fropen as id from championshps)

union all

(select usopen as id from championshps)

union all

(select auopen as id   from championshps)
),cte2 as
(
select id,count(*) as cnt from cte
group by id
)
select b.playerid,b.playername,a.cnt as grandsales from cte2 a inner join players b
on a.id=b.playerid
order by 1 desc;