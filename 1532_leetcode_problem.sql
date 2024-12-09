

with cte1 as(
select *,rank() over (partition by customerid order by orderdate desc) as rk from orders2
),
cte2 as
(
select * from cte1
where rk<=3
)
select name,a.customerid,a.orderid,a.orderdate from cte2  a inner join customers2 b
on a.customerid=b.customerid
order by name asc,a.customerid asc,a.orderdate desc;