----trickyquestions

select state,min(date_value) as startdate,max(date_value) as enddate
from
(
select *,row_number() over(partition by state order by date_value) as rn,
dateadd(day,-1*row_number() over(partition by state order by date_value),date_value) as groupstate
from tasks
) as k
group by state,groupstate