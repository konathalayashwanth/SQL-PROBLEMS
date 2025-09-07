-----totalsalesbyproduct

select * from sales

with cte as
(
select min(period_start) as dates,max(period_end) as maxdate---anchor query
from sales
union all
select dateadd(day,1,dates),maxdate---recursive query
from cte
where dates<maxdate--filter
)
select s.product_id,year(c.dates) as yearnum,sum(s.average_daily_sales) as totalsales
from cte c inner join sales s on c.dates between s.period_start and s.period_end
group by s.product_id,year(c.dates)
order by 1 asc
option(maxrecursion 1000);