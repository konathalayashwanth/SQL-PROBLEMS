select * from activity

--find the active users

select event_date,count(distinct user_id) as activeusers
from activity
group by event_date


--find the total active users each week

select datepart(week,event_date) as weeknum,count(1) as total_acitve_users
from activity
group by datepart(week,event_date)



--day wise total no of users  who made the purchase and install same day...


select * from activity



with cte as
(
select event_date,count(*) as no_of_users_same_day_purchase
from
(
select user_id,event_date,count(distinct event_name) as eventnames
from activity
group by user_id,event_date
having count(distinct event_name)>1
) as k
group by event_date
),cte2 as
(
select distinct event_date from activity
)
select cte2.event_date,isnull(no_of_users_same_day_purchase,0) as no_of_users_same_day_purchase  from cte2 left join cte
on cte2.event_date=cte.event_date


--find the percentage of paid users in india,usa,and other country should be tagged as others


with paidusers as
(
select case when country in('india','usa') then country else 'others' end as newcountry
,count(distinct user_id) as noofpaidusers from activity
where event_name='app-purchase'
group by case when country in('india','usa') then country else 'others' end
),totaluserscount as
(
select sum(noofpaidusers) as total from paidusers
)
select newcountry,
round(noofpaidusers*1.0/total*100.0,0) as percentageofpaidusers
from paidusers,totaluserscount





---write a query to find among all the users who installed the app on a givenday,howm many did in apppurchase on very next day


select * from activity

with prevactivity as
(
select *, 
lag(event_name) over(partition by user_id order by event_date) as prev_event_name,
lag(event_date) over(partition by user_id order by event_date) as prev_event_date
from activity
),finalresult as
(
select event_date,count(1) as totalcnt
from
(
select * from prevactivity
where event_name='app-purchase' and prev_event_name='app-installed' and datediff(day,prev_event_date,event_date)=1
) as k
group by event_date
)
select distinct a.event_date,isnull(f.totalcnt,0) as totalcount from activity a left join finalresult f
on a.event_date=f.event_date


