/* Write your T-SQL query statement below */
with invalidlogs
as(

select
log_id
from logs cross apply string_split(ip,'.')
group by log_id
having count(*)<>4
or(sum(case when value>255 or value like '0%' then 1 else 0 end)>0)
)
select ip,count(*) as invalid_count
from invalidlogs as il,logs as l
where il.log_id=l.log_id
group by ip
order by invalid_count desc,ip desc;