select * from experiments


with cte as
(
select * from 
( select 'IOS' AS platform 
  union
  select 'WEB' AS platform 
  union
  select 'ANDROID' AS platform 
) as k1
cross join
(select 'programming' as experimentname
   union
   select 'reading' as experimentname
   union
   select 'sports' as experimentname
) as k2
),cte2 as
(
select platform,experimentname,count(*) as num_experiments from experiments
group by platform,experimentname
)
select a.platform,a.experimentname,coalesce(b.num_experiments,0) as numofexperiments from cte a left join cte2 b
on a.platform=b.platform and a.experimentname=b.experimentname




