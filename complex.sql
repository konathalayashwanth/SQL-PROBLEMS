



create table emp3(
emp3_id int,
emp3_name varchar(20),
department_id int,
salary int,
manager_id int,
emp3_age int);



insert into emp3
values
(1, 'Ankit', 100,10000, 4, 39);
insert into emp3
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emp3
values (3, 'Vikas', 100, 10000,4,37);
insert into emp3
values (4, 'Rohit', 100, 5000, 2, 16);
insert into emp3
values (5, 'Mudit', 200, 12000, 6,55);
insert into emp3
values (6, 'Agam', 200, 12000,2, 14);
insert into emp3
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emp3
values (8, 'Ashish', 200,5000,2,12)
insert into emp3
values (9, 'Mukesh',300,6000,6,51)
insert into emp3
values (10, 'Rakesh',300,7000,6,50);



select * from emp3

with cte as
(
select department_id,avg(salary) as departmentavg,count(*) as noofemployees,sum(salary) as totalsalary from emp3
group by department_id
),cte2 as
(
select c1.department_id,c1.departmentavg,sum(c2.noofemployees) as noofemp,
sum(c2.totalsalary) as totalsalary,sum(c2.totalsalary)/sum(c2.noofemployees) as companyavgsalary
from cte c1 inner join cte c2 
on c1.department_id!=c2.department_id
group by c1.department_id,c1.departmentavg
)
select department_id,departmentavg,companyavgsalary from cte2
where departmentavg<companyavgsalary;
