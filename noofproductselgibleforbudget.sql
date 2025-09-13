select * from customer_budget

select * from products2


select customer_id,budget,count(1) as noofproducts,string_agg(product_id,',') as listofproducts
from
(
select *,sum(cost) over(partition by customer_id order by cost) as runningcost
from customer_budget,products2
) as k
where budget>=runningcost
group by customer_id,budget
