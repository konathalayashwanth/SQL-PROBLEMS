create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')



select * from entries


with cte as
(
select name,floor,count(*) as cnt,case when count(*)>1 then floor else null end as highestvisits from entries
group by name,floor
),
cte2 as
(
select   distinct name,value as resources__where_used from entries cross apply string_split(resources,',')
),
cte3 as
(
select name,string_agg(resources__where_used,',') as resources_used from cte2
group by name
)
select a.name,highestvisits,resources_used,sum(cnt) as totalvisits from cte a join cte3 b on a.name=b.name
where highestvisits is not null
group by a.name,highestvisits,resources_used


select * from entries

--another way

with distinct_resources as
(
select  name,resources from entries
),agg_resources as
(
select name,string_agg(resources,',') as resources_used from distinct_resources
group by name
),total_visits as
(
select name,count(*) as noofvisits,string_agg(resources,',') as used_resources from entries
group by name
),floor_visits as
(
select name,floor,count(*) as nooffloorvisits,rank() over(partition by name order by count(*) desc) as rn
from entries
group by name,floor
)
select distinct fv.name,tv.noofvisits,fv.floor as mostvisitedfloor,av.resources_used
from floor_visits fv inner join agg_resources av
on fv.name=av.name
inner join total_visits tv
on fv.name=tv.name
where rn=1