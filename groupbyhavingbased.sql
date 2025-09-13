---find the companies who have atleast 2 users who speaks both german and english


with cte as
(
select company_id,USER_ID
from company_users
where language in('english','german')
group by company_id,USER_ID
having count(*)=2
)
select company_id
from cte
group by company_id
having count(8)=2




select * from company_users


