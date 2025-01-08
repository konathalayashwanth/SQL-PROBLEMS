
select studentid,departmentid,round(100*percent_rank() over(partition by departmentid order by mark desc),2) as percentage 
from students
