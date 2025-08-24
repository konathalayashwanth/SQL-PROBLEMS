select customerid,sum(revenue) as total
from adobetransactions
where customerid in(select distinct customerid from adobetransactions where product='photoshop')
and product!='photoshop'
group by customerid