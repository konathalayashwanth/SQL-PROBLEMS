create table purchases12
(
   userid  int,
   productid  int,
   quantity   int,
   purchasedate  datetime
)


insert into purchases12 values(536,3223,6,'01/11/2022 12:33:44'),
							  (827,3585,35,'02/20/2022 14:05:26'),
							  (536,3223,5,'03/02/2022 09:33:28'),
							  (536,1435,10,'03/02/2022 08:40:00'),
							  (827,2435,45,'04/09/2022 00:00:00')



select * from purchases12

--Q write aquery to obtain the number of users who purchases the some product on two or more different days

select userid,productid,count(*) as buyedproducts
from purchases12
group by userid,productid
having count(distinct purchasedate)>1
