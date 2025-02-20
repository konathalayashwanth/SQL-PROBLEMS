select * from emp_info

use indianbank


create table emp_info(id int, name varchar(10),dept varchar(10),salary int);

insert into emp_info values(1,'Akash','Sales',100)
insert into emp_info values(2,'John','Sales',110)
insert into emp_info values(3,'Rohit','Sales',100)
insert into emp_info values(4,'Tom','IT',200)
insert into emp_info values(5,'Subham','IT',205)
insert into emp_info values(6,'Vabna','IT',200)
insert into emp_info values(7,'Prativa','Marketing',150)
insert into emp_info values(8,'Rahul','Marketing',155)
insert into emp_info values(9,'yash','Marketing',160)



----Q find the employees who are getting same salary  as another employee in same department


select name,dept,salary from
(
select *,count(*) over(partition by dept,salary order by salary) as cnt from emp_info
) as k
where k.cnt=2