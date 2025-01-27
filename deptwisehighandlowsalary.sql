use indianbank



create table emp2(id int,emp_name varchar(20),gender varchar(10),dept varchar(20),salary int)

insert into emp2 values (1, 'Tildie', 'Female', 'Support', 1676);
insert into emp2 values (2, 'Averil', 'Female', 'Engineering', 1572);
insert into emp2 values (3, 'Matthiew', 'Male', 'Engineering', 1477);
insert into emp2 values (4, 'Reinald', 'Male', 'Services', 1877);
insert into emp2 values (5, 'Karola', 'Genderqueer', 'Marketing', 1029);
insert into emp2 values (6, 'Manon', 'Genderfluid', 'Research and Development', 1729);
insert into emp2 values (7, 'Tabbie', 'Female', 'Research and Development', 1000);
insert into emp2 values (8, 'Corette', 'Female', 'Marketing', 1624);
insert into emp2 values (9, 'Edward', 'Male', 'Accounting', 1157);
insert into emp2 values (10, 'Philipa', 'Female', 'Human Resources', 1992);
insert into emp2 values (11, 'Ingeberg', 'Female', 'Services', 1515);
insert into emp2 values (12, 'Kort', 'Male', 'Support', 1005);
insert into emp2 values (13, 'Shelby', 'Male', 'Product Management', 1020);
insert into emp2 values (14, 'Shelden', 'Male', 'Legal', 1354);
insert into emp2 values (15, 'Sonya', 'Female', 'Marketing', 1321);


select * from emp2

---1st approach

with cte as
(
select *,row_number() over(partition by dept order by  salary asc) as min_rn,
		 row_number() over(partition by dept order by  salary desc) as max_rn
		 from emp2
)
select dept,
	   max(case when min_rn=1 then emp_name end) as lowestsalary,
	   min(case when max_rn=1 then emp_name end) as highestsalary
	   from cte
	   group by dept;


------2ndapproach
with cte as
(
select dept,min(salary) as lowestsalary,max(salary) as highestsalary
from emp2
group by dept
)
select a.dept,b.emp_name,c.emp_name
from cte a inner join emp2 b
on a.dept=b.dept and a.lowestsalary=b.salary
inner join emp2 c on
a.highestsalary=c.salary;




