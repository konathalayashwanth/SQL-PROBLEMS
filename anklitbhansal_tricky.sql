


select * from assessments



--Q--write ann sql query for each experience level counts the total no of candidates and how many of them got a perfect score in each category 
--which they requested to solve taksks(null means the candit=date was not requested to solve task in that category)


select experience,count(*) as totalstudents,SUM(case when ( case when sql is null  or sql=100 then 1 else 0 end +
         case  when algo is null  or algo=100 then 1 else 0 end +
        case when bug_fixing is null  or bug_fixing=100 then 1 else 0 end )=3 then 1 else 0 end) as maxscore
from assessments
group by experience