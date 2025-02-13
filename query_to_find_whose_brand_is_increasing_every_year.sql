use indianbank


---Q wirite a query to fetch the record of brand whose amount is increasing every year...

with cte as
(
select *,case when amount<lead(amount,1,amount+1) over(partition by brand order by year asc) then 1 else 0 end as flag
from brands1
)
select * from brands1
where brand not in(select brand from cte where flag=0)

