


with cte as
(
select *,min(ordertype) over(partition by customerid) as rn
from orders4
)
select orderid,customerid,ordertype
from cte
where ordertype=rn;