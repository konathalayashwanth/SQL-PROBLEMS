# Write your MySQL query statement below

with currated_users as
(
select 
user_id
from course_completions 
group by user_id
having count(*)>=5 and avg(course_rating)>=4
),next_cte as
(
select
c.course_name as first_course,
lead(course_name,1) over(partition by c.user_id ORDER BY c.completion_date) as second_course
from currated_users u inner join course_completions c
on u.user_id=c.user_id
)
select first_course,
second_course,
count(*) as transition_count
from next_cte
where second_course is not null
group by first_course,second_course
order by transition_count desc,first_course asc,second_course asc;