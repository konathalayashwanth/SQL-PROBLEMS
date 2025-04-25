create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
create table holidays
(
holiday_date date
,reason varchar(100)
);

insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');


select  * from tickets

select * from holidays



select ticket_id,create_date,resolved_date,datediff(dd,create_date,resolved_date)-
2*datediff(week,create_date,resolved_date) -noofholidays as workingdays
from (
select ticket_id,create_date,resolved_date,count(holiday_date) as noofholidays
from tickets t left join holidays h
on h.holiday_date between t.create_date and t.resolved_date
group by ticket_id,create_date,resolved_date) as k

