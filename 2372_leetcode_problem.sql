select a.salespersonid,a.name,coalesce(sum(price),0) as total  from salesperson a left join customer b
on a.salespersonid=b.salespersonid
left join  sales3 c
on b.customerid=c.customerid
group by a.salespersonid,a.name
