use indianbank


---Q customer retention and  customer churn metrics

--customerretension

--customer retwension refers to a company's ability to make customers repeat customers and prevent them from switching to  a compititor


--problem 

--jan --0

--feb 1,2,3(custids)


select month(thismonth.order_date) as month,
       count (distinct lastmonth.cust_id) as noofcustomers
from transactions thismonth left join  transactions lastmonth
on thismonth.cust_id=lastmonth.cust_id and datediff(MONTH,lastmonth.order_date,thismonth.order_date)=1
group by month(thismonth.order_date)


