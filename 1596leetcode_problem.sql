select * from customers5


select * from orders5


select * from products5




with cte as
(
   select customerid,productid,count(*) as tk from orders5
   group by customerid,productid
)
,cte2 as
(
	select *,rank() over(partition by customerid order by tk) as rk from cte
),cte3 as 
(
select * from cte2
where rk=1
)
select a.customerid,a.productid,b.productname from cte3 a inner join products5 b
on a.productid=b.productid