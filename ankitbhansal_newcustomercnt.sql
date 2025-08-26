
select datename(mm,order_date) as month,COUNT(*) as newcustomercount from
(
select *,ROW_NUMBER() over(partition by customer order by order_date) as rn
from sales
) as k
where k.rn=1
group by datename(mm,order_date)