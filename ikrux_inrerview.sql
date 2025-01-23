create table emp8(empid int, empname varchar(50), salary int, deptid int)
insert into emp8 values (1,'Nikitha',45000,206),(2,'Ashish',42000,207),(3,'David',40000,206),(4,'Ram',50000,207),(5,'John',35000,208),(6,'Mark',50000,207),(7,'Aravind',39000,208)


create table dept8 (deptid int, deptname varchar(50))
insert into dept8 values (206,'HR'),(207,'IT'),(208,'Finance')


select * from emp8

select * from dept8


with cte as
(
select a.*,b.deptname,rank() over(partition by deptname order by salary desc) as rn from emp8 a inner join dept8 b on a.deptid=b.deptid
)
select deptname,string_agg(empname,',') as  modifiedname
from cte
where rn=1
group by deptname

