


with cte as
(
select format(trans_date,'yyyy-MM') as month,
country,
count(case when state='approved' then 1  end) as approved_count,
sum(case when state='approved' then amount end) as approved_amount
from transactions45
group by format(trans_date,'yyyy-MM'),country
),cte2 as
(
select format(c.trans_date,'yyyy-MM') as month,
count(*) as chargeback_count,
sum(amount) as chargeback_amount
from transactions45 t inner join chargebacks c
on t.id=c.trans_id
group by format(c.trans_date,'yyyy-MM')
)
select cte2.month,
coalesce(country,'US') as country,
coalesce(cte.approved_count,0) as approvedcount,
coalesce(cte.approved_amount,0) as approved_amount,
cte2.chargeback_count,
cte2.chargeback_amount
from cte2 left join cte
on cte.month=cte2.month