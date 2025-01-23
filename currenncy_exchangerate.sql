select * from exchange_rates

with cte as
(
select *,year(date) as year,month(date) as month from exchange_rates
),cte2 as
(
select concat(currency_code,'_',year,'_',month) as currency_year_month,month,
min(currency_exchange_rate) as currency_exchange_rate_beginningofmonth,max(currency_exchange_rate) as currency_exchange_rate_endingofmonth 
from cte
group by  concat(currency_code,'_',year,'_',month) ,month
)
select currency_year_month,currency_exchange_rate_beginningofmonth,currency_exchange_rate_endingofmonth 
from cte2