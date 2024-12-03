select * from events


with cte as
(
select *,avg(occcurences) over(partition by event_type) as average_activity
from events
)
select business_id from cte
where occcurences>average_activity
group by business_id
having count(event_type)>1