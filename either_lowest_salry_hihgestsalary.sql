drop table employee5;


create table employee5
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee5 values(101, 'Mohan', 'Admin', 4000);
insert into employee5 values(102, 'Rajkumar', 'HR', 3000);
insert into employee5 values(103, 'Akbar', 'IT', 4000);
insert into employee5 values(104, 'Dorvin', 'Finance', 6500);
insert into employee5 values(105, 'Rohit', 'HR', 3000);
insert into employee5 values(106, 'Rajesh',  'Finance', 5000);
insert into employee5 values(107, 'Preet', 'HR', 7000);
insert into employee5 values(108, 'Maryam', 'Admin', 4000);
insert into employee5 values(109, 'Sanjay', 'IT', 6500);
insert into employee5 values(110, 'Vasudha', 'IT', 7000);
insert into employee5 values(111, 'Melinda', 'IT', 8000);
insert into employee5 values(112, 'Komal', 'IT', 10000);
insert into employee5 values(113, 'Gautham', 'Admin', 2000);
insert into employee5 values(114, 'Manisha', 'HR', 3000);
insert into employee5 values(115, 'Chandni', 'IT', 4500);
insert into employee5 values(116, 'Satya', 'Finance', 6500);
insert into employee5 values(117, 'Adarsh', 'HR', 3500);
insert into employee5 values(118, 'Tejaswi', 'Finance', 5500);
insert into employee5 values(119, 'Cory', 'HR', 8000);
insert into employee5 values(120, 'Monica', 'Admin', 5000);
insert into employee5 values(121, 'Rosalin', 'IT', 6000);
insert into employee5 values(122, 'Ibrahim', 'IT', 8000);
insert into employee5 values(123, 'Vikram', 'IT', 8000);
insert into employee5 values(124, 'Dheeraj', 'IT', 11000);


select * from employee5


select c.*
from employee5 e join
(
select *,max(salary) over(partition by dept_name order by (select (null))) as maxsalary,
min(salary) over(partition by dept_name order by (select (null))) as minsalary
from employee5
) as c
on e.emp_ID=c.emp_ID and (e.SALARY=c.maxsalary or e.SALARY=c.minsalary)
