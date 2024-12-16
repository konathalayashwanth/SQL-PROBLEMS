select * from transactions1



with cte as
(
select transactionid,oneday,max(amount)  as highest
from transactions1
group by  transactionid,oneday
),cte2 as 
(
	select *,rank() over(partition by oneday order by highest desc) rk
	from cte
)
select * from cte2
where rk=1
order by 1 asc