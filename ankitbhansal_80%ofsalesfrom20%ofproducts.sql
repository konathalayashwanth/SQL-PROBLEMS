select * from superstore_orders$


----find the 80% of sales from 20% of products


select sum(sales)*0.8 from superstore_orders$--1837760.68823997 products should generate this value

with totalsales as
(
select product_id,sum(sales) as totalsalesbyproduct
from superstore_orders$
group by product_id
),calcsales as
(
select *,
sum(totalsalesbyproduct) over(order by totalsalesbyproduct desc rows between unbounded preceding and current row) as runningtotal,
0.8*sum(totalsalesbyproduct) over()  as eightypercentofsales
from totalsales
)
select * from calcsales
where runningtotal<=eightypercentofsales


 select 413*1.0/1862*100






