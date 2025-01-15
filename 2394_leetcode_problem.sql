select * from  logs2


select * from employees2

with cte
as
(
select employee_id,
		sum(datediff(ss, in_time,out_time)/60) as totaltime from
		logs2
		group by employee_id
)
select a.employee_id from Employees2 a
left join cte b
on a.employee_id=b.employee_id
where a.needed_hours*60> coalesce(b.totaltime,0)