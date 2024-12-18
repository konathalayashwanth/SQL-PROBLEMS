select * from accounts1


select * from transactions2



--------query

with cte as
(
select 
transactionid,accountid,month(day) as onemonth,sum(amount) as totalincome  
from transactions2
where type='creditor'
group by transactionid,accountid,month(day)
),cte2 as
(
  select  a.*,b.maxincome,lead(onemonth) over(partition by a.accountid order by onemonth) as nextmonth 
 from cte a inner join accounts1 b
 on a.accountid=b.accountid
 where totalincome>maxincome
 )
 select accountid
 from cte2 
 where nextmonth-onemonth=1
 order by transactionid asc;
 
 

 


