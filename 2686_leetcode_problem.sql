use indianbank


select * from Delivery



with cte as
(
select *, case when customer_pref_delivery_date=order_date then 'immediate' else 'scheduled' end as type
from delivery
)
select order_date,round(sum(case when type='immediate' then 1 else 0 end)/count(*)*100,2) as percentage from cte
group by order_date