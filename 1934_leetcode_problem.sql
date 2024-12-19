select * from signups

select * from confirmations


with cte as
(
select a.userid,b.action from signups a left join confirmations b
on a.userid=b.userid
)
select userid,round(sum(case when action='confirmed' then 1 else 0 end )/count(*),2) as confirmationrate 
from cte
group by userid
