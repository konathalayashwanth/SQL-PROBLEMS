with tiv2015 as
(
select 
tiv_2015
from insurance
group by tiv_2015
having count(*)>1
),
lat_and_lon as
(
select 
lat,
lon
from insurance
group by lat,lon
having count(*)=1
)
select 
round(sum(i.tiv_2016),2) as tiv_2016 
from
insurance i inner join tiv2015
on i.tiv_2015 =tiv2015.tiv_2015 
inner join lat_and_lon
on i.lat=lat_and_lon.lat and i.lon=lat_and_lon.lon;