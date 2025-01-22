create table products6 (pid int, pname varchar(50), price int)
insert into products6 values (1, 'A', 1000),(2, 'B', 400),(3, 'C', 500);

create table transcations (pid int, sold_date DATE, qty int, amount int)
insert into transcations values (1, '2024-02-01', 2, 2000),(1, '2024-03-01', 4, 4000),
(1, '2024-03-15', 2, 2000),(3, '2024-04-24', 3, 1500),(3, '2024-05-16', 5, 2500);


select * from products6

select * from transcations

with productsales as
(
select a.pid,pname,year(sold_date) as year,month(sold_date) as month,coalesce(sum(amount),0) as totalsales
from products6 a left join transcations b on a.pid=b.pid
group by a.pid,pname,year(sold_date),month(sold_date)
),allmonths as
(
select years.year,months.month from (values (2024)) as years(year)
cross apply
(values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12)) as months(month)
)
select b.pid,b.pname,am.year,am.month,coalesce(totalsales,0) as totalsales from allmonths am  cross join products6 b
left join productsales c on c.pid=b.pid and c.pname=b.pname and c.year=am.year and c.month=am.month