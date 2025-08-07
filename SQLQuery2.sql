create table student1
(
   studentid  int,
   studentname  varchar(10),
   gender       varchar(1),
   deptid       int
   )
   go

create table department1
(
   deptid       int,
   deptname     varchar(20)
   )
   go

---Q
select * from
(
select d.deptname,sum(case when s.deptid is not null then 1 else 0 end ) as studentnumber
from department1 d left join student1 s
on d.deptid=s.deptid
group by d.deptname
) as k
order by 2 desc;
