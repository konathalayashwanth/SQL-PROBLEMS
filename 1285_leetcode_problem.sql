create table logs
(
	log_id     int not null
)
go


insert into logs values(1)
insert into logs values(2)
insert into logs values(3)
insert into logs values(7)
insert into logs values(8)
insert into logs values(10)



--
with cte as
(
select log_id,log_id-row_number() over(order by log_id) as rk
from logs
)
select min(log_id) as start_id,max(log_id) as end_id
from cte
group by rk