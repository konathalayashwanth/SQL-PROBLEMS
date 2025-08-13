select customerid from
(
select customerid,count(*) as noofproductsbought
from customer1
group by customerid
having count(*)=(select count(*) from product1)
) as k