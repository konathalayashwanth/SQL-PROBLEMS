

with cte as
(
select *,datename(dw,submitdate) as wk from tasks
),cte2 as
(
select count(*) as workingcnt from cte
where wk in('monday','tuesday','wednesday')
),cte3 as
(
	select count(*) as weekendcnt from cte
	where wk in('saturday','sunday')
)
select workingcnt,weekendcnt from cte2 a join cte3 b
on a.workingcnt=b.weekendcnt