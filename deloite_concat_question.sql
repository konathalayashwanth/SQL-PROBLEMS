create table country2
( 
   countryname		varchar(10)    not null
)
go


insert into country2 values('ind'),('sl'),('pak'),('ban');


select * from country2

with cte
as
(
select *,row_number() over(order by (select null)) as rn 
from country2
)
select concat(a.countryname,'-',b.countryname) as battlematch from 
cte a join  cte b
on a.rn<b.rn
