create table src_dest_dis
(
   source   varchar(1)    not null,
   destination  varchar(1)    not null,
   distance		int				 not null
)
go



insert into src_dest_dis values('A','B',21),
								('B','A',28),
								('A','B',19),
								('C','D',15),
								('C','D',17),
								('D','C',16.5),
								('D','C',18)

with cte as
(
select source,destination,sum(distance) as totaldist,count(*) as totalcnt,
				row_number() over(order by source) as rn
from src_dest_dis
group by source,destination
)
select t1.source,t1.destination,(t1.totaldist+t2.totaldist)/(t1.totalcnt+t2.totalcnt) averagedistance
from cte t1 join cte t2
on t1.source=t2.destination and t1.rn<t2.rn