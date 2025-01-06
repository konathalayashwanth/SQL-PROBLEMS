select * from product2

select * from sales2

with cte as
(
select a.userid,a.productid,sum(quantity*price) as total from sales2 a inner join product2 b on a.productid=b.productid
group by a.userid,a.productid
),cte2 as
(
	 select *,rank() over(partition by userid order by total desc) as rk from cte
)
select userid,productid from cte2 
where rk=1
