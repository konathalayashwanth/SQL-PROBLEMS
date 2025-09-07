select * from orders57


select * from productss



---
with cte as
(
select order_id,name,row_number() over(partition by order_id order by name) as rn from
(
select order_id,
	   name,
	   count(order_id) over(partition by order_id order by (select null)) as cnt
from orders57 o inner join productss p
on o.product_id=p.id
) as k
where cnt>1
),pairs as
(
select order_id,concat(min(name),'',max(name)) as pair from cte
where rn in(1,2)
group by order_id
union all
select order_id,concat(min(name),'',max(name)) as pair from cte
where rn in(1,3)
group by order_id
union all
select order_id,concat(min(name),'',max(name)) as pair from cte
where rn in(2,3)
group by order_id
)
select pair,count(*) as purchase_freq
from pairs
group by pair