/* Write your T-SQL query statement below */
with cte as(
select e.employee_id,e.name,review_date ,rating ,row_number() over (partition by e.employee_id order by review_date desc) as rn 
,lead(rating,1,0) over (partition by e.employee_id order by review_date desc) as next_rating,
lead(rating,2,0) over (partition by e.employee_id order by review_date desc) as sec_next_rating
,count(*) over (partition by e.employee_id ) as cnt 
from performance_reviews pr inner join employees e 
on pr.employee_id =e.employee_id  )
select employee_id ,name ,rating-sec_next_rating as improvement_score 
from cte 
where cnt>2 and rn =1 and rating >next_rating and next_rating >sec_next_rating 
order by improvement_score desc ,name asc