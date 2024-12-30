select * from purchases1


with cte as
(
select *,lead(purchasdedate) over(partition by userid order by purchasdedate) as nextday
from purchases1
)
select  distinct userid from cte
where datediff(dd,purchasdedate,nextday)>=7


	
	
	

