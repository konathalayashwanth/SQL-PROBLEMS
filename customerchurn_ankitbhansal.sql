---customer churn

---find the customers who bought the product lastmonth but not this month


select month(lastmonth.order_date) as month,
       count (distinct lastmonth.cust_id) as noofcustomers
from transactions lastmonth left join  transactions thismonth
on thismonth.cust_id=lastmonth.cust_id and datediff(MONTH,lastmonth.order_date,thismonth.order_date)=1
where thismonth.cust_id is null
group by month(lastmonth.order_date)