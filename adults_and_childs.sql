
with adults as 
(
select *,row_number() over(order by age asc) as rn
from family
where type='adult'
),childs as
(
 select *,row_number() over(order by age asc) as rn
from family
where type='child')
select a.person,c.person,a.age,c.age from adults a left join childs c
on a.rn=c.rn
