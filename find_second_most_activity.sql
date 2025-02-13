use indianbank


select * from useractivity


create table useractivity
(
   username			varchar(20)    not null,
   activity			varchar(20)    not null,
   startdate		date			not null,
   enddate			date			not null
)
go


insert into useractivity values('amy','travel','2020-02-12','2020-02-20'),
								('amy','dancing','2020-02-21','2020-02-23'),
								('amy','travel','2020-02-24','2020-02-28'),
								('joe','travel','2020-02-11','2020-02-18'),
								('adam','travel','2020-02-12','2020-02-20'),
								('adam','dancing','2020-02-21','2020-02-23'),
								('adam','singing','2020-02-24','2020-02-28'),
								('adam','travel','2020-03-01','2020-03-28')


---Q find second most activity by user..

select * from useractivity

with cte as
(
select *,row_number() over(partition by username order by startdate asc) as rn,
		count(*) over(partition by username order by startdate asc range between unbounded preceding and unbounded following) as cnt
from useractivity
)
select username,activity,startdate,enddate from cte
where rn=case when cnt=1 then 1 else cnt-1 end;