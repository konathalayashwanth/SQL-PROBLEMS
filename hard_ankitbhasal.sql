

select * from spending

with cte as
(
select spend_date,user_id,max(platform) as platform,
sum(amount) as amount
from spending
group by spend_date,user_id
having count(distinct platform)=1
union all
select spend_date,user_id,'both' as platform,
sum(amount) as amount
from spending
group by spend_date,user_id
having count(distinct platform)=2
union all
select distinct spend_date,null as user_id,'both' as platform,'0' as  amount
from spending
)
select spend_date,platform,
count(distinct user_id) as totalusers,
sum(amount) as totalamount
from cte
group by spend_date,platform
order by 1 asc
