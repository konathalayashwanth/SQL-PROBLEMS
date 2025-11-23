/* Write your T-SQL query statement below */


select
customer_id
from customer_transactions
group by customer_id
having count(case when transaction_type='purchase' then 1 end)>=3 and 
count(case when transaction_type='refund' then 1 end)*1.0/count(*)*100 < 20 and
datediff(day,min(transaction_date),max(transaction_date))>=30
