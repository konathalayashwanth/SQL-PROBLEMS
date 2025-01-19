create table emp (
emp_id int,
salary_component_type varchar(20),
val int
);
insert into emp
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);



select * from emp



select emp_id,[salary],[bonus],[hike_percent] from
(
	select emp_id,salary_component_type,val 
	from emp
) as sourcetable
pivot
( 
	sum(val)
	for salary_component_type in ([salary],[bonus],[hike_percent])
	) as pivottable