--q find the firstpurchase date and secondpurchasewithin 7days,after that no purchase ..?


select user_id,
min(order_date) as firstorderdate,
max(order_date) as secondorderdate,
datediff(dd,min(order_date),max(order_date)) as daysdiff
from orders
group by user_id
having count(*)=2 and datediff(dd,min(order_date),max(order_date))<=7


