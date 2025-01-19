select  * from departments


select * from employees3

--Part 1: Find the top 3 highest-paid employees in each department.
--Part 2: Find the average salary of employees hired in the last 5 years.
--Part 3: Find the employees whose salry is less than the average salary of employees hired in the last 5 years.


--1

select * from
(
select a.departmentid as department1,departmentname,employeeid,firstname,lastname,b.departmentid as department2,salary,datehired,
rank() over(partition by departmentname order by salary desc) as highestrank
from departments a inner join employees3 b
on a.DepartmentID=b.DepartmentID
) as k
where k.highestrank<=1




--2

select *,avg(salary) as averageincome from employees3
where datediff(yy,datehired,getdate())=5
group by employeeid,firstname,lastname,departmentid ,salary,datehired


--3




select * from Employees3
where Salary<(select avg(salary) as averageincome from employees3 where datediff(yy,datehired,getdate())=5)







