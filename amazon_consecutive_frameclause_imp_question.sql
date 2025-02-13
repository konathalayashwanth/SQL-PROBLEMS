use indianbank


create table emp_attendance
(
	employee 	varchar(10),
	dates 		date,
	status 		varchar(20)
);


insert into emp_attendance values('A1', '2024-01-01', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-02', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-03', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-04', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-05', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-06', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-07', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-08', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-09', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-10', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-06', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-07', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-08', 'ABSENT');
insert into emp_attendance values('A2', '2024-01-09', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-10', 'ABSENT');

select * from emp_attendance

with cte as
(
select *,row_number() over(partition by employee order by dates) as rn
from emp_attendance
),cte_present as
(
select *, row_number() over(partition by employee order by dates) as rn1,
   rn-row_number() over(partition by employee order by dates)  as flag
   from cte
   where status='present'
),cte_absent as
(
select *, row_number() over(partition by employee order by dates) as rn1,
   rn-row_number() over(partition by employee order by dates)  as flag
   from cte
   where status='absent'
)
select  employee,
first_value(dates) over(partition by employee,flag order by dates) as from_date,
last_value(dates)over(partition by employee,flag order by dates range between unbounded preceding and unbounded following) as to_date,
status
from cte_present
union 
select  employee,
first_value(dates) over(partition by employee,flag order by dates) as from_date,
last_value(dates)over(partition by employee,flag order by dates range between unbounded preceding and unbounded following) as to_date,
status
from cte_absent






