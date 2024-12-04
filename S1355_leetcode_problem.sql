use indianbank



create table Activities
(
	id   int    primary key,
	name	varchar(20)     not null,
)
go


insert into friends values(1,'Jonathan D','Eating')
insert into friends values(2,'Jade W','Singing')
insert into friends values(3,'Victor J','Singing')
insert into friends values(4,'Elvis D','Eating')
insert into friends values(5,'daniel A','Eating')
insert into friends values(6,'Bob B ','Horse Riding')


insert into Activities values(1,'Eating')
insert into Activities values(2,'Singing')
insert into Activities values(3,'Horse Riding')


select * from friends


select * from Activities

select max(activity) as activity from
(
	select a.id,activity from friends a inner join Activities b
	on a.id=b.id
) as k

