/* Write your T-SQL query statement below */
select product_id,
first_value(new_price) over(partition by product_id order by change_date desc) as price
from products
where change_date<='2019-08-16'
union
select product_id,
'10' as price
from products
group by product_id
having min(change_date)>'2019-08-16'