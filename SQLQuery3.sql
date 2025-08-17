with cte as
(
select lat,lon,count(*) as uniquecities
from insurance
group by lat,lon
having count(*)=1
),cte2 as
(
select tiv_2015,count(*) as repeatedinvests
from insurance
group by tiv_2015
having count(*)>1
)
select round(sum(tiv_2016)*1.0,2) as total_investment_2016
from insurance i inner join cte
on i.lat=cte.lat and i.lon=cte.lon
inner join cte2
on i.tiv_2015=cte2.tiv_2015