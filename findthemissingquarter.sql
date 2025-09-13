select * from stores

--find the missingquater for each store

select store,
'Q'+cast(10-sum(cast(right(quarter,1) as int)) as char(2)) missingquater 
from stores
group by store


--recursive cte 2ndmethod

with cte as
(
select distinct store, 1 as qno from stores
union all
select store,qno+1 from cte
where cte.qno<4
),cte2 as
(
select store,
'Q'+cast(qno as varchar(1)) as quarters
from cte
)
select cte2.store,cte2.quarters as missingquarters from cte2 left join stores s
on cte2.store=s.store and cte2.quarters=s.quarter
where s.quarter is null







