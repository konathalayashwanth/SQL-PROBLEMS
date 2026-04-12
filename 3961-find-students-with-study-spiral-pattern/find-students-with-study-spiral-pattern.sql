/* Write your T-SQL query statement below */

with cte as (
select s.student_id,subject,session_date,total_study_hours,cycle_length ,datediff(day,session_date,lead(session_date,1,session_date) over (partition by s.student_id order by session_date asc)) as no_days
from(
select student_id,sum(hours_studied)  as total_study_hours ,count(distinct subject) as cycle_length 
from study_sessions
group by student_id 
having count(distinct subject) >=3
)t inner join study_sessions s 
on s.student_id=t.student_id
 )
,cte2 as(
select  student_id,max(cycle_length) as cycle_length,max(total_study_hours) as total_study_hours
from(
select student_id,subject,cycle_length,total_study_hours,lead(subject,cycle_length) over (partition by student_id order by  session_date ) as circle_subject
from cte
where  no_days <3 )t
where circle_subject=subject  
group by student_id
having count(distinct circle_subject)>=3
)

select  s.student_id,s.student_name,s.major,c.cycle_length,c.total_study_hours
from cte2 c inner join students s 
on c.student_id=s.student_id 
order by  cycle_length desc ,total_study_hours desc  


