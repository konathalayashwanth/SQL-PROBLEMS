select * from traffic

---write an sql query to report for every date within at most90 days from today,thenumber of users that logged in for the firsttime on that date.
--Assume today is '2029-06-30'.

with cte as
(
select user_id,min(activity_date) as login_date from traffic
where activity='login'
group by user_id
)
select login_date,count(login_date) as user_count from cte
where login_date between dateadd(dd,-90,'2019-06-30') and dateadd(dd,90,'2029-06-30')
group by login_date