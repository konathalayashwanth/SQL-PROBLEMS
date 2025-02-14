use indianbank


create table lift
(
   id    int     not null,
   capactity_kg   int   not null
)
go



insert into lift values(1,300),(2,350)


create table lift_passengers
(
   passenger_name      varchar(20)   not null,
   weight_kg			int        not null,
   lift_id				int			not null
)
go



insert into lift_passengers values('rahul',85,1),
								  ('Adarsh',73,1),
								  ('riti',95,1),
								  ('dheeraj',80,1),
								  ('vimal',83,2),
								  ('neha',77,2),
								  ('priti',73,2),
								  ('himanshi',85,2)


select * from lift_passengers


select * from lift

with cte as
(
select *,sum(weight_kg) over(partition by id order by lift_id,weight_kg) as cumulativesum,
case when L.capactity_kg>=sum(weight_kg) over(partition by id order by lift_id,weight_kg) then 1 else 0 end as flag
from lift L join lift_passengers  p
on L.id=P.lift_id
)
select lift_id,string_agg(passenger_name,',') as name from cte 
where flag=1
group by lift_id

								