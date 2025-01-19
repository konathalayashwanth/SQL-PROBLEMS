use indianbank



create table employee_info(emp_id varchar(10),company varchar(10),salary int,dept varchar(10));

insert into employee_info values('emp1','X',1000,'Sales')
insert into employee_info values('emp2','X',1020,'IT')
insert into employee_info values('emp3','X',870,'Sales')
insert into employee_info values('emp4','Y',1200,'Markrting')
insert into employee_info values('emp5','Y',1500,'IT')
insert into employee_info values('emp6','Y',1100,'Sales')
insert into employee_info values('emp7','Z',1050,'IT')
insert into employee_info values('emp8','Z',1350,'Markrting')
insert into employee_info values('emp9','Z',1700,'sales')


select * from employee_info

with cte as
(
select *,row_number() over(partition by company order by salary asc) as rn,
row_number() over(partition by company order by salary desc) as hn
from employee_info
)
select company,max(case when hn=1 then salary end) as max_salary,
min(case when rn=1 then salary end) as min_salary
from cte
group by company