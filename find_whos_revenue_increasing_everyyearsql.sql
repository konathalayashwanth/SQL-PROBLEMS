use indianbank

create table company_info(company_name varchar(10),year_cal int,revenue int)

insert into company_info values('x',2020,100)
insert into company_info values('x',2021,90)
insert into company_info values('x',2022,120)
insert into company_info values('y',2020,100)
insert into company_info values('y',2021,100)
insert into company_info values('z',2020,100)
insert into company_info values('z',2021,120)
insert into company_info values('z',2022,130)



with cte as
(
select *,
lead(revenue,1,revenue) over(partition by company_name order by year_cal asc) as next_revenue,
lead(revenue,1,revenue) over(partition by company_name order by year_cal asc)-revenue as rev_diff
from company_info
)
select company_name,year_cal,revenue from cte
where company_name  not in
( select company_name from cte where rev_diff<0)
