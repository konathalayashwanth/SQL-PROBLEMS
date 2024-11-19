select * from product

select * from sales


--Q sql query that reports  the best seller by total sales price if there is a tie report them all.


with cte as
(
	select seller_id,sum(price) as total_price
	from sales
	group by seller_id
)
select seller_id from 
cte 
where total_price in (select max(total_price) from cte)