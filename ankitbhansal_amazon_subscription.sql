

select * from subscription_history

--Q write a sql query to find no of activemenbers at the end of 2020 in each msrket place


with cte as
(
select *,ROW_NUMBER() over(partition by customer_id order by event_date desc) as rn
from subscription_history
where event_date<='2020-12-31'
)
select *,dateadd(month,subscription_period,event_date) as validationdate from cte 
where rn=1 and event!='c' and dateadd(month,subscription_period,event_date)>='2020-12-31';