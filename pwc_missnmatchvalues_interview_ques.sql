create table sources(
sid int, 
sname varchar(50)
);
create table targets(
tid int, 
tname varchar(50)
);
insert into sources values(1,'A'),(2,'B'),(3,'C'),(4,'D');
insert into targets values(1,'A'),(2,'B'),(4,'X'),(5,'F');
select * from sources;
select * from targets; 

with cte as
(
select * from sources full  join targets
on sources.sid=targets.tid
),cte2 as
(
select sid,tid,
case when sid is not null and tid is null then 'newinsource'
     when sid is null and tid is not null then 'newinsource'
	 when sid=tid and sname<>tname then 'missmatch'
	 else 'ok'
	 end as review
	 from cte
	)
select coalesce(sid,tid) as id, review
from cte2
where review<>'ok'