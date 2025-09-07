select * from billings

select * from hoursworked

with daterange as
(
select *,
lead(dateadd(day,-1,bill_date),1,'9999-12-31') over(partition by emp_name order by bill_date) as billdateend
from billings
)
select d.emp_name,
sum(d.bill_rate*hw.bill_hrs) as totalcharges
from daterange d inner join hoursworked hw
on d.emp_name=hw.emp_name and hw.work_date between d.bill_date and d.billdateend
group by d.emp_name