

with gold_winners as
(
select gold,count(*) as cnt
from events
group by gold
),silver_winners as
(
select silver,count(*) as cnt
from events
group by silver
),bronze_winners as
(
select bronze,count(*) as cnt
from events
group by bronze
)
select gold,count(*) as cnt
from events
where gold not in(select silver from silver_winners) and gold not in (select bronze from silver_winners)
group by gold 