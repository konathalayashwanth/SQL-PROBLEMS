use indianbank



select * from members

select * from visits

select * from purchases

with cte as
(
select a.memberid,a.name,b.visitid,c.chargedamount
from members a left join visits b
on a.memberid=b.memnberid
left join purchases c
on b.visitid=c.visitid
),cte2 as
(
select memberid,name,sum(case when chargedamount is not null then 1 else 0 end)/count(*)*100 as conversionrate
from cte
group by memberid,name
)
select memberid,name,
				case
					when conversionrate>=80 then 'Diamond'
					when conversionrate>=50 and conversionrate<80 then 'Gold'
					when conversionrate<50 and  memberid in (select distinct memnberid from visits) then 'Silver'
					else 'Bronze'
					end as category
					from cte2