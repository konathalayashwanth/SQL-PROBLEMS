create table clocked_hours(
empd_id int,
swipe time,
flag char)

insert into clocked_hours values
(11114,'08:30','I'),
(11114,'10:30','O'),
(11114,'11:30','I'),
(11114,'15:30','O'),
(11115,'09:30','I'),
(11115,'17:30','O');

select * from clocked_hours


with cte as
(
select *,lead(swipe,1) over(partition by empd_id order by swipe asc) as next_swipe,
		 lead(flag,1) over(partition by empd_id order by swipe asc) as next_flag
		 from clocked_hours
),cte2 as
(
select empd_id,datediff(hour,swipe,next_swipe) as totalhours
from cte
where flag='I' and next_flag='o'
)
select empd_id,sum(totalhours) as totalhours
from cte2
group by empd_id;