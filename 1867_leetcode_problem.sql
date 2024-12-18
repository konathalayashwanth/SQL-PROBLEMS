select * from orderdetails


with cte as
(
select orderid,max(quantity) as mw,sum(1.0 * quantity)/count(*) as averagequantity
from orderdetails
group by orderid
)
select orderid from cte
where mw> all (select averagequantity from cte)