/* Write your T-SQL query statement below */
with cte as
(
select *,
row_number() over(order by rollingsum) as rn
from
(
select
person_name,
sum(weight) over(order by turn asc) as rollingsum
from queue
) as k
where rollingsum<=1000 
)
select person_name
from
(
select *,
last_value(rollingsum) 
over(order by rn ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as lastvalue
from cte
) as g
where rollingsum=lastvalue


