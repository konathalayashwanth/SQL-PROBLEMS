


select * from orders6

with cte as
(
select productid,year(purchasedate) as  y1,count(*) as cnt from orders6
group by  productid,year(purchasedate)
having count(*)>=3
),cte2 as
(
select *,lag(y1) over(partition by productid order by y1) as y2 from cte
)
select productid from cte2 
where y1-y2=1