select * from orders3



select * from products3


with cte as
(
  select *,rank() over(partition by productid order by orderdate desc) as rk
  from orders3
)
select b.productname,a.productid,a.orderid,a.orderdate from cte a inner join products3 b
on a.productid=b.productid
where rk=1