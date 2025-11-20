/* Write your T-SQL query statement below */
with firstpositvetest
as(
select patient_id,
       min(test_date) as firstpostivetestdate
       from 
       covid_tests
       where result='positive'
       group by patient_id
),firstnegativetest as
(
select c.patient_id,
       min(c.test_date) as firstnegativetestdate
       from 
       covid_tests c  inner join firstpositvetest fp
       on c.patient_id=fp.patient_id
       where c.result='Negative'  and c.test_date>firstpostivetestdate
       group by c.patient_id 
)
select
fpt.patient_id,
p.patient_name,
p.age,
datediff(day,fpt.firstpostivetestdate,fnt.firstnegativetestdate) as recovery_time 
from
firstpositvetest fpt inner join firstnegativetest fnt
 on fpt.patient_id=fnt.patient_id
 inner join patients p
 on p.patient_id=fpt.patient_id
order by recovery_time,p.patient_name;
       