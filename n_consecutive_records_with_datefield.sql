select * from orders89

with cte as
(
select *,row_number() over(order by order_date) as rn ,
day(order_date) as day,
day(order_date)-row_number() over(order by order_date) as diff
from orders89
)
select order_id,order_date,cnt from 
(
select *,count(diff) over(partition by diff order by diff) as cnt from cte
) as k
