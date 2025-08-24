with cte as
(
select *,
lag(revenue,1,0) over(partition by company order by year) as prevrevenue,
revenue-lag(revenue,1,0) over(partition by company order by year) as salesdiff,
count(1) over(partition by company) as cnt
from company_revenue)
select company,cnt,count(1) as totalyearsincremented from cte
where salesdiff>0
group by company,cnt
having count(1)=cnt