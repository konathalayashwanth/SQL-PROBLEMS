create table MoM(id int, created_at date, amount int, pur_id int)

insert into MoM values(1,'01-01-2024',1000,101)
insert into MoM values(2,'01-10-2024',1500,102)
insert into MoM values(3,'01-15-2024',1200,103)
insert into MoM values(4,'01-25-2024',1000,104)
insert into MoM values(5,'02-01-2024',1500,105)
insert into MoM values(6,'02-08-2024',2000,106)
insert into MoM values(7,'02-18-2024',1200,107)
insert into MoM values(8,'02-27-2024',1000,108)
insert into MoM values(9,'03-02-2024',1500,109)
insert into MoM values(10,'03-10-2024',2200,110)
insert into MoM values(11,'03-20-2024',1100,111)
insert into MoM values(12,'03-31-2024',800,112)

select * from MoM


with cte as
(
select format(created_at,'MM-yyyy') as date,sum(amount) as totalamount
from MoM
group by  format(created_at,'MM-yyyy')
)
select date,totalamount,coalesce(lag(totalamount) over(order by date),0) as lag,
coalesce(round(cast(totalamount-lag(totalamount) over(order by date) as float)/lag(totalamount) over(order by date)*100,2),0) as mompercentage
from cte