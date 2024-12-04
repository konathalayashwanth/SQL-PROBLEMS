create table employees
(
	employee_id			int     primary key,
	employeename		varchar(20)    not null,
	managerid			int				not null
)
go



insert into employees values(1,'Boss',1)
insert into employees values(3,'Alice',3)
insert into employees values(2,'Bob',1)
insert into employees values(4,'Daniel',2)
insert into employees values(7,'Luis',4)
insert into employees values(8,'Jhon',3)
insert into employees values(9,'Angela',8)
insert into employees values(77,'Robert',1)




select e1.employee_id as id from

employees e1 inner join employees e2
on e1.managerid=e2.employee_id

inner join employees e3
on e2.managerid=e3.employee_id

inner join employees e4
on e3.managerid=e4.employee_id

where e1.employee_id<>1 and (e2.employee_id=1 or e3.employee_id=1 or e4.employee_id=1);