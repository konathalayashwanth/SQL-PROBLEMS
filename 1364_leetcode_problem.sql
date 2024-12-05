select * from customers1

select * from contacts

select * from invoices



with cte1 as
(
select invoiceid,customername,price,user_id from customers1 a left join invoices b
on
a.customerid=b.user_id
),cte2 as
(
select userid,count(*) as cnt from contacts
group by userid
),cte3 as
(
select userid,count(*) as tct from customers1 a right join contacts b
on
a.customername=b.contactname
group by userid
)
select invoiceid,customername,price,coalesce(cnt,0) as contactslist,coalesce(tct,0) as trustifiedcontacts
from cte1 left join cte2 
on
cte1.user_id=cte2.userid
left join cte3 
on
cte1.user_id=cte3.userid
order by invoiceid



