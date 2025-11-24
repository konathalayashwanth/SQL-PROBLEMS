/* Write your T-SQL query statement below */





select customer_id ,count(*) as total_orders ,
ceiling(sum(case when datepart(hour,order_timestamp) in(11,12,13,18,19,20) then 1 else 0 end)*100.00/count(*))  as peak_hour_percentage
,round(avg(order_rating*1.00),2) average_rating
from restaurant_orders 
group by  customer_id 
having count(order_rating)*1.00/count(*) >0.5 
and round(avg(order_rating*1.00),2) >=4 
and count(order_id)>=3 
and sum(case when datepart(hour,order_timestamp) in(11,12,13,18,19,20) then 1 else 0 end)*1.00/count(*) >=0.6 
order by average_rating desc ,customer_id desc 