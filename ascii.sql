use indianbank




create table friends1
(
   friend1 varchar(max) not null,
   friend2  varchar(max) not null
)
go



drop table friends1


insert into friends1 values
('Robin'   ,'Rahul'),
('prithvi'   ,'Rahul'),
('john'    ,'Rahul'),
('Rahul    ','Robin'),
('Rahul'   ,'Robin'),
('Rahul'   ,'Prithvi'),
('Rahul'   ,'John')

select friend1,friend2,count(*) as cnt from
(
select friend1,friend2 from friends1
union all
select friend2,friend1 from friends1
) as k
group by friend1,friend2


with cte as
(
select *,case when friend1<friend2 then friend2 else friend1 end as friendA,
		 case when friend1<friend2 then friend1 else friend2 end as friendB
		 from friends1
)
select friend1,friend2,DENSE_RANK() over(order by friendA,friendB) as dn from cte