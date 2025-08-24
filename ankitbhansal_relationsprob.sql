

with parents as
(
select c_id,
max(case when gender='m' then name end) as father,
max(case when gender='f' then name end) as mother
from  relations1 r left join people p
on r.p_id=p.id
group by c_id
)
select r.name as child,fm.father,fm.mother from people r inner join parents fm
on r.id=fm.c_id
