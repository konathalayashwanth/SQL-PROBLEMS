use indianbank

create table ticket(ticket_id int,issue_date date,resolve_date date)

insert into ticket values(1,'2024-12-18','2025-01-7')
insert into ticket values(2,'2024-12-20','2025-01-10')
insert into ticket values(3,'2024-12-22','2025-01-11')
insert into ticket values(4,'2025-01-02','2025-01-13')

create table holiday_cal(holiday_date date,occasion varchar(15))
insert into holiday_cal values('2024-12-25','christmas')
insert into holiday_cal values('2025-01-01','new_year')


select * from holiday_cal


with cte as
(
select *,datediff(day,issue_date,resolve_date)-datediff(week,issue_date,resolve_date)*2 as actualdays from ticket
)
select ticket_id,issue_date,resolve_date,actualdays-count(occasion) as finalworkingdays from cte a left join holiday_cal b
on b.holiday_date between a.issue_date and a.resolve_date
group by ticket_id,issue_date,resolve_date,actualdays