create table travel_items
(
id              int,
item_name       varchar(50),
total_count     int
);
insert into travel_items values
(1, 'Water Bottle', 2),
(2, 'Tent', 1),
(3, 'Apple', 4);


select * from travel_items

with cte as
(
select id,item_name,total_count,1 as level 
from travel_items
union all
select cte.id,cte.item_name,cte.total_count-1,level+1 as level
from cte join travel_items t
on cte.item_name=t.item_name and cte.id=t.id
where cte.total_count>1
)
select id,item_name from cte
order by id


