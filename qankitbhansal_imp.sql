create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_orders

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

use indianbank

Q---write query for each order_date repeated customers and new customers



select * from customer_orders

with newcustomers as
(
select customer_id,min(order_date) as first_visitdate
from customer_orders
group by customer_id
),cte2 as
(
select co.*,fv.first_visitdate,
case when co.order_date=fv.first_visitdate then 1 else 0 end as newlycustomer,
case when co.order_date!=fv.first_visitdate then 1 else 0 end as oldcustomer
from customer_orders co inner join newcustomers fv
on co.customer_id=fv.customer_id
)
select order_date,sum(newlycustomer) as noofnewcustomers,sum(oldcustomer) as  noofrepeatcustomer
from cte2
group by order_date;

