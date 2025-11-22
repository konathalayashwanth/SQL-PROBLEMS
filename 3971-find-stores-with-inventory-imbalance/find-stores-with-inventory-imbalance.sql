/* Write your T-SQL query statement below */

with cte as (
select s.store_id ,s.store_name ,s.location ,max(price) as mx_price ,min(price) as mn_price
from inventory i inner join stores s 
on i.store_id =s.store_id 
group by s.store_id ,s.store_name ,s.location 
having count(distinct product_name)>2
)
,max_product as (
select c.store_id,c.store_name,c.location,i.quantity ,product_name as most_exp_product 
from cte c inner join  inventory i  
on c.store_id =i.store_id and i.price=c.mx_price )
,min_product as (
select c.store_id,c.store_name,c.location,i.quantity 
,product_name as cheapest_product   
from cte c inner join  inventory i  
on c.store_id =i.store_id and i.price=c.mn_price )


select c2.store_id,c2.store_name,c2.location,c2.most_exp_product,c3.cheapest_product ,
round(c3.quantity*1.0/c2.quantity ,2) as imbalance_ratio  
from max_product c2 inner join min_product c3 
on c2.store_id =c3.store_id 
where c2.quantity <c3.quantity
order by imbalance_ratio desc ,store_name asc 