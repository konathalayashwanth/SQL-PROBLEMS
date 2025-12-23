
with cte as
(
select
top 1
u.name as results
from users u 
inner join movierating mr
on u.user_id=mr.user_id
group by u.name
order by count(*) desc,u.name asc
union all
select 
top 1
m.title
from movies m inner join movierating mr
on m.movie_id=mr.movie_id
where month(created_at)=2 and year(created_at)=2020
group by m.title
order by avg(mr.rating * 1.0) desc,m.title asc
)
select
results
from cte



