select * from swiggy_orders


select * from sales_data


----counn the no of delay orders

select Del_Partner,count(*) as del_partner_cnt_delay_cnt from
(
select *,datediff(minute,order_time,deliver_time) as actual_time
from swiggy_orders
) as k
where predicted_time<actual_time
group by Del_Partner




---3rd highestsale for productid '4' interms of value(sale:qtysold,value:qtysold*productvalue)

select * from sales_data


select order_date,product_id,totalsale from
(
select *,rank() over(order by totalsale desc) as rn from
(
select order_date,product_id,sum(sale*order_value) as totalsale
from sales_data
where product_id=4
group by order_date,product_id
) as k
) as j
where j.rn=3;