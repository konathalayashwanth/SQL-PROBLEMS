with cte as
(
select visited_on,sum(amount) as totalamount
from customer
group by visited_on
)
select 
visited_on,
sum(totalamount)  over(order by visited_on rows between 6 preceding and current row) as amount,
round(avg(totalamount * 1.0) over(order by visited_on rows between 6 preceding and current row),2) as average_amount
from cte
order by visited_on 
offset 6 rows;