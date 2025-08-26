 select * from membership_type;
select * from membership;


select mt.name as membership_type_name,
year(m.start_date) as year,
month(m.start_date) as month,
sum(m.total_paid) as totalrevenue
from membership_type mt inner join membership m
on mt.id=m.membership_type_id
group by rollup ((mt.name),year(m.start_date),month(m.start_date))


